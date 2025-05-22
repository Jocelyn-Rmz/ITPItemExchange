using System;
using System.Net.Http;
using System.Text;
using Newtonsoft.Json;
using ITPItemExchange.Models;
using System.Web.UI;

namespace ITPItemExchange
{
    public partial class wpPrestamo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usuario"] == null)
            {
                Response.Redirect("wpLogin.aspx");
                return;
            }
            // En la primera carga, muestra el nombre del alumno
            if (!IsPostBack)
            {
                lblUsuario.Text = "Registrando préstamo como: " + Session["nombre"];
            }
        }
        // Se ejecuta cuando se hace clic en el botón "Registrar"
        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            try
            {
                // Crear el objeto préstamo con los datos del formulario
                var prestamo = new
                {
                    item_id = int.Parse(txtItemId.Text),
                    alumno_receptor_id = Convert.ToInt32(Session["id"]),
                    lugar_entrega = txtLugar.Text
                };

                var json = JsonConvert.SerializeObject(prestamo);
                var content = new StringContent(json, Encoding.UTF8, "application/json");
                var response = ApiHelper.Client.PostAsync("api/prestamo", content).Result;
                
                // Leer y deserializar la respuesta JSON
                string respuestaJson = response.Content.ReadAsStringAsync().Result;
                dynamic resultado = JsonConvert.DeserializeObject(respuestaJson);
                
                // Extraer mensaje y código de resultado
                string mensaje = resultado?.message ?? "Sin mensaje recibido";
                int code = resultado?.code ?? 0;

                // Mostrar resultado en la interfaz
                lblMensaje.Visible = true;
                lblMensaje.Text = mensaje;
                lblMensaje.CssClass = (code == 1) ? "text-primary fw-bold" : "text-danger fw-bold";
            }
            catch (Exception ex)
            {
                // En caso de error inesperado, mostrar mensaje de error
                lblMensaje.Visible = true;
                lblMensaje.CssClass = "text-danger fw-bold";
                lblMensaje.Text = "Error inesperado: " + ex.Message;
            }
        }
    }
}
