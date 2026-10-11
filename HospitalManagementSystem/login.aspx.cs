using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HospitalManagementSystem
{
    public partial class login : System.Web.UI.Page
    {
        jrkEntities db = new jrkEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            // already logged in: go straight to the home page of the role
            if (Auth.IsLoggedIn)
            {
                Response.Redirect(Auth.HomePageFor(Auth.Role));
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/usersignup.aspx");
        }


        protected void Button1_Click(object sender, EventArgs e)
        {
            // read the form values
            string userName = TextBox1.Text;
            string pass = TextBox2.Text;
            string role = DropDownList2.Text;
            switch (role)
            {
                case "Admin": role = "t"; break;
                case "Patient": role = "p"; break;
                case "Employee": role = "s"; break;
                case "Doctor": role = "d"; break;

            }

            // look the account up by email and role, then check the password against its stored hash
            var acc = db.accounts.FirstOrDefault(c => c.email == userName && c.role == role);
            if (acc != null && acc.id.HasValue && PasswordHasher.Verify(pass, acc.password))
            {
                Auth.SignIn(acc.id.Value, role);

                if (role == "t")
                {
                    // remembers which record the administrator selected in the dashboard
                    HttpCookie co = new HttpCookie("edit");
                    co.Values.Add("role", "");
                    co.Values.Add("id", "");
                    co.Values.Add("email", "");
                    Response.Cookies.Add(co);
                }

                Response.Redirect(Auth.HomePageFor(role));
            }
            else
            {
                Label4.Text = "\nSomething wrong, invalid ID or password, also check your role";   
            }
        }
    }
}