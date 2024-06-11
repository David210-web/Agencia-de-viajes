using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace ProyectoInvestigacion.Models
{
    public class Viajes
    {
        public int Id { get; set; }

        [Required(ErrorMessage = "El nombre del viaje es obligatorio.")]
        [StringLength(255, ErrorMessage = "El nombre del viaje no puede exceder los 255 caracteres.")]
        public string Nombre { get; set; }

        [Required(ErrorMessage = "El continente es obligatorio.")]
        [StringLength(100, ErrorMessage = "El continente no puede exceder los 100 caracteres.")]
        public string Continente { get; set; }

        [Required(ErrorMessage = "El país es obligatorio.")]
        [StringLength(150, ErrorMessage = "El país no puede exceder los 150 caracteres.")]
        public string Pais { get; set; }

        [Required(ErrorMessage = "La ciudad es obligatoria.")]
        [StringLength(150, ErrorMessage = "La ciudad no puede exceder los 150 caracteres.")]
        public string Ciudad { get; set; }

        [StringLength(250, ErrorMessage = "Los alojamientos no pueden exceder los 250 caracteres.")]
        [Required(ErrorMessage = "El alojamiento es obligatorio")]

        public string Alojamientos { get; set; }

        [Required(ErrorMessage = "El precio es obligatorio.")]
        [Range(0.01, 100000.00, ErrorMessage = "El precio debe estar entre 0.01 y 100,000.00.")]
        public decimal Precio { get; set; }

        //
        //
        //[Url(ErrorMessage = "La URL de la imagen no es válida.")]
        [StringLength(255, ErrorMessage = "La URL de la imagen no puede exceder los 255 caracteres.")]
        [Required(ErrorMessage = "La url de la imagen es obligatoria")]
        public string ImagenURL { get; set; }
    }
}