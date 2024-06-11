using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Configuration;

namespace ProyectoInvestigacion.Models
{
    public class ReservacionesMantenimiento
    {
        private static string cadena = ConfigurationManager.ConnectionStrings["Conexion"].ToString();


        public static int InsertarReservacion(Reservaciones reservaciones)
        {
            int i;
            try
            {
                using(SqlConnection con = new SqlConnection(cadena))
                {
                    SqlCommand cmd = new SqlCommand("sp_InsertarReservaciones", con);
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@ID_Usuario",reservaciones.ID_Usuario);
                    cmd.Parameters.AddWithValue("@ID_Viaje", reservaciones.ID_Viaje);
                    cmd.Parameters.AddWithValue("@Nombre_Reservacion", reservaciones.Nombre_Reservacion);
                    cmd.Parameters.AddWithValue("@Precio", reservaciones.Precio);
                    cmd.Parameters.AddWithValue("@Fecha_Inicio", reservaciones.Fecha_Inicio);
                    cmd.Parameters.AddWithValue("@Fecha_Final", reservaciones.Fecha_Final);


                    con.Open();
                    i =  cmd.ExecuteNonQuery();
                }
                return i;

            }catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                i = 0;
                return i;
            }
        }

        public static List<HistorialReservaciones> Historial(int id)
        {
            List<HistorialReservaciones> historialReservaciones = new List<HistorialReservaciones>();
            try
            {
                using (SqlConnection conn = new SqlConnection(cadena))
                {
                    SqlCommand cmd = new SqlCommand("sp_historialReservaciones", conn);
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@id",id);
                    conn.Open();
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            HistorialReservaciones historialReservaciones1 = new HistorialReservaciones()
                            {
                                Id = Int32.Parse(reader["ID_Reservacion"].ToString()),
                                Nombre = reader["Nombre_Viaje"].ToString(),
                                Id_Viaje = Int32.Parse(reader["ID_Viaje"].ToString()),
                                PersonaReservacion = reader["Nombre_Reservacion"].ToString(),
                                Precio = Convert.ToDouble(reader["precio"].ToString()),
                                Fecha_Inicio = DateTime.Parse(reader["Fecha_Inicio"].ToString()),
                                Fecha_Final = DateTime.Parse(reader["Fecha_Final"].ToString())

                            };
                            historialReservaciones.Add(historialReservaciones1);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            return historialReservaciones;

        }

        public static int EliminarReservacion(int id)
        {
            int i;
            try
            {
                using(SqlConnection con = new SqlConnection(cadena))
                {
                    SqlCommand cmd = new SqlCommand("sp_borrarReservacion", con);
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@id",id);
                    con.Open();
                    i = cmd.ExecuteNonQuery();
                }
                return i;
            }catch(Exception ex)
            {
                Console.WriteLine(ex.Message);
                i = 0;
                return i;
            }
        }

        //Por el momento decidimos que no era necesario implementarlo
        /*public static int ActualizarReservacion(HistorialReservaciones historialReservaciones)
        {
            int i;
            try
            {
                using (SqlConnection con = new SqlConnection(cadena))
                {
                    SqlCommand cmd = new SqlCommand("sp_modificarReservacion", con);
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@id", historialReservaciones.Id);
                    cmd.Parameters.AddWithValue("@fecha_inicio", historialReservaciones.Fecha_Inicio);
                    cmd.Parameters.AddWithValue("@fecha_final", historialReservaciones.Fecha_Final);

                    con.Open();
                    i = cmd.ExecuteNonQuery();
                }
                return i;
            }
            catch (Exception ex)
            {
                i = 0;
                return i;
            }
        }*/

        

    }
}