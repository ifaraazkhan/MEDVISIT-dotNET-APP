using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Text;
using System.Security;
using System.IO;
using System.Net;
using System.Security.Cryptography;
using System.Web.Mail;
namespace MD_Clinic
{
    internal class GeneralClass
    {
        private static string EncryptionKey = "!#853g`de";
        private static byte[] key = { };
        private static byte[] IV = { 0x12, 0x34, 0x56, 0x78, 0x90, 0xAB, 0xCD, 0xEF };
        SqlCommand cmd;
        SqlDataAdapter da;
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constring"].ConnectionString);
        public GeneralClass()
        {
            //
            // TODO: Add constructor logic here
            //
        }

        public void Acessdb(string sqlcommand)
        {
            try
            {
                con.Open();

                SqlCommand cmd = new SqlCommand(sqlcommand, con);
                cmd.ExecuteNonQuery();
                con.Close();
            }
            catch (Exception)
            {

                throw;
            }
            finally
            {
                con.Close();
            }


        }


        public string Acessdb_return(string sqlcommand)
        {
            try
            {
                string returnvalue = "";
                // SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constring"].ConnectionString);
                con.Open();

                SqlCommand cmd = new SqlCommand(sqlcommand, con);
                if (cmd.ExecuteScalar() == null)
                {
                    returnvalue = "";
                }
                else
                {
                    returnvalue = cmd.ExecuteScalar().ToString();
                }

                con.Close();

                return returnvalue;
            }
            catch (Exception)
            {

                throw;
            }
            finally
            {
                con.Close();

            }


        }

        public DataSet Accessdb_return_dataset(string sqlcommand, string tablename)
        {
            try
            {
                con.Open();
                DataSet ds = new DataSet();
                SqlDataAdapter adapter = new SqlDataAdapter(sqlcommand, con);

                adapter.Fill(ds, tablename);


                con.Close();

                return ds;
                //dataset ds;
                //ds = cls.accessdb_return_dataset("select * from doctors where id=" + doctor_id + "", "doctors");

                //txt_email.text = ds.tables["doctors"].rows[0]["email"].tostring();
                //txt_mobile.text = ds.tables["doctors"].rows[0]["phone"].tostring();
            }
            catch (Exception)
            {

                throw;
            }
            finally
            {
                con.Close();

            }
            
        }

        public string Acessdb_return_new(string sqlcommand)
        {
            try
            {
                string returnvalue = "";
                // SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["constring"].ConnectionString);
                con.Open();

                SqlCommand cmd = new SqlCommand(sqlcommand, con);

                returnvalue = cmd.ExecuteScalar().ToString();


                con.Close();
                return returnvalue;
            }
            catch (Exception)
            {

                throw;
            }
            finally
            {
                con.Close();

            }

        }



