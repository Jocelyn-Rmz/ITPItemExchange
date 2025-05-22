using System;

namespace ITPItemExchange
{
    public partial class mpPrincipal : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            bool logueado = Session["usuario"] != null;
            phMenuUsuario.Visible = logueado;
            phInicio.Visible = !logueado;
        }
    }
}
