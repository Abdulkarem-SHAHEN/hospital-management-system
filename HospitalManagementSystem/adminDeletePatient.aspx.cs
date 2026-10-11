using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HospitalManagementSystem
{
    public partial class adminDeletePatient : System.Web.UI.Page
    {
        jrkEntities db = new jrkEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            // only a signed-in user with this role may open the page
            Auth.RequireRole("t");

            if (!IsPostBack)
            {
                HttpCookie myco = Request.Cookies["edit"];
                var x = db.patients.Find(Int32.Parse(myco["id"]));
                Label2.Text = HttpUtility.HtmlEncode("that has id= " + x.id + " and his name is " + x.first_name + " " + x.last_name + " from database?");



            }

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminHomePage.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            HttpCookie myco = Request.Cookies["edit"];
            int id = Int32.Parse(myco["id"]);
            string role = "p";
            // remove the login account first, then the patient
            var y = db.accounts.FirstOrDefault(c => c.id == id && c.role == role);
            if (y != null)
            {
                db.accounts.Remove(y);
                db.SaveChanges();
            }

            var x = db.patients.Find(id);
            db.patients.Remove(x);
            db.SaveChanges();
            Response.Redirect("adminHomePage.aspx");
        }
    }
}