using System;

namespace ITPItemExchange
{
    public partial class wpLogout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Elimina todas las variables de sesión del usuario
            Session.Clear();

            // Marca la sesión actual para ser abandonada
            Session.Abandon();

            Response.Redirect("Default.aspx");
        }
    }
}
