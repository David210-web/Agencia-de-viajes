using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using ProyectoInvestigacion.Models;

namespace ProyectoInvestigacion.Controllers
{
    public class AccesoController : Controller
    {
        
        private static string cadena = ConfigurationManager.ConnectionStrings["Conexion"].ToString();



        // GET: Acceso
        public ActionResult Login()
        {
            return View();
        }

        public ActionResult Registro() //Para ver
        {
            return View();
        }

        [HttpPost]
        public ActionResult Login(Usuario user)
        {
            if (user == null || string.IsNullOrEmpty(user.Username) || string.IsNullOrEmpty(user.Password))
            {
                ViewData["Mensaje"] = "Por favor complete todos los campos.";
                return View();
            }

            using (SqlConnection cn = new SqlConnection(cadena))
            {
                SqlCommand cmd = new SqlCommand("sp_verificarCuenta", cn);
                cmd.Parameters.AddWithValue("@user", user.Username);
                cmd.Parameters.AddWithValue("@password", user.Password);
                cmd.CommandType = CommandType.StoredProcedure;

                cn.Open();

                user.Id = Convert.ToInt32(cmd.ExecuteScalar().ToString());
            }

            string rol = UsuarioMantenimiento.ObtenerRol(user.Id);

            if (user.Id != 0)
            {
                Session["usuario"] = user;
                if (rol == "user")
                    return RedirectToAction("Index", "Home");
                else if (rol == "admin")
                    return RedirectToAction("Index", "Admin");
                else
                    return RedirectToAction("Error", "Home");
            }
            else
            {
                ViewData["Mensaje"] = "usuario no encontrado";
                return View();
            }
        }



        [HttpPost]
        public ActionResult Registro(Usuario user)
        {
            if (user == null)
            {
                return View();
            }

            if (!ModelState.IsValid)
            {
                return View(user); 
            }

            int i;
            try
            {
                using (SqlConnection con = new SqlConnection(cadena))
                {
                    SqlCommand cmd = new SqlCommand("sp_registrarUsuario", con);
                    cmd.Parameters.AddWithValue("@user", user.Username);
                    cmd.Parameters.AddWithValue("@email", user.Email);
                    cmd.Parameters.AddWithValue("@password", user.Password);
                    cmd.Parameters.AddWithValue("@telefono", user.Telefono);
                    cmd.Parameters.AddWithValue("@pais", user.Pais);
                    cmd.CommandType = System.Data.CommandType.StoredProcedure;

                    con.Open();
                    i = cmd.ExecuteNonQuery();
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
                i = 0;
            }

            if (i == 1)
            {
                return RedirectToAction("Login", "Acceso");
            }
            else
            {
                ViewData["Mensaje"] = "Error al registrar el usuario.";
                return View(user);
            }
        }


        public ActionResult NoAutorizado()
        {
            return View();
        }
    }
}