        public void dropdown_bind(string sqlquery, DropDownList dropdown, string value_column, string text_column)
        {
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(sqlquery, con);
                //cmd.CommandType = CommandType.StoredProcedure;
                da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);
                dropdown.DataSource = ds;
                dropdown.DataTextField = text_column;
                dropdown.DataValueField = value_column;
                dropdown.DataBind();
                dropdown.Items.Insert(0, new ListItem("-Select-", "0"));
                con.Close();
            }
            catch (Exception)
            {

                throw;
            }
            finally
            {
                con.Close();
            }


        }


        public void bind_grid_list(string sqlquery, ListView listview)
        {
            try
            {
                con.Open();
                SqlCommand cmd = new SqlCommand(sqlquery, con);
                //cmd.CommandType = CommandType.StoredProcedure;
                da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);
                listview.DataSource = ds;
                listview.DataBind();

                con.Close();
            }
            catch (Exception)
            {

                throw;
            }
            finally
            {
                con.Close();
            }


        }






        public void textbox_clear(ControlCollection ctrls)
        {
            foreach (Control ctrl in ctrls)
            {
                if (ctrl is TextBox)
                    ((TextBox)ctrl).Text = string.Empty;

                textbox_clear(ctrl.Controls);
            }
        }


        public bool check_islogin()
        {
            if (HttpContext.Current.Session["user_type"] == null || HttpContext.Current.Session["mail"] == null)
            {
                HttpContext.Current.Session.Abandon();
                HttpContext.Current.Session.Clear();
                return false;

            }
            else
            {
                return true;
            }


        }
        public string Encrypt(string Input)
        {
            {
                try
                {
                    key = System.Text.Encoding.UTF8.GetBytes(EncryptionKey.Substring(0, 8));
                    DESCryptoServiceProvider des = new DESCryptoServiceProvider();
                    Byte[] inputByteArray = Encoding.UTF8.GetBytes(Input);
                    MemoryStream ms = new MemoryStream();
                    CryptoStream cs = new CryptoStream(ms, des.CreateEncryptor(key, IV), CryptoStreamMode.Write);
                    cs.Write(inputByteArray, 0, inputByteArray.Length);
                    cs.FlushFinalBlock();
                    return Convert.ToBase64String(ms.ToArray());
                }
                catch (Exception ex)
                {
                    return "";
                }
            }
        }

        public string Decrypt(string Input)
        {
            {
                Byte[] inputByteArray = new Byte[Input.Length];
                //Convert.FromBase64String(encryptpwd.Replace("", "+"));

                try
                {
                    key = System.Text.Encoding.UTF8.GetBytes(EncryptionKey.Substring(0, 8));
                    DESCryptoServiceProvider des = new DESCryptoServiceProvider();
                    inputByteArray = Convert.FromBase64String(Input);
                    MemoryStream ms = new MemoryStream();
                    CryptoStream cs = new CryptoStream(ms, des.CreateDecryptor(key, IV), CryptoStreamMode.Write);
                    cs.Write(inputByteArray, 0, inputByteArray.Length);
                    cs.FlushFinalBlock();
                    Encoding encoding = Encoding.UTF8;
                    return encoding.GetString(ms.ToArray());
                }
                catch (Exception ex)
                {
                    return "";
                }
            }
        }
        public string responseFromServer;
        public string SmsBalanace()
        {


            {
                //  string url = "http://bulksms.karodial.com/balancecheck.php?username=faraazmohdkhan&api_password=9d949ccz3f9t7efwp&priority=4";
                string url = "";
                //HTTP connection
                HttpWebRequest myReq = (HttpWebRequest)WebRequest.Create(url);

                //Get response from Ozeki NG SMS Gateway Server and read the answer
                HttpWebResponse myResp = (HttpWebResponse)myReq.GetResponse();
                System.IO.StreamReader respStreamReader = new System.IO.StreamReader(myResp.GetResponseStream());
                string responseString = respStreamReader.ReadToEnd();
                respStreamReader.Close();
                myResp.Close();
                responseFromServer = responseString;
                // textboxError.Visible = true;
            }
            return responseFromServer;
        }

        public string SmsSend(string Number, string message)
        {


            {
                string url = "http://smsone.karodial.com/pushsms.php?username=akmals&api_password=66c7a11u862lh7m7l&sender=AKMALS&to=" + Number + "&message=" + message + "&priority=11";

                //HTTP connection
                HttpWebRequest myReq = (HttpWebRequest)WebRequest.Create(url);

                //Get response from Ozeki NG SMS Gateway Server and read the answer
                HttpWebResponse myResp = (HttpWebResponse)myReq.GetResponse();
                System.IO.StreamReader respStreamReader = new System.IO.StreamReader(myResp.GetResponseStream());
                string responseString = respStreamReader.ReadToEnd();
                respStreamReader.Close();
                myResp.Close();
                responseFromServer = responseString;
                // textboxError.Visible = true;
            }
            return responseFromServer;
        }

        public static string Base64Encode(string plainText)
        {
            var plainTextBytes = System.Text.Encoding.UTF8.GetBytes(plainText);
            return System.Convert.ToBase64String(plainTextBytes);


        }

        public static string Base64Decode(string base64EncodedData)
        {
            var base64EncodedBytes = System.Convert.FromBase64String(base64EncodedData);
            return System.Text.Encoding.UTF8.GetString(base64EncodedBytes);
        }

        public string PopulateBody(string userName, string title, string url, string description)
        {
            string body = string.Empty;
            using (StreamReader reader = new StreamReader(HttpContext.Current.Server.MapPath("~/EmailTemplate.htm")))
            {
                body = reader.ReadToEnd();
            }
            body = body.Replace("{UserName}", userName);
            body = body.Replace("{Title}", title);
            body = body.Replace("{Url}", url);
            body = body.Replace("{Description}", description);
            return body;
        }

        public string Populate_registerBody(string userName, string password)
        {
            string body = string.Empty;
            using (StreamReader reader = new StreamReader(HttpContext.Current.Server.MapPath("~/Email_register.html")))
            {
                body = reader.ReadToEnd();
            }
            body = body.Replace("{User_email}", userName);
            body = body.Replace("{User_Password}", password);
            return body;
        }







    }
}