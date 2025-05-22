using System;
using System.Net.Http;
using System.Text;
using ITPItemExchange.Models;
using Newtonsoft.Json;

namespace ITPItemExchange
{
    public partial class wpItem : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Verifica si el usuario está autenticado
            if (Session["usuario"] == null)
            {
                Response.Redirect("wpLogin.aspx");
                return;
            }

            if (!IsPostBack)
                lblUsuario.Text = "Registrando como: " + Session["nombre"];
        }
        // Evento que se ejecuta al hacer clic en el botón "Registrar"
        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            try
            {
                string rutaImagen = "";

                // Verifica si se ha seleccionado una imagen
                if (fuImagen.HasFile)
                {
                    // Obtiene el nombre del archivo subido
                    string nombreArchivo = System.IO.Path.GetFileName(fuImagen.FileName);
                    
                    // Ruta relativa para guardar la imagen
                    rutaImagen = "imagenes/" + nombreArchivo;
                    
                    // Ruta física en el servidor donde se guarda la imagen
                    string rutaServidor = Server.MapPath("~/" + rutaImagen);
                    
                    // Guarda el archivo en el servidor
                    fuImagen.SaveAs(rutaServidor);
                }

                // Crea el objeto con los datos del ítem
                var item = new
                {
                    nombre = txtNombre.Text,
                    descripcion = txtDescripcion.Text,
                    imagen = rutaImagen,
                    alumno_id = Convert.ToInt32(Session["id"])
                };

                var json = JsonConvert.SerializeObject(item);
                var content = new StringContent(json, Encoding.UTF8, "application/json");
                var response = ApiHelper.Client.PostAsync("api/item", content).Result;

                // Muestra mensaje en pantalla según el resultado
                lblMensaje.Visible = true;
                lblMensaje.Text = response.IsSuccessStatusCode
                    ? "Ítem registrado correctamente"
                    : "Error al registrar ítem. Código: " + response.StatusCode;
            }
            catch (Exception ex)
            {
                lblMensaje.Visible = true;
                lblMensaje.Text = "Error de conexión: " + ex.Message;
            }
        }

    }
}