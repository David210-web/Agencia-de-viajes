using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ProyectoInvestigacion.Models
{
    public class HistorialReservaciones
    {
        public int Id { get; set; }

        [Required(ErrorMessage = "El ID del viaje es obligatorio.")]
        public int Id_Viaje { get; set; }

        [Required(ErrorMessage = "El nombre es obligatorio.")]
        [StringLength(255, ErrorMessage = "El nombre no puede exceder los 255 caracteres.")]
        public string Nombre { get; set; }

        [Required(ErrorMessage = "El nombre de la persona de la reservación es obligatorio.")]
        [StringLength(255, ErrorMessage = "El nombre de la persona de la reservación no puede exceder los 255 caracteres.")]
        public string PersonaReservacion { get; set; }

        [Required(ErrorMessage = "El precio es obligatorio.")]
        [Range(0.01, 100000.00, ErrorMessage = "El precio debe estar entre 0.01 y 100,000.00.")]
        public double Precio { get; set; }

        [Required(ErrorMessage = "La fecha de inicio es obligatoria.")]
        [DataType(DataType.Date, ErrorMessage = "La fecha de inicio debe ser una fecha válida.")]
        public DateTime Fecha_Inicio { get; set; }

        [Required(ErrorMessage = "La fecha final es obligatoria.")]
        [DataType(DataType.Date, ErrorMessage = "La fecha final debe ser una fecha válida.")]
       // [DateGreaterThan("Fecha_Inicio", ErrorMessage = "La fecha final debe ser mayor que la fecha de inicio.")]
        public DateTime Fecha_Final { get; set; }

    }
}