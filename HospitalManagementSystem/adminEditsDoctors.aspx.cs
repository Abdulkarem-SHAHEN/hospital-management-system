using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HospitalManagementSystem
{
    public partial class adminEditsDoctors : System.Web.UI.Page
    {
        jrkEntities db = new jrkEntities();
       
        protected void Page_Load(object sender, EventArgs e)
        {
            // only a signed-in user with this role may open the page
            Auth.RequireRole("t");

            if (!Page.IsPostBack)
            {
                HttpCookie myco = Request.Cookies["edit"];
                string id = myco["id"];

                TextBox1.Text = id; int t=0;
                if (myco!=null)
                {
                t= Convert.ToInt32(id);
                }
                // load the doctor from the database
                var x = from c in db.doctors where c.id == t select c;
                var y = x.ToList();
                TextBox2.Text = y.ElementAt(0).name;
                TextBox3.Text = y.ElementAt(0).spec;
                bool b = (bool)y.ElementAt(0).full_time;
                if (b)
                {
                    RadioButtonList1.SelectedIndex = 0;
                }
                else RadioButtonList1.SelectedIndex = 1;
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            var x = db.doctors.Find(Int32.Parse(TextBox1.Text));
            string name = TextBox2.Text;
            bool work;
            string spec = TextBox3.Text;
            if (RadioButtonList1.SelectedIndex == 0)
            {
                work = true;
            }
            else
            {
                work = false;
            }

            x.spec = spec;  x.name  = name; x.full_time = work;
            db.SaveChanges();
            Response.Redirect("adminHomePage.aspx");
        }
    }
}