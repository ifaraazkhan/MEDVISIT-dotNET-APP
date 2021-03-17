using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
namespace MD_Clinic
{
    internal class ValidationChk
    {
        public ValidationChk()
        {
            //
            // TODO: Add constructor logic here
            //
        }
        public Boolean TextNull(string txt)
        {
            if (string.IsNullOrEmpty(txt))
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        public Boolean TextValidString(string txt)
        {
            if (!checkValidString(txt))
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public bool checkValidString(string input)
        {
            const string regExpr = @"^[a-zA-Z]+$";
            System.Text.RegularExpressions.Match m = System.Text.RegularExpressions.Regex.Match(input, regExpr);
            if (m.Success)
            {
                return true;
            }
            else
            {
                return false;
            }

        }

        public Boolean EmailValidString(string txt)
        {
            if (!checkValidEmail(txt))
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        public bool checkValidEmail(string input)
        {
            const string regExpr = @"^(?("")("".+?""@)|" + @"(([0-9a-zA-Z]((\.(?!\.))|[-!#\$%&'\*\+/=\?\^`\{\}\|~\w])*)" + @"(?<=[0-9a-zA-Z])@))(?(\[)(\[(\d{1,3}\.){3}\d{1,3}\])" + @"|(([0-9a-zA-Z][-\w]*[0-9a-zA-Z]\.)+[a-zA-Z]{2,6}))$";
            System.Text.RegularExpressions.Match m = System.Text.RegularExpressions.Regex.Match(input, regExpr);
            if (m.Success)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        /////

        public Boolean Tel_Num_ValidString(string txt)
        {
            if (!checkValidNumber(txt))
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        public bool checkValidNumber(string input)
        {
            const string regExpr = "^[0-9]*${11}";
            System.Text.RegularExpressions.Match m = System.Text.RegularExpressions.Regex.Match(input, regExpr);
            if (m.Success)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        /////

        public Boolean MOB_Num_ValidString(string txt)
        {
            if (!checkMobValidNumber(txt))
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        public bool checkMobValidNumber(string input)
        {
            const string regExpr = "^[0-9]*${10}";
            System.Text.RegularExpressions.Match m = System.Text.RegularExpressions.Regex.Match(input, regExpr);
            if (m.Success)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        ///
        public Boolean PIN_Num_ValidString(string txt)
        {
            if (!checkPinValidNumber(txt))
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        public bool checkPinValidNumber(string input)
        {
            const string regExpr = "^[0-9]*${6}";
            System.Text.RegularExpressions.Match m = System.Text.RegularExpressions.Regex.Match(input, regExpr);
            if (m.Success)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public Boolean NUMValidString(string txt)
        {
            if (!checkNumValidNumber(txt))
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        public bool checkNumValidNumber(string input)
        {
            const string regExpr = "^[0-9]*$";
            System.Text.RegularExpressions.Match m = System.Text.RegularExpressions.Regex.Match(input, regExpr);
            if (m.Success)
            {
                return true;
            }
            else
            {
                return false;
            }
        }


        public bool DropDownChk(string ddl)
        {
            if (ddl == "0")
            {
                return true;
            }
            else
            {
                return false;
            }
        }


        public bool ItemNoChk(string item)
        {
            string i = "";
            string CS = ConfigurationManager.ConnectionStrings["connect"].ConnectionString.ToString();
            using (SqlConnection con = new SqlConnection(CS))
            {
                SqlCommand cmd = new SqlCommand("select ITEM_NO from QUES_Diary16_7 where DIARY_NO='" + Convert.ToInt32(item) + "'", con);
                con.Open();
                i = Convert.ToString(cmd.ExecuteScalar()).Trim() ?? "";
                con.Close();
                if (i == "")
                {
                    return false;
                }
                else
                {
                    return true;
                }
            }

        }
    }
}