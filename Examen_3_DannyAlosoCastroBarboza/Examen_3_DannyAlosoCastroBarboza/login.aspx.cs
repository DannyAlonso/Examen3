using Examen_3_DannyAlosoCastroBarboza.Cls;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Examen_3_DannyAlosoCastroBarboza
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Bingresar_Click(object sender, EventArgs e)
        {
            Usuarios1.usuario = Tusuario.Text;
            Usuarios1.clave = Tclave.Text;



            if (Usuarios1.ValidarUsuario() > 0)
            {

                Response.Redirect("Inicio.aspx");
            }
            else
            {
                Response.Redirect("Distrito.aspx");
            }

            }
          
        
    }
}