using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HospitalManagementSystem
{

    public partial class adminEditsPatients : System.Web.UI.Page
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
                TextBox1.Text = x.id.ToString();
                FName.Text = x.first_name;
                LName.Text = x.last_name;
                Age.Text = x.age.ToString();    

                if (x.gender == "m") 
                {
                    Gender.SelectedIndex = 1;

                }else
                {
                    Gender.SelectedIndex = 0;
                }
                PhoneNum.Text = x.phone_number; 

            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            HttpCookie myco = Request.Cookies["edit"];
            var x = db.patients.Find(Int32.Parse(myco["id"]));
            x.phone_number = PhoneNum.Text;
            
            x.age = Int32.Parse(Age.Text);
            x.first_name = FName.Text;
            x.last_name = LName.Text;
            if (Gender.SelectedIndex == 1)
            {
                x.gender = "m";

            }
            else
            {
                x.gender = "f";

            }

            db.SaveChanges();
            Response.Redirect("adminHomePage.aspx");


        }


    }
}