using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HospitalManagementSystem
{
    public partial class adminDeleteDoctor : System.Web.UI.Page
    {
        jrkEntities  db = new jrkEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            // only a signed-in user with this role may open the page
            Auth.RequireRole("t");

            if (!IsPostBack)
            {
                HttpCookie myco = Request.Cookies["edit"];

                var x = db.doctors.Find(Int32.Parse(myco["id"]));
                Label1.Text += HttpUtility.HtmlEncode(x.name + " which has id " + x.id + " and specialized in " + x.spec);



            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            HttpCookie myco = Request.Cookies["edit"];
            int id = Int32.Parse(myco["id"]);   
            // remove the login account first (not every doctor has one), then the doctor
            var y = db.accounts.FirstOrDefault(c => (c.id == id) && c.role == "d");
            if (y != null)
            {
                db.accounts.Remove(y);
                db.SaveChanges();
            }

            var x = db.doctors.Find(id);
            db.doctors.Remove(x);
            db.SaveChanges();
            Response.Redirect("adminHomePage.aspx");

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminHomePage.aspx");


        }
    }
}