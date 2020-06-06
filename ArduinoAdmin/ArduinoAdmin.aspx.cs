using Entidades;
using Negocios;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Reflection;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ArduinoAdmin
{
    public partial class ArduinoAdmin : System.Web.UI.Page
    {
        LecturasDALC lecturasDALC = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                ObtenerParametros();
        }

        private void ObtenerParametros()
        {
            try
            {
                //Get the assembly that contains the internal class
                Assembly aNetAssembly = Assembly.GetAssembly(typeof(System.Net.Configuration.SettingsSection));
                if (aNetAssembly != null)
                {
                    //Use the assembly in order to get the internal type for the internal class
                    Type aSettingsType = aNetAssembly.GetType("System.Net.Configuration.SettingsSectionInternal");
                    if (aSettingsType != null)
                    {
                        //Use the internal static property to get an instance of the internal settings class.
                        //If the static instance isn't created allready the property will create it for us.
                        object anInstance = aSettingsType.InvokeMember("Section",
                        BindingFlags.Static | BindingFlags.GetProperty | BindingFlags.NonPublic, null, null, new object[] { });

                        if (anInstance != null)
                        {
                            //Locate the private bool field that tells the framework is unsafe header parsing should be allowed or not
                            FieldInfo aUseUnsafeHeaderParsing = aSettingsType.GetField("useUnsafeHeaderParsing", BindingFlags.NonPublic | BindingFlags.Instance);
                            if (aUseUnsafeHeaderParsing != null)
                            {
                                aUseUnsafeHeaderParsing.SetValue(anInstance, true);
                            }
                        }
                    }

                }

                string urlAddress = "http://192.168.1.177:81";

                HttpWebRequest request = (HttpWebRequest)WebRequest.Create(urlAddress);
                //request.Timeout = 5000;

                HttpWebResponse response = (HttpWebResponse)request.GetResponse();

                if (response.StatusCode == HttpStatusCode.OK)
                {
                    Stream receiveStream = response.GetResponseStream();
                    StreamReader readStream = null;

                    if (response.CharacterSet == null)
                        readStream = new StreamReader(receiveStream);
                    else
                        readStream = new StreamReader(receiveStream, Encoding.GetEncoding(response.CharacterSet));

                    string data = readStream.ReadToEnd();
                    data = data.ToUpper();
                    if (data != null)
                    {
                        lecturasDALC = new LecturasDALC();
                        LecturaEntity lectura = null;
                        DateTime hora_fecha = new DateTime();

                        string parametro = "HUMEDAD";
                        int index = data.IndexOf(parametro);

                        if (index >= 0)
                        {
                            data = data.Substring(index + parametro.Length, data.Length - (index + parametro.Length));
                            int index2 = data.IndexOf("%");
                            lblHumedad.Text = string.Empty;
                            lblHumedad.Text = data.Substring(0, index2) + "%";
                            data = data.Replace(lblHumedad.Text, "");
                            lectura = null;
                            lectura = new LecturaEntity();
                            lectura.descripcion = "humedad";
                            hora_fecha = DateTime.Now;
                            lectura.fecha = hora_fecha.ToString("yyyy-MM-dd");
                            lectura.hora = hora_fecha.ToString().Split(' ')[1];
                            lectura.unidad = "%";
                            lectura.valor = lblHumedad.Text.Replace(" ", "").Replace("%", "").Replace("C°", "");

                            if(!string.IsNullOrEmpty(lectura.valor))
                                lecturasDALC.InsertarLecturas(lectura);
                        }

                        parametro = "TEMPERATURA";
                        index = data.IndexOf(parametro);

                        if (index >= 0)
                        {
                            data = data.Substring(index + parametro.Length, data.Length - (index + parametro.Length));
                            int index2 = data.IndexOf("C");
                            lblTemperatura.Text = string.Empty;
                            lblTemperatura.Text = data.Substring(0, index2) + " C°";
                            data = data.Replace(lblTemperatura.Text.Replace("°", "").Replace(" ", ""), "");
                            lectura = null;
                            lectura = new LecturaEntity();
                            hora_fecha = DateTime.Now;
                            lectura.fecha = hora_fecha.ToString("yyyy-MM-dd");
                            lectura.hora = hora_fecha.ToString().Split(' ')[1]; 
                            lectura.descripcion = "temperatura";
                            
                            lectura.unidad = "C°";
                            lectura.valor = lblTemperatura.Text.Replace(" ", "").Replace("%", "").Replace("C°", "");

                            if (!string.IsNullOrEmpty(lectura.valor))
                                lecturasDALC.InsertarLecturas(lectura);
                        }

                        parametro = "HUMEDADSUELO";
                        index = data.IndexOf(parametro);

                        if (index >= 0)
                        {
                            data = data.Substring(index + parametro.Length, data.Length - (index + parametro.Length));
                            int index2 = data.IndexOf("%");
                            lblHumedadSuelo.Text = string.Empty;
                            lblHumedadSuelo.Text = data.Substring(0, index2) + "%";
                            data = data.Replace(lblHumedadSuelo.Text, "");
                            lectura = null;
                            lectura = new LecturaEntity();
                            lectura.descripcion = "humedad suelo";
                            hora_fecha = DateTime.Now;
                            lectura.fecha = hora_fecha.ToString("yyyy-MM-dd");
                            lectura.hora = hora_fecha.ToString().Split(' ')[1];
                            lectura.unidad = "%";
                            lectura.valor = lblHumedadSuelo.Text.Replace(" ", "").Replace("%", "").Replace("C°", "");

                            if (!string.IsNullOrEmpty(lectura.valor))
                                lecturasDALC.InsertarLecturas(lectura);
                        }
                    }

                    response.Close();
                    readStream.Close();
                }
            }
            catch (Exception ex)
            {
              ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "Conexión perdida",
                    "alert('Imposible obtener lecturas, revise su conexión. Excepción: " + ex.Message.ToLower() + "')", true);

                lblHumedad.Text = "N/A";
                lblTemperatura.Text = "N/A";
                lblHumedadSuelo.Text = "N/A";
            }
        }

        protected void UpdateTimer_Tick(object sender, EventArgs e)
        {
            ObtenerParametros();
        }
    }
}