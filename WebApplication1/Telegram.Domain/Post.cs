using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Telegram.Domain
{
    public class Post
    {
        public int Id { get; set; }
        public string Canal { get; set; }
        public string Texto { get; set; }
        public string Img { get; set; }
        public DateTime Fecha { get; set; }
        public List<Comentario> Comentarios { get; set; } = new List<Comentario>();
    }
}
