using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace ProyectoInvestigacion.Models
{
    public class UsuarioMantenimiento
    {
        private static string cadena = ConfigurationManager.ConnectionStrings["Conexion"].ToString();

        public static string ObtenerRol(int id)
        {
            string rol;
            using (SqlConnection conn = new SqlConnection(cadena))
                {
                    SqlCommand cmd = new SqlCommand("sp_GetRol", conn);
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Id", id);
                    conn.Open();
                    rol = cmd.ExecuteScalar().ToString();
                }
            
            return rol;
        }
    }
}