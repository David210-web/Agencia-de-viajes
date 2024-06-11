using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace ProyectoInvestigacion.Models
{
    public class Permiso : ActionFilterAttribute
    {
        public string Roles { get; set; }
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {
            if (HttpContext.Current.Session["usuario"] == null)
            {
                filterContext.Result = new RedirectResult("~/Acceso/Login");
            }

            var usuario = HttpContext.Current.Session["usuario"] as Usuario;
            if (usuario == null)
            {
                filterContext.Result = new RedirectResult("~/Acceso/Login");
                return;
            }

            // 
            var rol = UsuarioMantenimiento.ObtenerRol(usuario.Id);

            if (!string.IsNullOrEmpty(Roles) && !Roles.Split(',').Any(r => r.Trim().Equals(rol, StringComparison.OrdinalIgnoreCase)))
            {
                filterContext.Result = new RedirectResult("~/Acceso/NoAutorizado");
            }
            base.OnActionExecuting(filterContext);
        }
    }
}