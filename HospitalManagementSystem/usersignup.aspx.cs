using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace HospitalManagementSystem
{
    public partial class usersignup : System.Web.UI.Page
    {
        jrkEntities db = new jrkEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            // already logged in: go straight to the home page of the role
            if (Auth.IsLoggedIn)
            {
                Response.Redirect(Auth.HomePageFor(Auth.Role));
            }
        }

        protected void Password_TextChanged(object sender, EventArgs e)
        {

        }
        private bool checkImage(int id)
        {
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
                    StatusLabel.Text = "File uploaded successfully!";
                    return true;
                }
                else
                {
                    StatusLabel.Text = "Invalid file format. Please upload a valid image.";
                    return false;
                }
            }
            else
            {
                StatusLabel.Text = "Please select a file to upload.";
                return false;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {





            string fname = FName.Text;
            string lname = LName.Text;
            string password = Password.Text;
            string email = Email.Text;
            int age;
            int.TryParse(Age.Text, out age);
            string phone = PhoneNum.Text;
            string gender = Gender.Text;
            if (gender == "Female") gender = "f";
            else gender = "m";

            // the email is already registered
            var x = from c in db.patients where c.email == email select c;
            if (x.ToList().Count>0)
            {
                lbl.Text = "email already used";
            }
            else
            {


                patient p = new patient
                {
                    age = age,
                    email = email,
                    first_name = fname, last_name = lname,gender = gender,phone_number=phone

                };


                //insert
                db.patients.Add(p);
                db.SaveChanges();




                // get the id of the patient that was just added
                var y = from c in db.patients orderby c.id descending select c;
                var w = y.ToList();
                int z= w.ElementAt(0).id;


                // make sure the uploaded file is an image
                if (!checkImage(z))
                {
                    // load the row that was just added
                    var pa = db.patients.Find(z);
                    // and remove it
                    db.patients.Remove(pa);
                    db.SaveChanges();
                    return;
                }
                


                // add the new account
                account a = new account
                {
                email = email,
                password = PasswordHasher.Hash(password),
                role = "p", id = z
                };
                db.accounts.Add(a);
                db.SaveChanges();





                // send the user to the login page
                Response.Redirect("~/login.aspx");
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            FName.Text = "";
            LName.Text = "";
            Age.Text = "";
            Password.Text = "";
            Email.Text = "";
            PhoneNum.Text = "";
            Gender.SelectedIndex = -1;
        }
    }
}