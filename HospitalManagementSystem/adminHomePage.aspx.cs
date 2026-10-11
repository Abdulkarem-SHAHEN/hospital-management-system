using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.html.simpleparser;
using System.IO;
using System.Data.Entity.Core.Common.CommandTrees.ExpressionBuilder;
using System.Xml.Linq;
using System.Runtime.Remoting;

namespace HospitalManagementSystem
{
    public partial class adminHomePage : System.Web.UI.Page
    {


        jrkEntities db = new jrkEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            // only a signed-in user with this role may open the page
            Auth.RequireRole("t");

            // the cookie that remembers which record the administrator selected
            if (Request.Cookies["edit"] == null)
            {
                HttpCookie co = new HttpCookie("edit");
                co.Values.Add("role", "");
                co.Values.Add("id", "");
                co.Values.Add("email", "");
                Response.Cookies.Add(co);
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            searchBtn.Visible = true;
            search.Visible = true;
            Label3.Visible = true;
            DropDownList1.Visible = true;

            string[] dynamicItems = { "name", "spec", "full-time" };

            // Clear existing items (if any)
            DropDownList1.Items.Clear();

            // Add dynamic items to the DropDownList
            foreach (string item in dynamicItems)
            {
                DropDownList1.Items.Add(new System.Web.UI.WebControls.ListItem(item));
            }


            Button7.Text = "add new doctor";
            Button7.Visible = true;
            Button8.Visible = true;

            HttpCookie myco = Request.Cookies["edit"];

            var x = db.doctors;
            GridView1.DataSource = x.ToList();
            GridView1.DataBind();
            myco["role"] = "d";
            Response.Cookies.Add(myco);
            GridView2.DataSource = x.ToList();
            GridView2.DataBind();
        }

        protected void Button1_Click(object sender, EventArgs e)


        {
            string[] dynamicItems = { "first name", "last name", "gender","age","email","phone number" };

            // Clear existing items (if any)
            DropDownList1.Items.Clear();

            // Add dynamic items to the DropDownList
            foreach (string item in dynamicItems)
            {
                DropDownList1.Items.Add(new System.Web.UI.WebControls.ListItem(item));
            }


            searchBtn.Visible = true;
            search.Visible = true;
            Label3.Visible = true;
            DropDownList1.Visible = true;

            Button7.Visible = false;
            Button8.Visible = true;
            HttpCookie myco = Request.Cookies["edit"];

            var x = db.patients;
            GridView2.DataSource = x.ToList();
            GridView2.DataBind();
            GridView1.DataSource = x.ToList();
            GridView1.DataBind();
            myco["role"] = "p"; Response.Cookies.Add(myco);
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            searchBtn.Visible = false;
            search.Visible = false;
            Label3.Visible = false;
            DropDownList1.Visible = false;

            Button8.Visible = true;

            Button7.Text = "add new HR";
            Button7.Visible = true;

            HttpCookie myco = Request.Cookies["edit"];

            if (myco != null)
            {
                var x = db.topmgmts;
                GridView1.DataSource = x.ToList();
                GridView1.DataBind();
                GridView2.DataSource = x.ToList();
                GridView2.DataBind();
                myco["role"] = "t"; Response.Cookies.Add(myco);
            }

        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            searchBtn.Visible = false;
            search.Visible = false;
            Label3.Visible = false;
            DropDownList1.Visible = false;

            Button7.Text = "add new asset";
            Button7.Visible = true;
            Button8.Visible = true;


            HttpCookie myco = Request.Cookies["edit"];

            var x = db.assets;
            GridView1.DataSource = x.ToList();
            GridView1.DataBind();
            GridView2.DataSource = x.ToList();
            GridView2.DataBind();
            myco["role"] = "as"; Response.Cookies.Add(myco);

        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            searchBtn.Visible = false;
            search.Visible = false;
            Label3.Visible = false;
            DropDownList1.Visible = false;

            HttpCookie myco = Request.Cookies["edit"];
            Button8.Visible = true;
            // the password hashes are left out of the table and of the PDF export
            var x = db.accounts.Select(c => new { c.email, c.id, c.role });
            GridView1.DataSource = x.ToList();
            GridView1.DataBind();
            GridView2.DataSource = x.ToList();
            GridView2.DataBind();
            myco["role"] = "ac"; Response.Cookies.Add(myco);

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            HttpCookie co = Request.Cookies["edit"];
            if (co != null)
            {
                Label1.Text = co["role"];
                Label1.Text += co["id"];
                Label1.Text += "selected= " + DropDownList1.SelectedIndex;
            }
        }

        protected void MultiView1_ActiveViewChanged(object sender, EventArgs e)
        {

        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string id = GridView1.Rows[e.RowIndex].Cells[2].Text;

            HttpCookie myco = Request.Cookies["edit"];
            myco["id"] = id;
            Response.Cookies.Add(myco);
            switch (myco["role"])
            {
                case "p": Response.Redirect("adminDeletePatient.aspx"); break;
                case "d": Response.Redirect("adminDeleteDoctor.aspx"); break;
                case "as": Response.Redirect("adminDeleteAsset.aspx"); break;
                case "t": Response.Redirect("adminDeleteTop.aspx"); break;

            }
        }

