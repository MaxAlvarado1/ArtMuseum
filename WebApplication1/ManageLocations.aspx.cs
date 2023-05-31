using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class ManageLocations : System.Web.UI.Page
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

        protected void SignOutButton_Click(object sender, EventArgs e)
        {
            Session.Remove("USER");
            Session.RemoveAll();
            Response.Redirect("Home.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection museumConn = new SqlConnection("Server=tcp:museum.database.windows.net,1433;Initial Catalog=MuseumDB;Persist Security Info=False;User ID=JeremyL;Password=BabyThing1;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");
            {
                //String represntation of inputs
                string newLocationName = TextBox1.Text;
                string newLocationNum = TextBox4.Text;
                string newManagerSSN = DropDownList3.Text;

                //'com' is the Command Stored Procedure
                SqlCommand com = new SqlCommand("museumSchema.AddNewLocation");
                museumConn.Open();
                com.Connection = museumConn;
                com.CommandType = System.Data.CommandType.StoredProcedure;

                //Creating Parameters for Adding to Database
                SqlParameter param1 = new SqlParameter("@NewLocationName", newLocationName);
                SqlParameter param4 = new SqlParameter("@NewLocationNum", newLocationNum);
                SqlParameter param7 = new SqlParameter("@NewManagerSSN", newManagerSSN);

                //Connecting Parameters to Stored Procedure
                com.Parameters.Add(param1);
                com.Parameters.Add(param4);
                com.Parameters.Add(param7);

                //executing the Stored Procedure 'INSERT' command
                //Add Exception Handling for when an error is made
                try
                {
                    com.ExecuteNonQuery();
                    Insertion_Success.Visible = true;
                    Insertion_Success.Text = "Submission Successful!";
                }
                catch (System.Data.SqlClient.SqlException)
                {
                    Insertion_Success.Visible = true;
                    Insertion_Success.Text = "Unable to insert. Duplicate Primary Key!";
                }
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            SqlConnection museumConn = new SqlConnection("Server=tcp:museum.database.windows.net,1433;Initial Catalog=MuseumDB;Persist Security Info=False;User ID=JeremyL;Password=BabyThing1;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");
            {
                string deleteLocationNum = DropDownList1.Text;
                SqlCommand com = new SqlCommand("museumSchema.DeleteLocation");
                museumConn.Open();
                com.Connection = museumConn;
                com.CommandType = System.Data.CommandType.StoredProcedure;
                SqlParameter param2 = new SqlParameter("@DeleteLocationNum", deleteLocationNum);

                com.Parameters.Add(param2);


                //executing the Stored Procedure 'Delete' command
                //Add Exception Handling for when an error is made           
                try
                {
                    com.ExecuteNonQuery();
                    Deletion_Success.Visible = true;
                    Deletion_Success.Text = "Deletion Successful!";
                }
                catch (System.Data.SqlClient.SqlException)
                {
                    Deletion_Success.Visible = true;
                    Deletion_Success.Text = "Unable to delete. Does not exist!";
                }

            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            SqlConnection museumConn = new SqlConnection("Server=tcp:museum.database.windows.net,1433;Initial Catalog=MuseumDB;Persist Security Info=False;User ID=JeremyL;Password=BabyThing1;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");
            {

                string oldLocationName = DropDownList2.Text;
                string newLocationName = TextBox12.Text;
                string newLocationNum = TextBox18.Text;
                string newManagerSSN = DropDownList4.Text;

                SqlCommand com = new SqlCommand("museumSchema.ModifyLocation");
                museumConn.Open();
                com.Connection = museumConn;
                com.CommandType = System.Data.CommandType.StoredProcedure;

                if (oldLocationName.Trim() != "")
                {
                    SqlParameter param1 = new SqlParameter("@OldLocationName", oldLocationName);
                    com.Parameters.Add(param1);

                }
                if (newLocationName.Trim() != "")
                {
                    SqlParameter param9 = new SqlParameter("@NewLocationName", newLocationName);
                    com.Parameters.Add(param9);

                }
                if (newLocationNum.Trim() != "")
                {
                    SqlParameter param12 = new SqlParameter("@NewLocationNum", newLocationNum);
                    com.Parameters.Add(param12);
                }
                if (newManagerSSN.Trim() != "")
                {
                    SqlParameter param15 = new SqlParameter("@NewManagerSSN", newManagerSSN);
                    com.Parameters.Add(param15);
                }

                //executing the Stored Procedure 'MODIFY' command
                //Add Exception Handling for when an error is made
                try
                {
                    com.ExecuteNonQuery();
                    Modify_Success.Visible = true;
                    Modify_Success.Text = "Submission Successful!";
                }
                catch (System.Data.SqlClient.SqlException)
                {
                    Modify_Success.Visible = true;
                    Modify_Success.Text = "Unable to modify. Does not exist!";
                }
            }
        }
    }
}