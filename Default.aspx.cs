using System;

namespace ITPItemExchange
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
            {

            // Verifica si la sesión contiene un usuario autenticado
            bool logueado = Session["usuario"] != null;
            var master = (mpPrincipal)this.Master;

            if (master != null)
            {
                // Muestra el menú del usuario si hay sesión iniciada
                master.FindControl("phMenuUsuario").Visible = logueado;

                // Muestra el contenido para visitantes(inicio) si no hay sesión
                master.FindControl("phInicio").Visible = !logueado;
            }
        }
    }
}