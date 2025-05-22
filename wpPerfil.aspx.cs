using System;
using System.Net.Http;
using System.Text;
using Newtonsoft.Json;
using ITPItemExchange.Models;

namespace ITPItemExchange
{
    public partial class wpPerfil : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usuario"] == null)
            {
                Response.Redirect("wpLogin.aspx");
                return;
            }
            // Solo en la primera carga de página, muestra los datos desde la sesión
            if (!IsPostBack)
            {
                txtNombre.Text = Session["nombre"] != null ? Session["nombre"].ToString() : "";
                txtCorreo.Text = Session["correo"] != null ? Session["correo"].ToString() : "";
                txtCarrera.Text = Session["carrera"] != null ? Session["carrera"].ToString() : "";
                txtUbicacion.Text = Session["ubicacion"] != null ? Session["ubicacion"].ToString() : "";
                txtHorario.Text = Session["horario"] != null ? Session["horario"].ToString() : "";
                txtNoControl.Text = Session["no_control"] != null ? Session["no_control"].ToString() : "";

            }
        }

        // Se ejecuta cuando se hace clic en el botón "Actualizar"
        protected void btnActualizar_Click(object sender, EventArgs e)
        {
            // Obtiene el ID del alumno desde la sesión
            int id = Convert.ToInt32(Session["id"]);

            // Crea un objeto con los datos actualizados
            var alumno = new
            {
                nombre = txtNombre.Text,
                correo = txtCorreo.Text,
                carrera = txtCarrera.Text,
                ubicacion = txtUbicacion.Text,
                horario_disponible = txtHorario.Text
            };

            var json = JsonConvert.SerializeObject(alumno);
            var content = new StringContent(json, Encoding.UTF8, "application/json");
            // Envía la solicitud PUT a la API para actualizar los datos del alumno
            var response = ApiHelper.Client.PutAsync("api/alumno/" + id, content).Result;

            if (response.IsSuccessStatusCode)
            {
                lblMensaje.Visible = true;
                lblMensaje.Text = "Datos actualizados correctamente.";

                // Actualizar sesión con los nuevos datos
                Session["nombre"] = txtNombre.Text;
                Session["correo"] = txtCorreo.Text;
                Session["carrera"] = txtCarrera.Text;
                Session["ubicacion"] = txtUbicacion.Text;
                Session["horario"] = txtHorario.Text;
            }
            else
            {
                lblMensaje.Visible = true;
                lblMensaje.Text = "Error al actualizar datos.";
            }
        }
    }
}
