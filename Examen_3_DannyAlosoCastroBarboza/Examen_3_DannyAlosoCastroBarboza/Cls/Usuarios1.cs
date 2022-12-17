using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;

namespace Examen_3_DannyAlosoCastroBarboza.Cls
{
    public class Usuarios1
    {
        public static int codigo { get; set; }
        public static string usuario { get; set; }
        public static string clave { get; set; }
        public static string nombre { get; set; }
        public static string apellido { get; set; }



        public static int Getcodigo()
        {
            return codigo;
        }
        public static void Setcodigo(int Codigo)
        {
            codigo = Codigo;
        }
        public static string Getclave()
        {
            return clave;
        }
        public static void Setclave(string Clave)
        {
            clave = Clave;
        }
        public static string Getnombre()
        {
            return nombre;
        }
        public static void Setnombre(string Nombre)
        {
            nombre = Nombre;
        }
        public static string Getapellido()
        {
            return apellido;
        }
        public static void Setapellido(string Apellido)
        {
            apellido = Apellido;
        }
      


        public static int ValidarUsuario()
        {
            int retorno = 0;



            SqlConnection Conn = new SqlConnection();
            try
            {
                using (Conn = DBConn.obtenerConexion())
                {
                    SqlCommand cmd = new SqlCommand("ValidarUsuario", Conn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    cmd.Parameters.Add(new SqlParameter("@Usuario", usuario));
                    cmd.Parameters.Add(new SqlParameter("@Clave", clave));

                    // retorno = cmd.ExecuteNonQuery();
                    using (SqlDataReader rdr = cmd.ExecuteReader())
                    {
                        if (rdr.Read())
                        {
                            retorno = 1;
                            nombre = rdr[0].ToString();
                         //   tipo = rdr[2].ToString();

                        }

                    }


                }
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                retorno = -1;
            }
            finally
            {
                Conn.Close();
                Conn.Dispose();
            }

            return retorno;


        }

        public static int InsertarUsuario()
        {
            int retorno = 0;

            SqlConnection Conn = new SqlConnection();

            try
            {
                using (Conn = DBConn.obtenerConexion())
                {
                    SqlCommand cmd = new SqlCommand("InsertarUsuario", Conn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    cmd.Parameters.Add(new SqlParameter("@Usuario", usuario));
                    cmd.Parameters.Add(new SqlParameter("@Clave", clave));
                    cmd.Parameters.Add(new SqlParameter("@Nombre", nombre));
                    cmd.Parameters.Add(new SqlParameter("@Apellido", apellido));

                    retorno = cmd.ExecuteNonQuery();

                }
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                retorno = -1;
            }
            finally
            {
                Conn.Close();
            }

            return retorno;





        }


        public static int Eliminar()
        {
            int retorno = 0;

            SqlConnection Conn = new SqlConnection();

            try
            {
                using (Conn = DBConn.obtenerConexion())
                {
                    SqlCommand cmd = new SqlCommand("BorrarUsuario", Conn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    cmd.Parameters.Add(new SqlParameter("Nombre", Usuarios1.nombre));

                    retorno = cmd.ExecuteNonQuery();
                    string jscript = "<script>alert('YOUR BUTTON HAS BEEN CLICKED')</script>";

                }
            }
            catch (System.Data.SqlClient.SqlException ex)
            {
                retorno = -1;
            }
            finally
            {
                Conn.Close();
            }
            return retorno;
        }

        public static int Modificar()
        {
            int retorno = 0;

            SqlConnection Conn = new SqlConnection();
            try
            {
                using (Conn = DBConn.obtenerConexion())
                {
                    SqlCommand cmd = new SqlCommand("ActualizarUsuario", Conn)
                    {
                        CommandType = CommandType.StoredProcedure
                    };
                    cmd.Parameters.Add(new SqlParameter("@Usuario", usuario));
                    cmd.Parameters.Add(new SqlParameter("@Clave", clave));
                    cmd.Parameters.Add(new SqlParameter("@Nombre", nombre));
                    cmd.Parameters.Add(new SqlParameter("@Apellido", apellido));
                    retorno = cmd.ExecuteNonQuery();
                }
            }
            catch (Exception)
            {
                retorno = -1;
            }
            finally
            {
                Conn.Close();
            }

            return retorno;
        }
    }
}