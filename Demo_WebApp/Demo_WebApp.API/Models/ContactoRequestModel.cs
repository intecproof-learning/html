using System;

namespace Demo_WebApp.API.Models
{
    public class ContactoRequestModel
    {
        public int id { get; set; }
        public String nombre { get; set; }
        public String email { get; set; }
        public String mensaje { get; set; }
        public String asunto { get; set; }
        public bool contactar { get; set; }
        public bool noticias { get; set; }
        public byte prioridad { get; set; }
    }
}