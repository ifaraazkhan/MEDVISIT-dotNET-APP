using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace MD_Clinic
{
    public partial class Profile : System.Web.UI.Page
    {
        string Doctor_id = "";
        string Clinic_id = "";
        GeneralClass cls = new GeneralClass();
        ValidationChk chk = new ValidationChk();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Doctor_id = Session["doctor_id_session"].ToString();
                Clinic_id = Session["clinic_id_session"].ToString();

                // doctor profile 
                Doctor_Profile();

                //doctor education
                Doctor_Education();
               

            }
        }

        private void Doctor_Profile()
        {
            DataSet ds;
            ds = cls.Accessdb_return_dataset("select * from doctors where id=" + Doctor_id + "", "doctors");

            txt_email.Text = ds.Tables["doctors"].Rows[0]["email"].ToString();
            txt_mobile.Text = ds.Tables["doctors"].Rows[0]["phone"].ToString();
            txt_name.Text = ds.Tables["doctors"].Rows[0]["name"].ToString();
            txt_practice.Text = ds.Tables["doctors"].Rows[0]["practicing_from"].ToString();
            txt_description.Text = ds.Tables["doctors"].Rows[0]["prof_description"].ToString();
        }

        private void Doctor_Education()
        {
            DataSet ds;
            ds = cls.Accessdb_return_dataset("select * from doctor_qualifications where id=" + Doctor_id + "", "doctor_qualifications");
            if (ds.Tables[0].Rows.Count != 0)
            {
                txt_degree.Text = ds.Tables["doctor_qualifications"].Rows[0]["qualification_name"].ToString();
                txt_college.Text = ds.Tables["doctor_qualifications"].Rows[0]["institute_name"].ToString();
                txt_certificate.Text = ds.Tables["doctor_qualifications"].Rows[0]["certificate_name"].ToString();
                txt_year.Text = ds.Tables["doctor_qualifications"].Rows[0]["degree_year"].ToString();
            }
               
           
        }
    }
}