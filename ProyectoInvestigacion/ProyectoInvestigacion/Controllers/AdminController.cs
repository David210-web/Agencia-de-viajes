using ProyectoInvestigacion.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace ProyectoInvestigacion.Controllers
{
    [Permiso(Roles = "admin")]
    public class AdminController : Controller
    {
        // GET: Admin
        public ActionResult Index()
        {
            return View(ViajesMantenimiento.VerTodosLosViajes());
        }

        // GET: Admin/Details/5
        public ActionResult Details(int id)
        {
            return View(ViajesMantenimiento.EncontrarViaje(id));
        }

        // GET: Admin/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Admin/Create
        [HttpPost]
        public ActionResult Create(Viajes viaje)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    ViajesMantenimiento.InsertarViajes(viaje);
                    return RedirectToAction("Index");
                }
                catch (Exception ex)
                {
                    // Manejo de error (opcional: puedes registrar el error)
                    ModelState.AddModelError("", "Hubo un problema al guardar el viaje. Por favor, inténtalo de nuevo.");
                }
            }
            return View(viaje);
        }

        // GET: Admin/Edit/5
        public ActionResult Edit(int id)
        {
            return View(ViajesMantenimiento.EncontrarViaje(id));
        }

        // POST: Admin/Edit/5
        [HttpPost]
        public ActionResult Edit(int id, Viajes viajes)
        {
            if (ModelState.IsValid)
            {
                try
                {
                    ViajesMantenimiento.ActualizarViaje(id, viajes);
                    return RedirectToAction("Index");
                }
                catch (Exception ex)
                {
                    // Manejo de error (opcional: puedes registrar el error)
                    ModelState.AddModelError("", "Hubo un problema al actualizar el viaje. Por favor, inténtalo de nuevo.");
                }
            }
            return View(viajes);
        }

        // GET: Admin/Delete/5
        public ActionResult Delete(int id)
        {
            return View(ViajesMantenimiento.EncontrarViaje(id));
        }

        // POST: Admin/Delete/5
        [HttpPost, ActionName("Delete")]
        public ActionResult DeleteConfirmed(int id)
        {
            try
            {
                ViajesMantenimiento.EliminarViaje(id);
                return RedirectToAction("Index");
            }
            catch (Exception ex)
            {
                // Manejo de error (opcional: puedes registrar el error)
                ModelState.AddModelError("", "Hubo un problema al eliminar el viaje. Por favor, inténtalo de nuevo.");
                return View(ViajesMantenimiento.EncontrarViaje(id));
            }
        }

        public ActionResult CerrarSesion()
        {
            Session["usuario"] = null;
            return RedirectToAction("Login", "Acceso");
        }
    }
}
