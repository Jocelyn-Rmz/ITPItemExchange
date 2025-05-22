using System;

namespace ITPItemExchange
{
    public partial class wpInicio : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Verifica si el usuario no ha iniciado sesión
            if (Session["usuario"] == null)
                Response.Redirect("wpLogin.aspx");
            // Solo se ejecuta la primera vez que se carga la página (no en postbacks)
            if (!IsPostBack)
                lblNombre.Text = Session["nombre"].ToString();
        }
    }
}
