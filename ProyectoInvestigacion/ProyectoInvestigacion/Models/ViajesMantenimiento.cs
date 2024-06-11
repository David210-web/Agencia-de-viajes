using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI;

namespace ProyectoInvestigacion.Models
{
    public class ViajesMantenimiento
    {
        //private static string cadenaConexion = ConfigurationManager.ConnectionStrings["Conexion"].ToString();
        private static string cadena = ConfigurationManager.ConnectionStrings["Conexion"].ToString();



        public static List<Viajes> VerViajesPrincipales()
         {
            List<Viajes> viajesPrincipales = new List<Viajes>();
            try
            {
                using (SqlConnection conn = new SqlConnection(cadena))
                {
                    SqlCommand cmd = new SqlCommand("sp_viajesPrincipales", conn);
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    conn.Open();
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            Viajes viajes = new Viajes()
                            {
                                Id = Int32.Parse(reader["ID_Viaje"].ToString()),
                                Nombre = reader["Nombre_Viaje"].ToString(),
                                Continente = reader["Continente"].ToString(),
                                Pais = reader["Pais"].ToString(),
                                Ciudad = reader["Ciudad"].ToString(),
                                Alojamientos = reader["Alojamientos"].ToString(),
                                Precio =  Decimal.Parse(reader["Precio"].ToString()),
                                ImagenURL = reader["Imagen_URL"].ToString()

                            };
                            viajesPrincipales.Add(viajes);
                        }
                    }
                }
            } catch(Exception ex) 
            { 
                Console.WriteLine(ex.Message);
            }
            return viajesPrincipales;

         }

        public static List<Viajes> VerTodosLosViajes()
        {
            List<Viajes> viajesPrincipales = new List<Viajes>();
            try
            {
                using (SqlConnection conn = new SqlConnection(cadena))
                {
                    SqlCommand cmd = new SqlCommand("SELECT * FROM Viajes", conn);
                    conn.Open();
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            Viajes viajes = new Viajes()
                            {
                                Id = Int32.Parse(reader["ID_Viaje"].ToString()),
                                Nombre = reader["Nombre_Viaje"].ToString(),
                                Continente = reader["Continente"].ToString(),
                                Pais = reader["Pais"].ToString(),
                                Ciudad = reader["Ciudad"].ToString(),
                                Alojamientos = reader["Alojamientos"].ToString(),
                                Precio = Decimal.Parse(reader["Precio"].ToString()),
                                ImagenURL = reader["Imagen_URL"].ToString()

                            };
                            viajesPrincipales.Add(viajes);
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            return viajesPrincipales;

        }

        public static Viajes EncontrarViaje(int id)
        {
            Viajes viajes = new Viajes();
            try
            {
                using (SqlConnection conn = new SqlConnection(cadena))
                {
                    SqlCommand cmd = new SqlCommand("sp_encontrarProducto", conn);
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@Id",id);
                    conn.Open();
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        while (reader.Read())
                        {

                            viajes.Id = Int32.Parse(reader["ID_Viaje"].ToString());
                            viajes.Nombre = reader["Nombre_Viaje"].ToString();
                            viajes.Continente = reader["Continente"].ToString();
                            viajes.Pais = reader["Pais"].ToString();
                            viajes.Ciudad = reader["Ciudad"].ToString();
                            viajes.Alojamientos = reader["Alojamientos"].ToString();
                            viajes.Precio = Decimal.Parse(reader["Precio"].ToString());
                            viajes.ImagenURL = reader["Imagen_URL"].ToString();

                           
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            return viajes;
        }

        public static void InsertarViajes(Viajes viajes)
        {
            try
            {
                using (SqlConnection connection = new SqlConnection(cadena))
                {
                    using (SqlCommand command = new SqlCommand("sp_InsertarViaje", connection))
                    {
                        command.CommandType = CommandType.StoredProcedure;

                        // Parámetros del procedimiento almacenado
                        command.Parameters.AddWithValue("@Nombre_Viaje", SqlDbType.VarChar).Value = viajes.Nombre;
                        command.Parameters.AddWithValue("@Continente", SqlDbType.VarChar).Value = viajes.Continente;
                        command.Parameters.AddWithValue("@Pais", SqlDbType.VarChar).Value = viajes.Pais;
                        command.Parameters.AddWithValue("@Ciudad", SqlDbType.VarChar).Value = viajes.Ciudad;
                        command.Parameters.AddWithValue("@Alojamientos", SqlDbType.VarChar).Value = viajes.Alojamientos;
                        command.Parameters.AddWithValue("@Precio", SqlDbType.Decimal).Value =  viajes.Precio;
                        command.Parameters.AddWithValue("@Imagen_URL", SqlDbType.VarChar).Value = viajes.ImagenURL;

                        try
                        {
                            connection.Open();
                            command.ExecuteNonQuery();
                        }
                        catch (Exception ex)
                        {
                            // Manejar excepciones aquí
                            Console.WriteLine("Error al insertar el viaje: " + ex.Message);
                        }
                    }
                }
            }
            catch(Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
        }

        public static void EliminarViaje(int id)
        {
            using (SqlConnection connection = new SqlConnection(cadena))
            {
                using (SqlCommand command = new SqlCommand("sp_EliminarViaje", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;

                    // Parámetro del procedimiento almacenado
                    command.Parameters.AddWithValue("@ID_Viaje", SqlDbType.Int).Value = id;

                    try
                    {
                        connection.Open();
                        command.ExecuteNonQuery();
                    }
                    catch (Exception ex)
                    {
                        // Manejar excepciones aquí
                        Console.WriteLine("Error al eliminar el viaje: " + ex.Message);
                    }
                }
            }
        }

        public static void ActualizarViaje(int id, Viajes viaje)
        {
            using (SqlConnection connection = new SqlConnection(cadena))
            {
                using (SqlCommand command = new SqlCommand("sp_ActualizarViaje", connection))
                {
                    command.CommandType = CommandType.StoredProcedure;

                    // Parámetros del procedimiento almacenado
                    command.Parameters.AddWithValue("@ID_Viaje", SqlDbType.Int).Value = id;
                    command.Parameters.AddWithValue("@Nombre_Viaje", SqlDbType.VarChar).Value = viaje.Nombre;
                    command.Parameters.AddWithValue("@Continente", SqlDbType.VarChar).Value = viaje.Continente;
                    command.Parameters.AddWithValue("@Pais", SqlDbType.VarChar).Value = viaje.Pais;
                    command.Parameters.AddWithValue("@Ciudad", SqlDbType.VarChar).Value = viaje.Ciudad;
                    command.Parameters.AddWithValue("@Alojamientos", SqlDbType.VarChar).Value = viaje.Alojamientos;
                    command.Parameters.AddWithValue("@Precio", SqlDbType.Decimal).Value = viaje.Precio;
                    command.Parameters.AddWithValue("@Imagen_URL", SqlDbType.VarChar).Value = viaje.ImagenURL;

                    try
                    {
                        connection.Open();
                        command.ExecuteNonQuery();
                    }
                    catch (Exception ex)
                    {
                        // Manejar excepciones aquí
                        Console.WriteLine("Error al actualizar el viaje: " + ex.Message);
                    }
                }
            }
        }
    }
}