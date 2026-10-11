using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HospitalManagementSystem
{
    public partial class adminAddAsset : System.Web.UI.Page
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
            int count = Int32.Parse(TextBox2.Text);
            string desc = TextBox3.Text;

            var x = new asset
            {
                item_name= name,    
                count = count,
                description = desc
            };
            db.assets.Add(x);
            db.SaveChanges();
            Response.Redirect("adminHomePage.aspx");




        }



    }
}