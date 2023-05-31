using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Drawing.Printing;

namespace WebApplication1
{
    public partial class ManageCollections : System.Web.UI.Page
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

                string newCollectionName = TextBox1.Text;  //making NewCollectionName the name input
                string newCollectionAuthor = TextBox2.Text; //making NewCollectionName the Author input
                string newCollectionLocation = DropDownList1.Text; //making NewCollectionName the Location input
                SqlCommand com = new SqlCommand("museumSchema.CreateNewCollection");  //making 'com' the command Stored Procedure I made in SSMS
                museumConn.Open();
                com.Connection = museumConn;
                com.CommandType = System.Data.CommandType.StoredProcedure;
                SqlParameter param = new SqlParameter("@NewCollectionName", newCollectionName);  //making 'param' the Name parameters
                SqlParameter param2 = new SqlParameter("@NewCollectionAuthor", newCollectionAuthor); //making 'param2' the Name parameters
                SqlParameter param3 = new SqlParameter("@NewCollectionLocation", newCollectionLocation); //making 'param3' the Name parameters

                com.Parameters.Add(param); //connecting parameteres to Stored Procedure command in SSMS
                com.Parameters.Add(param2); //connecting parameteres to Stored Procedure command in SSMS
                com.Parameters.Add(param3); //connecting parameteres to Stored Procedure command in SSMS

                com.ExecuteNonQuery(); //executing the Stored Procedure 'INSERT' command
                //here if SQL command doesn't work it should bring you to an error page
                Label12.Visible = true; //making label visible
                Label12.Text = "New Collection Submission Successful"; //making label saying successful
                DropDownList2.DataBind();
                DropDownList4.DataBind();
                DropDownList5.DataBind();
                DropDownList7.DataBind();
                GridView2.DataBind();
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            SqlConnection museumConn = new SqlConnection("Server=tcp:museum.database.windows.net,1433;Initial Catalog=MuseumDB;Persist Security Info=False;User ID=JeremyL;Password=BabyThing1;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");
            {

                string deleteCollectionName = DropDownList2.Text;  //making deleteCollectionName the name input
                SqlCommand com = new SqlCommand("museumSchema.DeleteCollection");  //making 'com' the command Stored Procedure I made in SSMS
                museumConn.Open();
                com.Connection = museumConn;
                com.CommandType = System.Data.CommandType.StoredProcedure;
                SqlParameter param = new SqlParameter("@DeleteCollectionName", deleteCollectionName);  //making 'param' the Name parameter

                com.Parameters.Add(param); //connecting parameter to Stored Procedure command in SSMS

                com.ExecuteNonQuery(); //executing the Stored Procedure 'DELETE FROM' command
                //here if SQL command doesn't work it should bring you to an error page
                Label15.Visible = true; //making label visible
                Label15.Text = "Delete Collection Submission Successful"; //making label saying successful
                DropDownList2.DataBind();
                DropDownList4.DataBind();
                DropDownList5.DataBind();
                DropDownList7.DataBind();
                GridView2.DataBind();
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            SqlConnection museumConn = new SqlConnection("Server=tcp:museum.database.windows.net,1433;Initial Catalog=MuseumDB;Persist Security Info=False;User ID=JeremyL;Password=BabyThing1;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");
            {

                string searchCollectionName = DropDownList4.Text;  //making SearchCollectionName the Name input
                string searchCollectionAuthor = DropDownList5.Text; //making SearchCollectionName the Author input
                string searchCollectionLocation = DropDownList3.Text; //making SearchCollectionName the Location input
                SqlCommand com = new SqlCommand("museumSchema.SearchCollection");  //making 'com' the command Stored Procedure I made in SSMS
                museumConn.Open();
                com.Connection = museumConn;
                com.CommandType = System.Data.CommandType.StoredProcedure;

                if (searchCollectionName.Trim() != "All")
                {
                    SqlParameter param = new SqlParameter("@SearchCollectionName", searchCollectionName);  //making 'param' the Name parameters
                    com.Parameters.Add(param); //connecting parameteres to Stored Procedure command in SSMS

                }
                if (searchCollectionAuthor.Trim() != "All")
                {
                    SqlParameter param2 = new SqlParameter("@SearchCollectionAuthor", searchCollectionAuthor); //making 'param2' the Name parameters
                    com.Parameters.Add(param2); //connecting parameteres to Stored Procedure command in SSMS
                }
                if (searchCollectionLocation.Trim() != "All")
                {
                    SqlParameter param3 = new SqlParameter("@SearchCollectionLocation", searchCollectionLocation); //making 'param3' the Name parameters
                    com.Parameters.Add(param3); //connecting parameteres to Stored Procedure command in SSMS
                }

                SqlDataReader rdr = com.ExecuteReader(); //executing the Stored Procedure 'SELECT' command
                //here if SQL command doesn't work it should bring you to an error page
                Label16.Visible = true; //making label visible
                Label16.Text = "New Collection Submission Successful (If no table then no results)"; //making label saying successful
                GridView1.DataSource = rdr;
                GridView1.DataBind();
            }
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            SqlConnection museumConn = new SqlConnection("Server=tcp:museum.database.windows.net,1433;Initial Catalog=MuseumDB;Persist Security Info=False;User ID=JeremyL;Password=BabyThing1;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");
            {

                string oldCollectionName = DropDownList7.Text;  //making oldCollectionName the old Name input
                string newCollectionName = TextBox11.Text;  //making newCollectionName the new Name input
                string newCollectionAuthor = TextBox12.Text; //making newCollectionName the new Author input
                string newCollectionLocation = DropDownList6.Text; //making newCollectionName the new Location input
                SqlCommand com = new SqlCommand("museumSchema.ModifyCollection");  //making 'com' the command Stored Procedure I made in SSMS
                museumConn.Open();
                com.Connection = museumConn;
                com.CommandType = System.Data.CommandType.StoredProcedure;

                if (oldCollectionName.Trim() != "")
                {
                    SqlParameter param = new SqlParameter("@OldCollectionName", oldCollectionName);  //making 'param' the Name parameters
                    com.Parameters.Add(param); //connecting parameteres to Stored Procedure command in SSMS

                }
                if (newCollectionName.Trim() != "")
                {
                    SqlParameter param4 = new SqlParameter("@NewCollectionName", newCollectionName);  //making 'param4' the Name parameters
                    com.Parameters.Add(param4); //connecting parameteres to Stored Procedure command in SSMS

                }
                if (newCollectionAuthor.Trim() != "")
                {
                    SqlParameter param5 = new SqlParameter("@NewCollectionAuthor", newCollectionAuthor); //making 'param5' the Name parameters
                    com.Parameters.Add(param5); //connecting parameteres to Stored Procedure command in SSMS
                }
                if (newCollectionLocation.Trim() != "No Change")
                {
                    SqlParameter param6 = new SqlParameter("@NewCollectionLocation", newCollectionLocation); //making 'param6' the Name parameters
                    com.Parameters.Add(param6); //connecting parameteres to Stored Procedure command in SSMS
                }

                com.ExecuteNonQuery(); //executing the Stored Procedure 'UPDATE' command
                //here if SQL command doesn't work it should bring you to an error page
                Label23.Visible = true; //making label visible
                Label23.Text = "Modify Collection Submission Successful"; //making label saying successful
                DropDownList2.DataBind();
                DropDownList2.DataBind();
                DropDownList4.DataBind();
                DropDownList5.DataBind();
                DropDownList7.DataBind();
            }
        }
    }
}