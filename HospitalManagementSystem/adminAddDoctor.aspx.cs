using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HospitalManagementSystem
{
    public partial class adminAddDoctor : System.Web.UI.Page
    {
        jrkEntities db = new jrkEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            // only a signed-in user with this role may open the page
            Auth.RequireRole("t");


        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            bool work;
            if (CheckBox1.Checked)
            {
                work = true;
            }
            else work = false;
            var x = new doctor
            {
                name = TextBox1.Text,
                spec = TextBox2.Text,
                full_time = work
            };

            string email = TextBox3.Text;
            string pass = TextBox4.Text;
            // check whether the email is already used
            var y = db.accounts.Find(email);
            if (y != null)
            {
                Label5.Visible = true;
            }

            else
            {

                // add the new doctor
                db.doctors.Add(x);
                db.SaveChanges();


                // get the id of the doctor that was just added
                var doc = from c in db.doctors orderby c.id descending select c;
                var doc2 = doc.ToList();
                int id = doc2.ElementAt(0).id;
                
                
                
                var z = new account
                {
                    email = email,
                    password = PasswordHasher.Hash(pass),
                    role = "d",
                    id = id
                };

                // add the new account
                db.accounts.Add(z);
                db.SaveChanges();
                Response.Redirect("adminHomePage.aspx");
            }

        }
    }
}