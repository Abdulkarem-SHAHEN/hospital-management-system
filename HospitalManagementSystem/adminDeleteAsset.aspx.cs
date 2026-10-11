using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HospitalManagementSystem
{
    public partial class adminDeleteAsset : System.Web.UI.Page
    {
        jrkEntities db = new jrkEntities(); 
        protected void Page_Load(object sender, EventArgs e)
        {
            // only a signed-in user with this role may open the page
            Auth.RequireRole("t");

            if (!IsPostBack)
            {
                HttpCookie myco = Request.Cookies["edit"];
                int id = Int32.Parse(myco["id"]);
               
                var x = db.assets.Find(id);
                Label2.Text = HttpUtility.HtmlEncode("which has id " + x.id + " and his name is " + x.item_name); 
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            HttpCookie myco = Request.Cookies["edit"];
            int id = Int32.Parse(myco["id"]);

            var x = db.assets.Find(id);
            db.assets.Remove(x);
            db.SaveChanges();
            Response.Redirect("adminHomePage.aspx");

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminHomePage.aspx")
;        }
    }
}