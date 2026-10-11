using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

namespace HospitalManagementSystem
{
    public partial class Home : System.Web.UI.Page
    {
        jrkEntities db = new jrkEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                DoctorsCount.Text = db.doctors.Count().ToString();
                PatientsCount.Text = db.patients.Count().ToString();    


            }


        }

    
    }
}