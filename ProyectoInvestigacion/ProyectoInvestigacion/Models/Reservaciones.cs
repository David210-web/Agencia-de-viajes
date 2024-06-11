using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ProyectoInvestigacion.Models
{
    public class Reservaciones
    {
        [Required(ErrorMessage = "El ID de usuario es obligatorio.")]
        public int ID_Usuario { get; set; }

        [Required(ErrorMessage = "El ID de viaje es obligatorio.")]
        public int ID_Viaje { get; set; }

        [Required(ErrorMessage = "El nombre de la reservación es obligatorio.")]
        [StringLength(100, ErrorMessage = "El nombre de la reservación no puede exceder los 100 caracteres.")]
        public string Nombre_Reservacion { get; set; }

        [Required(ErrorMessage = "El precio es obligatorio.")]
        [Range(0.01, 10000.00, ErrorMessage = "El precio debe estar entre 0.01 y 10,000.00.")]
        public decimal Precio { get; set; }

        [Required(ErrorMessage = "La fecha de inicio es obligatoria.")]
        [DataType(DataType.Date, ErrorMessage = "La fecha de inicio debe ser una fecha válida.")]
        public DateTime Fecha_Inicio { get; set; }

        [Required(ErrorMessage = "La fecha final es obligatoria.")]
        [DataType(DataType.Date, ErrorMessage = "La fecha final debe ser una fecha válida.")]
        [ValidarFecha("Fecha_Inicio", ErrorMessage = "La fecha final debe ser mayor que la fecha de inicio.")]
        public DateTime Fecha_Final { get; set; }
    }
}
