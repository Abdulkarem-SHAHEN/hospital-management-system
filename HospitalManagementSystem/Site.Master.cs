using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HospitalManagementSystem
{
    public partial class SiteMaster : System.Web.UI.MasterPage
    {
        jrkEntities db = new jrkEntities();  
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Auth.IsLoggedIn)
            {
                welcomeText.Text = "";
                fl.Text = "not logged in";
                logout.Visible = false;
                login.Visible = true;
                return;
            }

            int id = Auth.UserId;
            string name = null;
            switch (Auth.Role)
            {
                case "d":
                    {
                        var x = db.doctors.Find(id);
                        if (x != null) name = "welcome Dr." + x.name;
                        break;
                    }
                case "t":
                    {
                        var x = db.topmgmts.Find(id);
                        if (x != null) name = "welcome topMgmt." + x.name;
                        break;
                    }
                case "p":
                    {
                        var x = db.patients.Find(id);
                        if (x != null) name = "welcome patient." + x.first_name + x.last_name;
                        break;
                    }
                case "s":
                    {
                        var x = db.staffs.Find(id);
                        if (x != null) name = "welcome " + x.name;
                        break;
                    }
            }

            if (name == null)
            {
                // the user was deleted while still logged in
                Auth.SignOut();
                Response.Redirect("~/login.aspx");
                return;
            }

            // names come from user input, so they are encoded before being written to the page
            welcomeText.Text = HttpUtility.HtmlEncode(name);
            fl.Text = "logged in";
            login.Visible = false;
            logout.Visible = true;
        }

        protected void logout_Click(object sender, EventArgs e)
        {
            Auth.SignOut();

            // also drop the cookie that remembers the record an administrator selected
            HttpCookie edit = new HttpCookie("edit", "");
            edit.Expires = DateTime.Now.AddDays(-1);
            Response.Cookies.Add(edit);

            Response.Redirect("~/Home.aspx");
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/login.aspx");
        }

        protected void welcomeText_Click(object sender, EventArgs e)
        {
            if (Auth.IsLoggedIn)
            {
                Response.Redirect(Auth.HomePageFor(Auth.Role));
            }
        }

        protected void LinkButton4_Click(object sender, EventArgs e)
        {

        }
    }
}