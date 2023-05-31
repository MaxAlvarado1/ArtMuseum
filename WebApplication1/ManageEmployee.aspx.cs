using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Drawing.Printing;
using System.Globalization;
using System.Security.Cryptography;
using System.Drawing.Drawing2D;
using System.Reflection.Emit;

namespace WebApplication1
{
    public partial class ManageEmployee : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["USER"] != null)
            {
                HelloName.Visible = true;
                HelloName.Text = "Hello, " + Session["USER"].ToString();
                SignOutButton.Visible = true;
            }
        }

        protected void NewEmployeeSubmit_Click(object sender, EventArgs e)
        {
            SqlConnection museumConn = new SqlConnection("Server=tcp:museum.database.windows.net,1433;Initial Catalog=MuseumDB;Persist Security Info=False;User ID=JeremyL;Password=BabyThing1;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");
            {
                // Naming variables from inputs
                string newEmployeeName = NewEmployeeName.Text;
                string newEmployeeSSN = NewEmployeeSSN.Text;
                string newEmployeeDOB = NewEmployeeDOB.Text;
                string newEmployeeGender = NewEmployeeGender.Text;
                string newEmployeeWage = NewEmployeeWage.Text;
                string newEmployeeJob = NewEmployeeJobTitle.Text;
                string newEmployeeStart = NewEmployeeStart.Text;

                // Opening connection to the database and stored procedure
                SqlCommand com = new SqlCommand("museumSchema.CreateNewEmployee");
                museumConn.Open();
                com.Connection = museumConn;
                com.CommandType = System.Data.CommandType.StoredProcedure;

                // Connecting variables to StoreProcedure's variables
                com.Parameters.AddWithValue("@newEmployeeName", newEmployeeName);
                com.Parameters.AddWithValue("@newEmployeeSSN", newEmployeeSSN);
                com.Parameters.AddWithValue("@newEmployeeDOB", newEmployeeDOB);
                com.Parameters.AddWithValue("@newEmployeeGender", newEmployeeGender);
                com.Parameters.AddWithValue("@newEmployeeWage", newEmployeeWage);
                com.Parameters.AddWithValue("@newEmployeeJob", newEmployeeJob);
                com.Parameters.AddWithValue("@newEmployeeStart", newEmployeeStart);

                // Executing Stored Procedure
                com.ExecuteNonQuery();

                // Getting ID number
                SqlConnection museumConn2 = new SqlConnection("Server=tcp:museum.database.windows.net,1433;Initial Catalog=MuseumDB;Persist Security Info=False;User ID=JeremyL;Password=BabyThing1;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");
                SqlCommand read = new SqlCommand("SELECT TOP 1 ID_num FROM museumSchema.Employees ORDER BY ID DESC", museumConn2);
                museumConn2.Open();
                read.Connection = museumConn2;
                SqlDataReader ID = read.ExecuteReader();
                string newEmployeeID = "";
                while (ID.Read())
                {
                    newEmployeeID += ID["ID_num"].ToString();
                }

                LabelNewEmployeeMessage.Visible = true; //making label visible
                LabelNewEmployeeMessage.Text = "New Employee Submission Successful. Their new ID is: "; //making label saying successful
                LabelNewEmployeeID.Visible = true; //making label visible
                LabelNewEmployeeID.Text = newEmployeeID.ToString();
                Label66.Visible = true;
                GridView2.DataBind();
            }
        }

        protected void DeleteEmployeeSubmit0_Click(object sender, EventArgs e)
        {
            SqlConnection museumConn = new SqlConnection("Server=tcp:museum.database.windows.net,1433;Initial Catalog=MuseumDB;Persist Security Info=False;User ID=JeremyL;Password=BabyThing1;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");
            {
                // Naming variable from input
                string DeleteEmployeeID = InputTerminateEmployeeID.Text;

                // Opening connection to the database and stored procedure
                SqlCommand com = new SqlCommand("museumSchema.DeleteEmployee");  //making 'com' the command Stored Procedure I made in SSMS
                museumConn.Open();
                com.Connection = museumConn;
                com.CommandType = System.Data.CommandType.StoredProcedure;

                // Connecting variables to StoreProcedure's variables
                com.Parameters.AddWithValue("@deleteEmployeeID", DeleteEmployeeID);

                // Executing Stored Procedure
                com.ExecuteNonQuery();

                // Making label visible
                LabelDeleteEmployeeMessage.Visible = true; //making label visible
                LabelDeleteEmployeeMessage.Text = "Termination successful";
                GridView2.DataBind();
            }
        }

        protected void SearchEmployeeSubmit1_Click(object sender, EventArgs e)
        {
            SqlConnection museumConn = new SqlConnection("Server=tcp:museum.database.windows.net,1433;Initial Catalog=MuseumDB;Persist Security Info=False;User ID=JeremyL;Password=BabyThing1;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");
            {
                // Naming variables from inputs
                string searchEmployeeName = SearchEmployeeName.Text;
                string searchEmployeeID = SearchEmployeeID.Text;
                string searchEmployeeSSN = SearchEmployeeSSN.Text;
                string searchEmployeeSupSSN = SearchEmployeeSupSSN.Text;
                string searchEmployeeDOB = SearchEmployeeDOB.Text;
                string searchEmployeeGender = SearchEmployeeGender.Text;
                string searchEmployeeWage = SearchEmployeeWage.Text;
                string searchEmployeeJob = SearchEmployeeJob.Text;
                string searchEmployeeLocation = SearchLocationNum.Text;
                string searchEmployeeStart1 = SearchEmployeeStart1.Text;
                string searchEmployeeStart2 = SearchEmployeeStart2.Text;
                string searchEmployeeEnd1 = SearchEmploymentEnd1.Text;
                string searchEmployeeEnd2 = SearchEmployeeEnd2.Text;

                // Opening connection to the database and stored procedure
                SqlCommand com = new SqlCommand("museumSchema.SearchEmployee");
                museumConn.Open();
                com.Connection = museumConn;
                com.CommandType = System.Data.CommandType.StoredProcedure;

                // Connecting variables to StoreProcedure's variables
                if (searchEmployeeName.Trim() != "")
                    com.Parameters.AddWithValue("@searchEmployeeName", searchEmployeeName);
                if (searchEmployeeID.Trim() != "")
                    com.Parameters.AddWithValue("@searchEmployeeID", searchEmployeeID);
                if (searchEmployeeSSN.Trim() != "")
                    com.Parameters.AddWithValue("@searchEmployeeSSN", searchEmployeeSSN);
                if (searchEmployeeSupSSN.Trim() != "")
                    com.Parameters.AddWithValue("@searchEmployeeSupSSN", searchEmployeeSupSSN);
                if (searchEmployeeDOB.Trim() != "")
                    com.Parameters.AddWithValue("@searchEmployeeDOB", searchEmployeeDOB);
                if (searchEmployeeGender.Trim() != "Empty")
                    com.Parameters.AddWithValue("@searchEmployeeGender", searchEmployeeGender);
                if (searchEmployeeWage.Trim() != "")
                    com.Parameters.AddWithValue("@searchEmployeeWage", searchEmployeeWage);
                if (searchEmployeeJob.Trim() != "ALL")
                    com.Parameters.AddWithValue("@searchEmployeeJob", searchEmployeeJob);
                if (searchEmployeeLocation.Trim() != "")
                    com.Parameters.AddWithValue("@searchEmployeeLocation", searchEmployeeLocation);
                if (searchEmployeeStart1.Trim() != "")
                    com.Parameters.AddWithValue("@searchEmployeeStart1", searchEmployeeStart1);
                if (searchEmployeeStart2.Trim() != "")
                    com.Parameters.AddWithValue("@searchEmployeeStart2", searchEmployeeStart2);
                if (searchEmployeeEnd1.Trim() != "")
                    com.Parameters.AddWithValue("@searchEmployeeEnd1", searchEmployeeEnd1);
                if (searchEmployeeEnd2.Trim() != "")
                    com.Parameters.AddWithValue("@searchEmployeeEnd2", searchEmployeeEnd2);

                // Executing Stored Procedure
                SqlDataReader rdr = com.ExecuteReader();

                // Making label visible
                Label32.Visible = true; //making label visible
                Label32.Text = "Search successful.";

                // Putting results to gridview
                GridView1.DataSource = rdr;
                GridView1.DataBind();
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            SqlConnection museumConn = new SqlConnection("Server=tcp:museum.database.windows.net,1433;Initial Catalog=MuseumDB;Persist Security Info=False;User ID=JeremyL;Password=BabyThing1;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");
            {
                // Naming variables from inputs
                string oldEmployeeID = OldID.Text;
                string newEmployeeName = NewName.Text;
                string newEmployeeID = NewID.Text;
                string newEmployeeSSN = NewSSN.Text;
                string newEmployeeSupSSN = NewSupSSN.Text;
                string newEmployeeDOB = NewDOB.Text;
                string newEmployeeGender = NewGender.Text;
                string newEmployeeWage = NewWage.Text;
                string newEmployeeJob = NewEmployeeJobTitle0.Text;
                string newEmployeeLocation = NewLoc.Text;
                string newEmployeeStart = NewStart.Text;
                string newEmployeeEnd = NewEnd.Text;

                // Opening connection to the database and stored procedure
                SqlCommand com = new SqlCommand("museumSchema.ModifyEmployees");
                museumConn.Open();
                com.Connection = museumConn;
                com.CommandType = System.Data.CommandType.StoredProcedure;

                // Connecting variables to StoreProcedure's variables
                if (oldEmployeeID.Trim() != "")
                    com.Parameters.AddWithValue("@oldEmployeeID", oldEmployeeID);
                if (newEmployeeName.Trim() != "")
                    com.Parameters.AddWithValue("@newEmployeeName", newEmployeeName);
                if (newEmployeeID.Trim() != "")
                    com.Parameters.AddWithValue("@newEmployeeID", newEmployeeID);
                if (newEmployeeSSN.Trim() != "")
                    com.Parameters.AddWithValue("@newEmployeeSSN", newEmployeeSSN);
                if (newEmployeeSupSSN.Trim() != "")
                    com.Parameters.AddWithValue("@newEmployeeSupSSN", newEmployeeSupSSN);
                if (newEmployeeDOB.Trim() != "")
                    com.Parameters.AddWithValue("@newEmployeeDOB", newEmployeeDOB);
                if (newEmployeeGender.Trim() != "")
                    com.Parameters.AddWithValue("@newEmployeeGender", newEmployeeGender);
                if (newEmployeeWage.Trim() != "")
                    com.Parameters.AddWithValue("@newEmployeeWage", newEmployeeWage);
                if (newEmployeeJob.Trim() != "")
                    com.Parameters.AddWithValue("@newEmployeeJob", newEmployeeJob);
                if (newEmployeeLocation.Trim() != "")
                    com.Parameters.AddWithValue("@newEmployeeLocation", newEmployeeLocation);
                if (newEmployeeStart.Trim() != "")
                    com.Parameters.AddWithValue("@newEmployeeStart", newEmployeeStart);
                if (newEmployeeEnd.Trim() != "")
                    com.Parameters.AddWithValue("@newEmployeeEnd", newEmployeeEnd);

                // Executing Stored Procedure
                com.ExecuteNonQuery();

                // Making label visible
                Label47.Visible = true; //making label visible
                Label47.Text = "Update successful";
                GridView2.DataBind();
            }
        }

        protected void SignOutButton_Click(object sender, EventArgs e)
        {
            Session.Remove("USER");
            Session.RemoveAll();
            Response.Redirect("Home.aspx");
        }
    }
}