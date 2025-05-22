using System;
using System.Data;
using System.Net.Http;
using Newtonsoft.Json;
using ITPItemExchange.Models;
using System.Web.UI;
using System.Text;
using System.Web.UI.WebControls;

namespace ITPItemExchange
{
    public partial class wpHistorial : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Redirige al login si no hay sesión iniciada
            if (Session["usuario"] == null)
            {
                Response.Redirect("wpLogin.aspx");
                return;
            }
            // Solo cargar los datos al cargar por primera vez (no en postbacks)
            if (!IsPostBack)
                CargarHistorial();
            CargarDevueltos();
        }

        // Método para cargar historial de ítems actualmente prestados
        private void CargarHistorial()
        {
            try
            {
                int alumnoId = Convert.ToInt32(Session["id"]);
                var response = ApiHelper.Client.GetAsync("api/historial/" + alumnoId).Result;

                if (response.IsSuccessStatusCode)
                {
                    // Deserializar JSON a DataTable y enlazar al GridView
                    string json = response.Content.ReadAsStringAsync().Result;
                    DataTable dt = JsonConvert.DeserializeObject<DataTable>(json);
                    gvHistorial.DataSource = dt;
                    gvHistorial.DataBind();
                }
                else
                {
                    throw new Exception("Error al obtener historial. Código: " + response.StatusCode);
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error: " + ex.Message.Replace("'", "\\'") + "');</script>");
            }
        }

        // Evento que se dispara al hacer clic en un botón dentro del GridView (por ejemplo, devolver ítem)
        protected void gvHistorial_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Devolver")
            {
                // Obtener el ID del ítem a devolver desde el CommandArgument
                int itemId = Convert.ToInt32(e.CommandArgument);

                // Serializar el ID del ítem a JSON
                var json = JsonConvert.SerializeObject(new { id = itemId });
                var content = new StringContent(json, Encoding.UTF8, "application/json");

                // Llamar al endpoint de la API para devolver el ítem
                var response = ApiHelper.Client.PutAsync("api/devolver", content).Result;

                if (response.IsSuccessStatusCode)
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "alert", "alert('Ítem devuelto correctamente.');", true);
                    CargarHistorial(); // se recarga y se elimina porque la vista ya no lo contiene
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "alert", @"alert('Error al devolver el ítem.');", true);
                }
            }
        }

        // Método para cargar ítems que ya han sido devueltos por el alumno
        private void CargarDevueltos()
        {
            try
            {
                int alumnoId = Convert.ToInt32(Session["id"]);
                var response = ApiHelper.Client.GetAsync("api/devueltos/" + alumnoId).Result;

                if (response.IsSuccessStatusCode)
                {

                    // Deserializar JSON a DataTable y enlazar al GridView
                    string json = response.Content.ReadAsStringAsync().Result;
                    DataTable dt = JsonConvert.DeserializeObject<DataTable>(json);
                    gvDevueltos.DataSource = dt;
                    gvDevueltos.DataBind();
                }
                else
                {
                    throw new Exception("Error al obtener devoluciones. Código: " + response.StatusCode);
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Error: " + ex.Message.Replace("'", "\\'") + "');</script>");
            }
        }

    }
}
