using System;
using System.Net.Http;
using System.Text;
using ITPItemExchange.Models;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;

namespace ITPItemExchange
{
    public partial class wpLogin : System.Web.UI.Page
    {
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            // Crea un objeto con las credenciales ingresadas por el usuario
            var login = new
            {
                no_control = txtNoControl.Text,
                correo = txtCorreo.Text
            };

            var json = JsonConvert.SerializeObject(login);
            var content = new StringContent(json, Encoding.UTF8, "application/json");
            var response = ApiHelper.Client.PostAsync("api/login", content).Result;

            if (response.IsSuccessStatusCode)
            {
               // Si la API responde con éxito, lee y parsea el resultado JSON
                var jsonResult = response.Content.ReadAsStringAsync().Result;
                var data = JArray.Parse(jsonResult);

                if (data.Count == 0)
                {
                    // Si la lista está vacía, el usuario no está registrado
                    lblMensaje.Visible = true;
                    lblMensaje.Text = "Alumno no registrado en el sistema.";
                    return;
                }
                // Extrae los datos del primer usuario devuelto por la API
                var user = data[0];
                // Guarda los datos del usuario en variables de sesión
                Session["id"] = user["id"];
                Session["nombre"] = user["nombre"];
                Session["correo"] = user["correo"];
                Session["no_control"] = user["no_control"];
                Session["carrera"] = user["carrera"];
                Session["ubicacion"] = user["ubicacion"];
                Session["horario"] = user["horario_disponible"];
                Session["usuario"] = true;

                Response.Redirect("wpInicio.aspx", false);
                // Finaliza el ciclo de vida de la solicitud actual sin ejecutar eventos posteriores
                Context.ApplicationInstance.CompleteRequest();
            }
            else
            {
                // Si la respuesta de la API indica error, mostrar mensaje de credenciales incorrectas
                lblMensaje.Visible = true;
                lblMensaje.Text = "Credenciales incorrectas.";
            }
        }
    }
}
