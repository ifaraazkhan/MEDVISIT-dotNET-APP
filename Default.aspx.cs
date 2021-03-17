using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MD_Clinic
{
    public partial class Default : System.Web.UI.Page
    {
        GeneralClass cls = new GeneralClass();
        ValidationChk chk = new ValidationChk();
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void Button_login_Click(object sender, EventArgs e)
        {
            string err = "";
            if (chk.TextNull(txt_username.Text))
            {
                err += "Enter USER ID...";
            }

            if (chk.TextNull(txt_pass.Text))
            {
                err += "Enter Password...";
            }


            if (err != "")
            {
                Response.Write("<script type=\"text/javascript\">alert('" + err + "...(*._.*)');</script>");
            }
            else
            {
                
                string check = cls.Acessdb_return("select count(*) from clinic_user_accounts where email='" + txt_username.Text.Trim() + "' and password='" + txt_pass.Text.Trim() + "'");
                if (check == "0")
                {
                    Response.Write("<script type=\"text/javascript\">alert('Username/Password is incorrect TRY AGAIN...(*._.*)');</script>");
                }
                else
                {
                    ///check accountstatus
                    ///check usertype
                    ///update lastlogin

                    //check AccountStatus
                    string account_status = cls.Acessdb_return("select account_status from clinic_user_accounts where email='" + txt_username.Text.Trim() + "' and password='" + txt_pass.Text.Trim() + "' ");
                    if (account_status == "1")
                    {
                        //Check UserType
                        string usertype = cls.Acessdb_return("select user_type from clinic_user_accounts where email='" + txt_username.Text.Trim() + "' and password='" + txt_pass.Text.Trim() + "'");
                        string Clinic_id = cls.Acessdb_return("select clinic_id from clinic_user_accounts where email= '" + txt_username.Text.Trim() + "'");
                        string Doctor_id = cls.Acessdb_return("SELECT doctor_id FROM  doctor_clinics where clinic_id='" + Clinic_id + "'");

                        Session["doctor_id_session"] = Doctor_id;
                        Session["clinic_id_session"] = Clinic_id;
                        Session["userid"] = txt_username.Text;
                        Session["usertype"] = usertype;
                        Session["token"] = usertype + txt_pass.Text;

                            
                        Response.Redirect("Dashboard.aspx");
                       

                    }
                    else if(account_status == "0")
                    {
                        Response.Write("<script type=\"text/javascript\">alert('Your account is temporary disabled please contact support team...(*._.*)');</script>");
                    }
                    


                }

            }
        }
    }
}