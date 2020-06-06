
using Data;
using Entidades;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Text;

namespace Negocios
{
    public class LecturasDALC : ConnectionDB
    {
        public LecturasDALC() { }

        public bool InsertarLecturas(LecturaEntity lectura)
        {
            bool success = false;
            MySqlCommand command = new MySqlCommand("insert into lecturas(fecha, hora, descripcion, " +
                "unidad, valor) values (@fecha, @hora, @descripcion, @unidad, @valor)", MySqlConnection);
            command.Parameters.AddWithValue("@fecha", lectura.fecha);
            command.Parameters.AddWithValue("@hora", lectura.hora);
            command.Parameters.AddWithValue("@descripcion", lectura.descripcion);
            command.Parameters.AddWithValue("@unidad", lectura.unidad);
            command.Parameters.AddWithValue("@valor", lectura.valor);
            
            try
            {
                MySqlConnection.Open();
                if (command.ExecuteNonQuery() > 0)
                    success = true;
            }
            catch(Exception ex) { }
            {
                if (MySqlConnection.State == ConnectionState.Broken || MySqlConnection.State == ConnectionState.Open)
                    MySqlConnection.Close();
            }
            return success;
        }

        public List<LecturaEntity> MostrarLecturas()
        {
            List<LecturaEntity> lstLecturas = new List<LecturaEntity>();

            MySqlCommand command = new MySqlCommand("select *from lecturas order by id desc limit 100", MySqlConnection);
            MySqlDataAdapter da = new MySqlDataAdapter(command);
            DataSet ds = new DataSet();
            try
            {
                da.Fill(ds);
                foreach(DataRow dr in ds.Tables[0].Rows)
                {
                    LecturaEntity lectura = new LecturaEntity();
                    Popule(dr, lectura);
                    lstLecturas.Add(lectura);
                }
            }
            catch(Exception ex)
            {
                lstLecturas = null;
            }

            return lstLecturas;
        }

        public List<LecturaEntity> MostrarLecturas(string descripcion, string fecha)
        {
            List<LecturaEntity> lstLecturas = new List<LecturaEntity>();

            MySqlCommand command = new MySqlCommand("select *from lecturas where descripcion = @descripcion and fecha = @fecha limit 100", MySqlConnection);
            command.Parameters.AddWithValue("@descripcion", descripcion);
            command.Parameters.AddWithValue("@fecha", fecha);

            MySqlDataAdapter da = new MySqlDataAdapter(command);
            DataSet ds = new DataSet();
            try
            {
                da.Fill(ds);
                foreach (DataRow dr in ds.Tables[0].Rows)
                {
                    LecturaEntity lectura = new LecturaEntity();
                    Popule(dr, lectura);
                    lstLecturas.Add(lectura);
                }
            }
            catch (Exception ex)
            {
                lstLecturas = null;
            }

            return lstLecturas;
        }

        private void Popule(DataRow dr, LecturaEntity lectura)
        {
            lectura.descripcion = dr["descripcion"].ToString();
            lectura.fecha = dr["fecha"].ToString();
            lectura.hora = dr["hora"].ToString();
            lectura.id_parametro = Convert.ToUInt32(dr["id"].ToString());
            lectura.unidad = dr["unidad"].ToString();
            lectura.valor = dr["valor"].ToString();
        }
    }
}
