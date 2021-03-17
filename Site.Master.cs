using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MD_Clinic
{
    public partial class SiteMaster : MasterPage
    {
        string user_id = "";
        string user_type = "";
        string token = "";
        string Clinic_id = "";
        string Doctor_id = "";
        GeneralClass cls = new GeneralClass();
        ValidationChk chk = new ValidationChk();


        protected void Page_Load(object sender, EventArgs e)
        {
            
            user_id = Session["userid"].ToString();
            user_type = Session["usertype"].ToString();
            token = Session["token"].ToString();
            Doctor_id = Session["doctor_id_session"].ToString();
            Clinic_id = Session["clinic_id_session"].ToString();
            //Clinic name
            Get_ClinicName(user_id);
            
            if (!IsPostBack)
            {
               
                lbl_doctor_name.Text = cls.Acessdb_return("SELECT name FROM  doctors where id = '" + Doctor_id + "'");
                // check doctor mapping
                Check_Clinic_Doctor_Mapping();

            }

        }

        private void Check_Clinic_Doctor_Mapping()
        {
            //get clinic_id 
          
            int check_multiple_doctor = Convert.ToInt32(cls.Acessdb_return("select count(*) from doctor_clinics where clinic_id = '" + Clinic_id + "'"));

            //check for total doctor count 
            if (check_multiple_doctor > 1)
            {
                //bind doctor list here
                string binddata = "SELECT dc.clinic_id, d.name,d.id as doctor_id, d.email, d.phone, d.profile_picture FROM doctor_clinics dc INNER JOIN doctors d ON dc.doctor_id = d.id where dc.clinic_id='"+Clinic_id+"'";
                cls.bind_grid_list(binddata, ListView_DoctorMapping);

            }
            else if (check_multiple_doctor == 1)
            {  //hide change doctor
                link_changedr.Visible = false;
            }     
        }

        private void Get_ClinicName(string user_id)
        {

            // Get Clinic Name
           
            lbl_clinicname.Text = cls.Acessdb_return("select clinic_name from clinics where id="+ Clinic_id + "");
        }

        protected void link_logout_Click(object sender, EventArgs e)
        {
            // logout 
            Session.Clear();
            Session.RemoveAll();
            Response.Redirect("Default.aspx");
            

        }

        protected void link_changedr_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "change_Profile_modal", "$(document).ready(function () {$('#change_Profile_modal').modal();});", true);
         
        }

        protected void ListView_DoctorMapping_ItemUpdating(object sender, ListViewUpdateEventArgs e)
        {
            try
            {
               // ListViewItem item = ListView_DoctorMapping.Items[e.ItemIndex];
               // Label ad_id = (Label)item.FindControl("lbl_id");
               // string id = ad_id.Text;
               // Session["doctor_id_session"] = ad_id;
                //redirect to detailed view
               // Server.TransferRequest(Request.Url.AbsolutePath, false);

            }
            catch (Exception)
            {

                throw;
            }

        }


        protected void UpdateButton_Click(object sender, EventArgs e)
        {
            LinkButton btn = sender as LinkButton;
            string doctor_updated_id = btn.CommandArgument;
            Session["doctor_id_session"] = doctor_updated_id;
            Response.Redirect("dashboard.aspx");
            //now update your data
        }

    }
}