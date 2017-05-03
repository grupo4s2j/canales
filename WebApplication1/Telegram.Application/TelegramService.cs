using Database;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Telegram.Domain;

namespace Telegram.Application
{
    public class TelegramService
    {
        private Connection con;

        public TelegramService()
        {
            con = new Connection();
        }

        public IEnumerable<Post> GetAllPosts()
        {
            var result = new List<Post>();
            var posts = con.GetAllFrom("Post");
            foreach (DataRow row in posts.Tables[0].Rows)
            {
                result.Add(
                    new Post()
                    {
                        Id = (int)row["Id"],
                        Canal = row["Canal"].ToString(),
                        Texto = row["Texto"].ToString(),
                        Img = row["Img"].ToString(),
                        Comentarios = GetComentariosByPost((int)row["Id"]),
                        Fecha = Convert.ToDateTime(row["Fecha"].ToString())
                    });
            }
            result = result.OrderBy(x => x.Fecha).ToList();
            return result;
        }

        public void AddOrUpdate(Post request)
        {
            var c = con.GetById(request.Id.ToString(), "Post");
            var canal = request.Canal;
            var texto = request.Texto;
            var img = request.Img;
            var fecha = DateTime.UtcNow;
            if (IsEmpty(c))
            {
                con.ExecuteNonQuery("INSERT INTO Post (Canal, Texto, Img, Fecha) VALUES ('" + canal + "','" + texto + "','" + img + "','" + fecha + "'))");
            }
            else
            {
                con.ExecuteNonQuery("UPDATE Post SET Canal = '" + canal + "', Texto = '" + texto + "', Img = '" + img + "' WHERE Id = '" + request.Id.ToString() + "' ");
            }
        }

        private List<Comentario> GetComentariosByPost(int id)
        {
            var comentarios = con.ExecuteQuery("Select * from Comentario where Id_Post = '" + id + "'");
            var result = new List<Comentario>();
            foreach (DataRow row in comentarios.Tables[0].Rows)
            {
                result.Add(
                    new Comentario()
                    {
                        Id = (int)row["Id"],
                        Id_Post = (int)row["Id_Post"],
                        Texto = row["Texto"].ToString(),
                        Fecha = Convert.ToDateTime(row["Fecha"].ToString())
                    });
            }
            result = result.OrderBy(x => x.Fecha).ToList();
            return result;
        }

        private bool IsEmpty(DataSet request)
        {
            if (request.Tables[0].Rows.Count == 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
    }
}
