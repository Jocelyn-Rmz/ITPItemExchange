using System;
using System.Data;
using System.Net.Http;
using Newtonsoft.Json;
using ITPItemExchange.Models;

namespace ITPItemExchange
{
    public partial class wpVerItems : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                try
                {
                    // Solicitud GET a la API para obtener ítems disponibles
                    var response = ApiHelper.Client.GetAsync("api/items_disponibles").Result;
                    if (response.IsSuccessStatusCode)
                    {
                        string json = response.Content.ReadAsStringAsync().Result;

                        // Mostrar JSON para depuración
                        System.Diagnostics.Debug.WriteLine("JSON recibido:\n" + json);
                        
                        // Convertir el JSON en un DataTable
                        DataTable dt = JsonConvert.DeserializeObject<DataTable>(json);
                        
                        // Enlazar los datos al GridView
                        gvItems.DataSource = dt;
                        gvItems.DataBind();
                    }
                    else
                    {
                        // Si la respuesta no fue exitosa, lanzar excepción con código
                        throw new Exception("Error al obtener ítems. Código: " + response.StatusCode);
                    }
                }
                catch (Exception ex)
                {
                    // Mostrar error en una alerta de JavaScript
                    Response.Write("<script>alert('Error: " + ex.Message.Replace("'", "\\'") + "');</script>");
                }
            }
        }
    }
}
