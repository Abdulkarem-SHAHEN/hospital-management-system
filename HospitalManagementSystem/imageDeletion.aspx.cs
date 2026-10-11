using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HospitalManagementSystem
{
    public partial class imageDeletion : System.Web.UI.Page
    {
        jrkEntities db= new jrkEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            // only a signed-in user with this role may open the page
            Auth.RequireRole("p");


        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("PatientHomePage.aspx"); 
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            var x = db.patients.Find(Auth.UserId);
            x.image = null;
            db.SaveChanges();

            Response.Redirect("patientHomePage.aspx");






        }
    }
}