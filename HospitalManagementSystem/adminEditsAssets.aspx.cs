using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HospitalManagementSystem
{
    public partial class adminEditsAssets : System.Web.UI.Page
    {
        jrkEntities db = new jrkEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            // only a signed-in user with this role may open the page
            Auth.RequireRole("t");
if (!IsPostBack)
            {
                HttpCookie myco = Request.Cookies["edit"];

                var x = db.assets.Find(Int32.Parse(myco["id"]));
                TextBox1.Text = x.id.ToString();
                TextBox2.Text = x.item_name.ToString(); 
                TextBox3.Text = x.count.ToString();
                TextBox4.Text = x.description.ToString();

            }

        }
    }
}