using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ProyectoInvestigacion.Models
{
    public class ReservacionViewModel
    {
        public Viajes Viaje { get; set; }
        public Reservaciones Reservacion { get; set; }
    }
}
