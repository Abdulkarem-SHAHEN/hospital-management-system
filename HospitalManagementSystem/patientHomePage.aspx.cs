using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HospitalManagementSystem
{
    public partial class patientHomePage : System.Web.UI.Page
    {
        jrkEntities db = new jrkEntities(); 
        protected void Page_Load(object sender, EventArgs e)
        {
            // only a signed-in user with this role may open the page
            Auth.RequireRole("p");


            if (!IsPostBack)
            {
                var patient = db.patients.Find(Auth.UserId);
                if (patient == null)
                {
                    // the patient was deleted while still logged in
                    Auth.SignOut();
                    Response.Redirect("~/login.aspx");
                    return;
                }

                var y = patient.image;
                if(y==null)
                {
                    Image1.ImageUrl = "~/Content/images/generaluser.png";
                    return;
                }

                byte[] x = y.ToArray();

                string base64Image = Convert.ToBase64String(x);
                string fileExtension;
                fileExtension = ".unknown"; // Default to unknown extension

                if (x.Length < 4)
                {
                    fileExtension = ".unknown";
                    return;
                }

                string headerType = x[0].ToString("X2") + x[1].ToString("X2") + x[2].ToString("X2") + x[3].ToString("X2");

                switch (headerType)
                {
                    case "FFD8": // JPEG
                        fileExtension = ".jpg";
                        break;
                    case "89504E47": // PNG
                        fileExtension = ".png";
                        break;
                    case "47494638": // GIF
                        fileExtension = ".gif";
                        break;
                    case "424D": // BMP
                        fileExtension = ".bmp";
                        break;
                    default:
                        fileExtension = ".unknown"; // Unknown extension
                        break;
                }

                Image1.ImageUrl = $"data:{fileExtension};base64,{base64Image}";







            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("imageDeletion.aspx");
        }





        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("patientEditImage.aspx");
        }
    }
}