        protected void Button7_Click(object sender, EventArgs e)
        {
            HttpCookie myco = Request.Cookies["edit"];
            switch (myco["role"]) {
                case "d": Response.Redirect("adminAddDoctor.aspx"); break;
                case "as": Response.Redirect("adminAddAsset.aspx"); break;
                case "t": Response.Redirect("adminAddTop.aspx");    break;
            }
        }

        protected void Button8_Click(object sender, EventArgs e)
        {
            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;filename=demotext.pdf");
            Response.Cache.SetCacheability(HttpCacheability.NoCache);

            StringWriter sw = new StringWriter();
            HtmlTextWriter hw = new HtmlTextWriter(sw);
            GridView2.RenderControl(hw);

            StringReader sr = new StringReader(sw.ToString());
            Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 10f, 0f);

            // Use PdfWriter.GetInstance to create a PdfWriter instance
            PdfWriter writer = PdfWriter.GetInstance(pdfDoc, Response.OutputStream);

            // Open the document
            pdfDoc.Open();

            // Use HTMLWorker to parse HTML content and add it to the document
            HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
            htmlparser.Parse(sr);

            // Close the document
            pdfDoc.Close();

            // Write the PDF content to the response stream
            Response.Write(pdfDoc);

            // End the response to ensure that no further content is sent
            Response.End();

            // Reset GridView properties
            GridView2.AllowPaging = true;
            GridView2.DataBind();


        }
        public override void VerifyRenderingInServerForm(Control control)
        {
        }

        protected void searchBtn_Click(object sender, EventArgs e)
        {
            HttpCookie myco = Request.Cookies["edit"];
            if (myco["role"].Equals("d"))
            {
                string criteria = DropDownList1.SelectedValue;
                if (criteria.Equals("name"))
                {
                    var x = from c in db.doctors where c.name.StartsWith(search.Text)   select c;
                    GridView1.DataSource = x.ToList();
                    GridView1.DataBind();
                }

                else if (criteria.Equals("spec"))
                {
                    var x = from c in db.doctors where c.spec.StartsWith(search.Text) select c;
                    GridView1.DataSource = x.ToList();
                    GridView1.DataBind();
                }
                else
                {
                    if (search.Text == "y")
                    {var x= from c in db.doctors where c.full_time==true select c;
                        GridView1.DataSource = x.ToList();
                        GridView1.DataBind();

                    }
                    else
                    {
                        
                            var x = from c in db.doctors where c.full_time == false select c;
                            GridView1.DataSource = x.ToList();
                            GridView1.DataBind();

                        

                    }
                }



            }
            //case of account search
            else
            {
                string criteria = DropDownList1.SelectedValue;
                
                if (!criteria.Equals("age"))
                {
                    if (DropDownList1.SelectedIndex==0)
                    {
                        var x = from c in db.patients where c.first_name.StartsWith(search.Text) select c;
                        GridView1.DataSource = x.ToList();
                        GridView1.DataBind();
                    }
                    else if (DropDownList1.SelectedIndex==1)
                    {
                        var x = from c in db.patients where c.last_name.StartsWith(search.Text) select c;
                        GridView1.DataSource = x.ToList();
                        GridView1.DataBind();
                    }
                    else if (DropDownList1.SelectedIndex==2)
                    {
                        var x = from c in db.patients where c.gender.StartsWith(search.Text) select c;
                        GridView1.DataSource = x.ToList();
                        GridView1.DataBind();
                    }
                    else if (DropDownList1.SelectedIndex==4)
                    {
                        var x = from c in db.patients where c.email.StartsWith(search.Text) select c;
                        GridView1.DataSource = x.ToList();
                        GridView1.DataBind();
                    }
                    else
                    {
                        var x = from c in db.patients where c.phone_number.StartsWith(search.Text) select c;
                        GridView1.DataSource = x.ToList();
                        GridView1.DataBind();
                    }

                    
                }


                else
                {
                 
                        search.Visible = false;
                        FromText.Visible = true;
                        ToText.Visible = true;
                        Label5.Visible = true;
                        Label4.Visible = true;

                    int y = Int32.Parse(FromText.Text);
                    int to = Int32.Parse(ToText.Text);
                    var x = from c in db.patients where c.age >= y && c.age<= to select c;
                    GridView1.DataSource = x.ToList();
                    GridView1.DataBind();
                }




            }



        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedIndex == 3)
            {
                search.Visible = false;
                FromText.Visible = true;
                ToText.Visible = true;
                Label5.Visible = true;
                Label4.Visible = true;
                Label1.Text = "5454545";


            }
            else
            {
                FromText.Visible = false;
                ToText.Visible = false;
                Label5.Visible = false;
                Label4.Visible = false;
                search.Visible = true;
                Label1.Text = "5454545";



            }
        }
    }
}