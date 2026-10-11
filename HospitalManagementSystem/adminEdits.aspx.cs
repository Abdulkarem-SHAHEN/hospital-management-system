using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HospitalManagementSystem
{
    public partial class adminEdits : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // only a signed-in user with this role may open the page
            Auth.RequireRole("t");

            string id = Request.QueryString["id"];
            HttpCookie myco = Request.Cookies["edit"];
            string role = myco["role"];
            myco["id"] = id;
            Response.Cookies.Add(myco);
            switch(role) {
                case "d": Response.Redirect("adminEditsDoctors.aspx");  break;
                case "p": Response.Redirect("adminEditsPatients.aspx"); break;
                case "t": Response.Redirect("adminEditsTops.aspx");     break;
                case "as": Response.Redirect("adminEditsAssets.aspx");  break;

            }

        }
    }
}