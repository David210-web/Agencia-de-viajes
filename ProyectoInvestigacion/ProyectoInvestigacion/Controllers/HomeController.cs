using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

using ProyectoInvestigacion.Models;

namespace ProyectoInvestigacion.Controllers
{
    [Permiso(Roles = "user")]
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            return View(ViajesMantenimiento.VerViajesPrincipales());
        }

        public ActionResult Error()
        {
            return View();
        }

        public ActionResult Viajes()
        {
            ViewBag.Message = "Your application description page.";

            return View(ViajesMantenimiento.VerTodosLosViajes());
        }

        public ActionResult Reservacion(int id)
        {
            var viaje = ViajesMantenimiento.EncontrarViaje(id);
            var usuario = Session["usuario"] as Usuario;
            if (usuario != null)
            {
                ViewBag.Message = usuario.Id;
            }
            if (viaje == null)
            {
                return HttpNotFound();
            }

            var model = new ReservacionViewModel
            {
                Viaje = viaje,
                Reservacion = new Reservaciones { ID_Viaje = id, ID_Usuario = usuario.Id }
            };

            return View(model);
        }

        [HttpPost]
        public ActionResult Reservacion(ReservacionViewModel model)
        {
            if (model == null)
            {
                return View();
            }
            if (ModelState.IsValid)
            {
                int i = ReservacionesMantenimiento.InsertarReservacion(model.Reservacion);
                if (i == 1)
                {
                    return RedirectToAction("Index", "Home");
                }
                else
                {
                    ModelState.AddModelError("", "Hubo un problema al guardar la reservación, por favor, inténtelo de nuevo");
                }
            }
            else
            {
                ModelState.AddModelError("", "Hay errores en el formulario, por favor revisa los campos");
            }

            

            return View(model);
        }

        public ActionResult Historial()
        {
            var usuario = Session["usuario"] as Usuario;
            return View(ReservacionesMantenimiento.Historial(usuario.Id));
        }

        public ActionResult EliminarReservacion(int id)
        {
            ReservacionesMantenimiento.EliminarReservacion(id);
            return RedirectToAction("Historial");
        }

        public ActionResult CerrarSesion()
        {
            Session["usuario"] = null;
            return RedirectToAction("Login", "Acceso");
        }
    }
}
