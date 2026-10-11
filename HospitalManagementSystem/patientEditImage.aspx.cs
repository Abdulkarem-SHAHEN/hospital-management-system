using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HospitalManagementSystem
{
    public partial class patientEditImage : System.Web.UI.Page
    {
        jrkEntities db = new jrkEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            // only a signed-in user with this role may open the page
            Auth.RequireRole("p");


        }



        protected bool checkImage()
        {
            int id = Auth.UserId;

            // Check if a file is selected
            if (FileUpload1.HasFile)
            {
                // Get the file extension
                string fileExtension = Path.GetExtension(FileUpload1.FileName).ToLower();

                // Check if the file is an image (you can add more image formats if needed)
                if (fileExtension == ".jpg" || fileExtension == ".jpeg" || fileExtension == ".png" || fileExtension == ".gif")
                {
                    // Save the file to the server
                    string fileName = Guid.NewGuid().ToString() + fileExtension;
                    string filePath = Server.MapPath("~/Uploads/") + fileName;
                    FileUpload1.SaveAs(filePath);
                    byte[] imageBytes = File.ReadAllBytes(filePath);

                    // Insert the file path into the database
                    //InsertImagePathIntoDatabase(fileName);
                    var x = db.patients.Find(id);
                    x.image = imageBytes;
                    db.SaveChanges();

                    // Provide feedback to the user
                    return true;
                }
                else
                {
                    return false;
                }
            }
            else
            {
                return false;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (checkImage())
            {
                Response.Redirect("patientHomePage.aspx");
            }
        }
    }
}