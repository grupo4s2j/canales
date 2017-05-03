using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Telegram.Domain
{
    public class Comentario
    {
        public int Id { get; set; }
        public int Id_Post { get; set; }
        public string Texto { get; set; }
        public DateTime Fecha { get; set; }
    }
}
