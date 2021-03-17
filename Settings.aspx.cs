using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MD_Clinic
{
    public partial class Settings : System.Web.UI.Page
    {
        string Doctor_id = "";
        string Clinic_id = "";
        GeneralClass cls = new GeneralClass();
        ValidationChk chk = new ValidationChk();

        protected void Page_Load(object sender, EventArgs e)
        {
            Doctor_id = Session["doctor_id_session"].ToString();
            Clinic_id = Session["clinic_id_session"].ToString();
            if (!IsPostBack)
            {
                //get if there is slot values already provided 
                string check_val = cls.Acessdb_return("  select count(*) from calendar_setting where clinic_id = " + Clinic_id + " and doctor_id= " + Doctor_id + "");
                if (Convert.ToInt32(check_val) == 0)
                {
                    // no values found 

                }
                else
                {
                    txt_end_time.Text = cls.Acessdb_return("select end_time from calendar_setting where clinic_id = " + Clinic_id + " and doctor_id= " + Doctor_id + "");
                    txt_end_time.Enabled = false;

                    txt_start_tme.Text = cls.Acessdb_return("select start_time from calendar_setting where clinic_id = " + Clinic_id + " and doctor_id= " + Doctor_id + "");
                    txt_start_tme.Enabled = false;

                    ddl_slot_time.SelectedValue = cls.Acessdb_return("select slot_time from calendar_setting where clinic_id = " + Clinic_id + " and doctor_id= " + Doctor_id + "");
                    ddl_slot_time.Enabled = false;

                    btn_setting_slot.Visible = false;
                    btn_edit.Visible = true;
                }
            }

        }

        protected void btn_setting_slot_Click(object sender, EventArgs e)
        {
            string err = "";
            if (chk.TextNull(txt_end_time.Text))
            {
                err += "Please enter Start time";
            }

            if (chk.TextNull(txt_start_tme.Text))
            {
                err += "Please enter End Time";
            }
            if (ddl_slot_time.SelectedValue == "0")
            {
                err += "Please select Slot duration";
            }


            if (err != "")
            {
                Response.Write("<script type=\"text/javascript\">alert('" + err + "...(*._.*)');</script>");
            }
            else
            {
                string start_time = txt_start_tme.Text;
                string end_time = txt_end_time.Text;
                string slot_duration = ddl_slot_time.SelectedItem.Value.ToString();
                string check_val = cls.Acessdb_return("select count(*) from calendar_setting where clinic_id = " + Clinic_id + " and doctor_id= " + Doctor_id + "");
                if (Convert.ToInt32(check_val) == 0)
                {
                    try
                    {
                        cls.Acessdb("insert into calendar_setting(clinic_id,doctor_id,start_time,end_time,slot_time) values (" + Clinic_id + "," + Doctor_id + ",'" + start_time + "','" + end_time + "'," + slot_duration + ")");
                        string page = "Settings.aspx";
                        string myStringVariable = "Updated Successfully";
                        ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + myStringVariable + "');window.location.href='" + page + "' ;", true);
                    }
                    catch
                    {
                        Response.Write("<script type=\"text/javascript\">alert('some error occured Please try after somemtime or contact support...(*._.*)');</script>");
                    };
                }
                else
                {
                    try
                    {
                        cls.Acessdb("update calendar_setting set start_time= '" + start_time + "',end_time= '" + end_time + "',slot_time= " + slot_duration + " where clinic_id= " + Clinic_id + " and doctor_id= " + Doctor_id + "");
                        string page = "Settings.aspx";
                        string myStringVariable = "Updated Successfully";
                        ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + myStringVariable + "');window.location.href='" + page + "' ;", true);
                    }
                    catch
                    {
                        Response.Write("<script type=\"text/javascript\">alert('some error occured Please try after somemtime or contact support...(*._.*)');</script>");
                    };
                }
                    

            }
        }

        protected void btn_edit_Click(object sender, EventArgs e)
        {
            txt_end_time.Text = "";
            txt_end_time.Enabled = true;

            txt_start_tme.Text = "";
            txt_start_tme.Enabled = true;

            ddl_slot_time.SelectedValue = "0";
            ddl_slot_time.Enabled = true;

            btn_setting_slot.Visible = true;
            btn_edit.Visible = false;
        }

        protected void btn_changePassword_Click(object sender, EventArgs e)
        {
            string err = "";
            if (chk.TextNull(txt_password.Text))
            {
                err += "Please enter your Current password";
            }

            if (chk.TextNull(txt_NewPassword.Text))
            {
                err += "Please enter New Password";
            }
            if (chk.TextNull(txt_ConfirmPass.Text)) 
            {
                err += "Please enter Confirm Password";
            }



            if (err != "")
            {
                Response.Write("<script type=\"text/javascript\">alert('" + err + "...(*._.*)');</script>");
            }
            else
            {
                //check new and confirm password 
                if (txt_ConfirmPass.Text != txt_NewPassword.Text)
                {
                    Response.Write("<script type=\"text/javascript\">alert('New Password and Confirm Password Not Matched , Please Re-enter ');</script>");
                }
                else
                {
                    //check entered old Password 
                    string old_pass = cls.Acessdb_return("select password from clinic_user_accounts where clinic_id = "+Clinic_id+" and user_id = "+Doctor_id+" ");
                    if(txt_password.Text == old_pass)
                    {
                        try
                        {
                            cls.Acessdb("update clinic_user_accounts set password = '"+txt_ConfirmPass.Text.Trim()+ "' where  clinic_id = " + Clinic_id + " and user_id = " + Doctor_id + " ");
                            string page = "Dashboard.aspx";
                            string myStringVariable = "Password Updated Successfully";
                            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + myStringVariable + "');window.location.href='" + page + "' ;", true);
                        }
                        catch
                        {
                            Response.Write("<script type=\"text/javascript\">alert('some error occured Please try after somemtime or contact support...(*._.*)');</script>");
                        };

                    }
                    else
                    {
                        Response.Write("<script type=\"text/javascript\">alert('You have entered Wrong Current Password, Please try again');</script>");
                    }
                }
            }
            }
    }
}