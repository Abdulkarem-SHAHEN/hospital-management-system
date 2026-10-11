using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HospitalManagementSystem
{
    public partial class adminEditsTops : System.Web.UI.Page
    {
        jrkEntities db = new jrkEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            // only a signed-in user with this role may open the page
            Auth.RequireRole("t");

            if (!IsPostBack)
            {
                HttpCookie myco = Request.Cookies["edit"];
                if (myco != null)
                {
                    var x = db.topmgmts.Find(Int32.Parse(myco["id"]));
                    TextBox1.Text = x.id.ToString();
                    TextBox2.Text = x.name;
                    TextBox3.Text = x.type;


                }
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            var x = db.topmgmts.Find(Int32.Parse(TextBox1.Text));
            x.name = TextBox2.Text;
            x.type = TextBox3.Text; 
            db.SaveChanges();
            Response.Redirect("adminHomePage.aspx");

        }
    }
}