using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MD_Clinic
{
    public partial class calendar : System.Web.UI.Page
    {
        string Clinic_id = "";
        string Doctor_id = "";
        GeneralClass cls = new GeneralClass();
        ValidationChk chk = new ValidationChk();
        DateTime dt_global;
        protected void Page_Load(object sender, EventArgs e)
        {
           // DayOfWeek wk = DateTime.Today.DayOfWeek;
            dt_global = DateTime.Now;
            Doctor_id = Session["doctor_id_session"].ToString();
            Clinic_id = Session["clinic_id_session"].ToString();

            if (!IsPostBack)
            {
                Doctor_id = Session["doctor_id_session"].ToString();
                Clinic_id = Session["clinic_id_session"].ToString();
                //bind doctor list here
                //  string binddata = "select * from tbl_doctor_days_off where clinic_id = '" + Clinic_id + "'";
                //  cls.bind_grid_list(binddata, ListView_Days);
                Days_off_datatable(dt_global);
                lbl_today_date.Text = dt_global.ToString("MM/dd/yyyy");
                lbl_today_day.Text = dt_global.ToString("dddd");
            }
        }
        
        private void Days_off_datatable(DateTime fd)
        {
            string start_date = fd.ToString("yyyy-MM-dd");
            string end_date = fd.AddDays(6).ToString("yyyy-MM-dd");
            DataSet ds = new DataSet();
            DataSet ds_db = new DataSet();
            DataTable dt;
            DataRow dr;
            DataColumn id;
            DataColumn day;
            DataColumn date;
            DataColumn status;
            dt = new DataTable();
            //creating column of datatable with datatype  
            id = new DataColumn("id", Type.GetType("System.String"));
            day = new DataColumn("day", Type.GetType("System.String"));
            date = new DataColumn("date", Type.GetType("System.String"));
            status = new DataColumn("status", Type.GetType("System.String"));
            //bind data table columns in datatable  
            dt.Columns.Add(id);
            dt.Columns.Add(day);
            dt.Columns.Add(date);
            dt.Columns.Add(status);

           
            //dr = dt.NewRow();
            for (int i =0; i<7; i++)
            {
                    //creating data row and assiging the value to columns of datatable  
                    dr = dt.NewRow();
                    dr["id"] = 0;
                    dr["day"] = fd.AddDays(i).ToString("ddd");
                    dr["date"] = fd.AddDays(i).ToString("MM/dd/yyyy");
                    dr["status"] = 0;
                
                    dt.Rows.Add(dr);

            }
            //Add datatable to the dataset  


            // Now check DB values and update the above datatable
            //calling databse to get values from publish calendar
            ds_db = cls.Accessdb_return_dataset("select id,day,date,status from tbl_doctor_days_off where doctor_id=" + Doctor_id + " and clinic_id=" + Clinic_id + " and date between '" + start_date + "' and '" + end_date + "'", "tbl_doctor_days_off");

            foreach (DataRow datarow_dt in dt.Rows)
            {
                foreach (DataRow datarow in ds_db.Tables[0].Rows)
                {
                    //fill id from database
                    datarow_dt["id"] = datarow["id"];
                    // txt_email.Text = ds.Tables["doctors"].Rows[0]["email"].ToString();
                    DateTime db_date = DateTime.Parse(datarow["date"].ToString());
                    DateTime data_table_date = DateTime.Parse(datarow_dt["date"].ToString());

                    if (data_table_date.ToString("MM/dd/yyyy") == db_date.ToString("MM/dd/yyyy"))
                    {
                        datarow_dt["status"] = 1;
                    }
                }
            }
            //bind data to data controls  
            ds.Tables.Add(dt);
            ListView_Days.DataSource = ds.Tables[0];
            ListView_Days.DataBind();
        }

        protected void ListView_Days_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            Button working = (Button)e.Item.FindControl("btn_working");
            Button non_working = (Button)e.Item.FindControl("btn_Nonworking");
            string aa = working.Text;
            if(aa == "1")
            {
                non_working.Visible = true;
                non_working.Text = "Non-Working";
                working.Visible = false;

            }
            else
            {
                non_working.Visible = false;
                working.Visible = true;
                working.Text = "Working";
            }
        }

        protected void ListView_Days_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            Label lbl_date = (Label)e.Item.FindControl("lbl_date");
            DateTime dt = Convert.ToDateTime(lbl_date.Text);

            switch (e.CommandName)
            {
                case ("Status_Delete"):
                    int id = Convert.ToInt32(e.CommandArgument);
                    // delete entry from tbl_doctor_days_off;
                    cls.Acessdb("delete from tbl_doctor_days_off where id='"+id+"' and doctor_id="+Doctor_id+" and clinic_id="+Clinic_id+"");
                    break;
                case ("Status_Add"):
                    id = Convert.ToInt32(e.CommandArgument);
                    // add entry from tbl_doctor_days_off;
                    cls.Acessdb("insert into tbl_doctor_days_off(doctor_id,clinic_id,date,day,status) values ("+Doctor_id+","+Clinic_id+",'"+dt+"','"+dt.ToString("dddd")+"','1')");
                    break;
            }

            Days_off_datatable(dt_global);
        }
    }
}