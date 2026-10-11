using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HospitalManagementSystem
{
    public partial class adminAddTop : System.Web.UI.Page
    {
        jrkEntities db = new jrkEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            // only a signed-in user with this role may open the page
            Auth.RequireRole("t");


        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string name = TextBox1.Text;
            string email= TextBox2.Text;
            string pass = TextBox3.Text;
            //check email 
            var x = db.accounts.Find(email);
            if (x != null)
            {
                Label4.Visible = true;


            }
            else
            {
                var y = new topmgmt
                {
                    name = name,
                    type = "h",
                };

                db.topmgmts.Add(y);
                db.SaveChanges();


                // Entity Framework fills in the generated id after SaveChanges
                int id = y.id;


                var z = new account
                {
                    email = email,
                    password = PasswordHasher.Hash(pass),
                    role = "t",
                    id = id,
                };
                db.accounts.Add(z);
                db.SaveChanges();
                Response.Redirect("adminHomePage.aspx");

            }



        }
    }
}