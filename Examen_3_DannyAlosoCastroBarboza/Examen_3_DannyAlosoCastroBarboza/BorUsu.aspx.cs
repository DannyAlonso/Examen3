using Examen_3_DannyAlosoCastroBarboza.Cls;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Examen_3_DannyAlosoCastroBarboza
{
    public partial class BorUsu : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Bingresar_Click(object sender, EventArgs e)
        {
            Usuarios1.nombre = Tnombre.Text;


            if (Usuarios1.Eliminar() > 0)
            {
                Lmensaje.Text = "Usuario eliminado con exito.";
            }
            else
            {
                Lmensaje.Text = "Error de borrar usuario!!.";

            }
            limpiarCampos();
            llenarGrid();

        }
        protected void llenarGrid()
        {
            string constr = ConfigurationManager.ConnectionStrings["peajesConnectionString1"].ConnectionString;
            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand(" select * from Usuarios"))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = con;
                        sda.SelectCommand = cmd;
                        using (DataTable dt = new DataTable())
                        {

                            GridView1.DataBind();// refrescar el grid 
                        }

                    }

                }
            }

        }

        public void limpiarCampos()
        {
          
            Tnombre.Text = "";


        }
    }
    
}