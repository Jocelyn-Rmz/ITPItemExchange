using System;
using System.Net.Http;
using System.Text;
using Newtonsoft.Json;
using ITPItemExchange.Models;

namespace ITPItemExchange
{
    public partial class wpAlumno : System.Web.UI.Page
    {
        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            try
            {
                // Crear un objeto anónimo con los datos ingresados en el formulario
                var alumno = new
                {
                    nombre = txtNombre.Text,
                    no_control = txtNoControl.Text,
                    correo = txtCorreo.Text,
                    carrera = txtCarrera.Text,
                    ubicacion = txtUbicacion.Text,
                    horario_disponible = txtHorario.Text
                };

                // Serializar el objeto alumno a formato JSON
                var json = JsonConvert.SerializeObject(alumno);

                // Crear el contenido HTTP con el JSON y codificación UTF-8
                var content = new StringContent(json, Encoding.UTF8, "application/json");

                // Enviar la solicitud POST a la API para registrar el alumno
                var response = ApiHelper.Client.PostAsync("api/alumno", content).Result;
                
                // Leer la respuesta JSON devuelta por la API
                string respuestaJson = response.Content.ReadAsStringAsync().Result;
                dynamic resultado = JsonConvert.DeserializeObject(respuestaJson);
                
                // Mostrar el mensaje en la etiqueta lblMensaje con estilo apropiado
                string mensaje = resultado?.message ?? "Sin mensaje recibido";
                int code = resultado?.code ?? 0;
                
                // Mostrar el mensaje en la etiqueta lblMensaje con estilo apropiado
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