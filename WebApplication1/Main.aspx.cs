using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class Main : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            txtBirthDay.Style.Add("display", "none");
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {

        }

        protected void validateMin3CheckedTechList_ServerValidate(object source, ServerValidateEventArgs args)
        {
            //if (!cbxRules.Checked && !ValidationSummary.Page.IsValid)
            //    args.IsValid = false;
        }

        protected void validateBtnRegister_ServerValidate(object source, ServerValidateEventArgs args)
        {
            
        }

        protected void cbxRules_CheckedChanged(object sender, EventArgs e)
        {

            
        }

        protected void txtCalendar_TextChanged(object sender, EventArgs e)
        {
            string birthDate = txtCalendar.Text;

            DateTime birthDateTime = DateTime.Parse(birthDate);
            DateTime today = DateTime.Today;

            int age = today.Year - birthDateTime.Year;

            if (birthDateTime > today.AddYears(-age))
                age--;

            txtBirthDay.Text = age.ToString();
        }
    }
}