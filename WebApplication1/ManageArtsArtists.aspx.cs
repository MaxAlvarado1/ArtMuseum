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

namespace WebApplication1
{
    public partial class ManageArtsArtists : System.Web.UI.Page
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
                // Naming variables from inputs
                string newName = TextBox1.Text;
                string newDOC = TextBox3.Text;
                string newArtist = DropDownList1.Text;
                string newExhib = DropDownList2.Text;
                string newColl = DropDownList3.Text;

                // Opening connection to the database and stored procedure
                SqlCommand com = new SqlCommand("museumSchema.CreateNewArt");
                museumConn.Open();
                com.Connection = museumConn;
                com.CommandType = System.Data.CommandType.StoredProcedure;

                // Connecting variables to StoreProcedure's variables
                com.Parameters.AddWithValue("@newName", newName);
                com.Parameters.AddWithValue("@newDOC", newDOC);
                com.Parameters.AddWithValue("@newArtist", newArtist);
                if (newExhib != "None") 
                    com.Parameters.AddWithValue("@newExhib", newExhib);
                if (newColl != "None")
                    com.Parameters.AddWithValue("@newExhib", newColl);

                // Executing Stored Procedure
                com.ExecuteNonQuery();

                // Getting ID number
                SqlConnection museumConn2 = new SqlConnection("Server=tcp:museum.database.windows.net,1433;Initial Catalog=MuseumDB;Persist Security Info=False;User ID=JeremyL;Password=BabyThing1;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");
                SqlCommand read = new SqlCommand("SELECT ID_no FROM museumSchema.Art WHERE artName = '" + newName + "' AND artistName = '" + newArtist + "'", museumConn2);
                museumConn2.Open();
                read.Connection = museumConn2;
                SqlDataReader ID = read.ExecuteReader();
                string NewID = "";
                while (ID.Read())
                {
                    NewID += ID["ID_no"].ToString();
                }

                Label11.Visible = true; //making label visible
                Label11.Text = "New Art Submission Successful. It's new ID is: "; //making label saying successful
                Label12.Visible = true; //making label visible
                Label12.Text = NewID.ToString();
                GridView3.DataBind();
                GridView4.DataBind();
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            SqlConnection museumConn = new SqlConnection("Server=tcp:museum.database.windows.net,1433;Initial Catalog=MuseumDB;Persist Security Info=False;User ID=JeremyL;Password=BabyThing1;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");
            {
                // Naming variable from input
                string removeID = TextBox8.Text;

                // Opening connection to the database and stored procedure
                SqlCommand com = new SqlCommand("museumSchema.RemoveArt");
                museumConn.Open();
                com.Connection = museumConn;
                com.CommandType = System.Data.CommandType.StoredProcedure;

                // Connecting variables to StoreProcedure's variables
                com.Parameters.AddWithValue("@ID", removeID);

                // Executing Stored Procedure
                com.ExecuteNonQuery();

                // Making label visible
                Label21.Visible = true; //making label visible
                Label21.Text = "Removal successful";
                GridView3.DataBind();
                GridView4.DataBind();
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            SqlConnection museumConn = new SqlConnection("Server=tcp:museum.database.windows.net,1433;Initial Catalog=MuseumDB;Persist Security Info=False;User ID=JeremyL;Password=BabyThing1;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");
            {
                // Naming variables from inputs
                string searchName = DropDownList7.Text;
                string searchID = TextBox16.Text;
                string searchDOC1 = TextBox10.Text;
                string searchDOC2 = TextBox15.Text;
                string searchArtist = DropDownList4.Text;
                string searchExhibition = DropDownList5.Text;
                string searchCollection = DropDownList6.Text;

                // Opening connection to the database and stored procedure
                SqlCommand com = new SqlCommand("museumSchema.SearchArt");
                museumConn.Open();
                com.Connection = museumConn;
                com.CommandType = System.Data.CommandType.StoredProcedure;

                // Connecting variables to StoreProcedure's variables
                if (searchName.Trim() != "All")
                    com.Parameters.AddWithValue("@name", searchName);
                if (searchID.Trim() != "")
                    com.Parameters.AddWithValue("@ID", searchID);
                if (searchDOC1.Trim() != "")
                    com.Parameters.AddWithValue("@DOC1", searchDOC1);
                if (searchDOC2.Trim() != "")
                    com.Parameters.AddWithValue("@DOC2", searchDOC2);
                if (searchArtist.Trim() != "All")
                    com.Parameters.AddWithValue("@artist", searchArtist);
                if (searchExhibition.Trim() != "All")
                    com.Parameters.AddWithValue("@exhibition", searchExhibition);
                if (searchCollection.Trim() != "All")
                    com.Parameters.AddWithValue("@collection", searchCollection);

                // Executing Stored Procedure
                SqlDataReader rdr = com.ExecuteReader();

                // Making label visible
                Label30.Visible = true; //making label visible
                Label30.Text = "Search successful.";

                // Putting results to gridview
                GridView1.DataSource = rdr;
                GridView1.DataBind();
            }
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            SqlConnection museumConn = new SqlConnection("Server=tcp:museum.database.windows.net,1433;Initial Catalog=MuseumDB;Persist Security Info=False;User ID=JeremyL;Password=BabyThing1;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");
            {
                // Naming variables from inputs
                string oldID = TextBox17.Text;
                string newName = TextBox23.Text;
                string newID = TextBox41.Text;
                string newDOC = TextBox24.Text;
                string newArtist = DropDownList8.Text;
                string newExhibition = DropDownList9.Text;
                string newCollection = DropDownList10.Text;

                // Opening connection to the database and stored procedure
                SqlCommand com = new SqlCommand("museumSchema.UpdateArt");
                museumConn.Open();
                com.Connection = museumConn;
                com.CommandType = System.Data.CommandType.StoredProcedure;

                // Connecting variables to StoreProcedure's variables
                if (oldID.Trim() != "")
                    com.Parameters.AddWithValue("@oldID", oldID);
                if (newName.Trim() != "")
                    com.Parameters.AddWithValue("@newName", newName);
                if (newID.Trim() != "")
                    com.Parameters.AddWithValue("@newID", newID);
                if (newDOC.Trim() != "")
                    com.Parameters.AddWithValue("@newDOC", newDOC);
                if (newArtist.Trim() != "No Change")
                    com.Parameters.AddWithValue("@newArtist", newArtist);
                if (newExhibition.Trim() != "No Change")
                    com.Parameters.AddWithValue("@newExhibition", newExhibition);
                if (newCollection.Trim() != "No Change")
                    com.Parameters.AddWithValue("@newCollection", newCollection);

                // Executing Stored Procedure
                com.ExecuteNonQuery();

                // Making label visible
                Label40.Visible = true; //making label visible
                Label40.Text = "Update successful";
                GridView3.DataBind();
                GridView4.DataBind();
            }
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            SqlConnection museumConn = new SqlConnection("Server=tcp:museum.database.windows.net,1433;Initial Catalog=MuseumDB;Persist Security Info=False;User ID=JeremyL;Password=BabyThing1;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");
            {

                string newArtistName = TextBox2.Text;  
                string newArtistDOB = TextBox18.Text; 
                string newArtistDOD = TextBox19.Text; 

                SqlCommand com = new SqlCommand("museumSchema.InsertArtist"); 
                museumConn.Open();
                com.Connection = museumConn;
                com.CommandType = System.Data.CommandType.StoredProcedure;
                SqlParameter param = new SqlParameter("@ArtistName", newArtistName);  
                SqlParameter param2 = new SqlParameter("@ArtistDOB", newArtistDOB);
                SqlParameter param3 = new SqlParameter("@ArtistDOD", newArtistDOD); 

                com.Parameters.Add(param); 
                if (newArtistDOD.Trim() != "")
                    com.Parameters.Add(param2); 
                if (newArtistDOD.Trim() != "")
                    com.Parameters.Add(param3); 

                com.ExecuteNonQuery(); 

                SqlConnection museumConn2 = new SqlConnection("Server=tcp:museum.database.windows.net,1433;Initial Catalog=MuseumDB;Persist Security Info=False;User ID=JeremyL;Password=BabyThing1;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");
                SqlCommand read = new SqlCommand("SELECT TOP 1 ID FROM museumSchema.Artist ORDER BY indexnum DESC", museumConn2);
                museumConn2.Open();
                read.Connection = museumConn2;
                SqlDataReader index = read.ExecuteReader();
                string newID = "";
                while (index.Read())
                {
                    newID += index["ID"].ToString();
                }

                Label20.Visible = true; 
                Label20.Text = "New Artist Submission Successful. Their new ID is: ";
                Label61.Visible = true; 
                Label61.Text = newID.ToString();
                GridView3.DataBind();
                GridView4.DataBind();
            }
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            SqlConnection museumConn = new SqlConnection("Server=tcp:museum.database.windows.net,1433;Initial Catalog=MuseumDB;Persist Security Info=False;User ID=JeremyL;Password=BabyThing1;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");
            {

                string deleteArtist = TextBox21.Text;  
                SqlCommand com = new SqlCommand("museumSchema.DeleteArtist"); 
                museumConn.Open();
                com.Connection = museumConn;
                com.CommandType = System.Data.CommandType.StoredProcedure;
                SqlParameter param = new SqlParameter("@DeleteArtistID", deleteArtist);  

                com.Parameters.Add(param); 

                com.ExecuteNonQuery(); 
                Label37.Visible = true; 
                Label37.Text = "Delete Artist Submission Successful";
                GridView3.DataBind();
                GridView4.DataBind();
            }
        }

        protected void Button7_Click(object sender, EventArgs e)
        {
            SqlConnection museumConn = new SqlConnection("Server=tcp:museum.database.windows.net,1433;Initial Catalog=MuseumDB;Persist Security Info=False;User ID=JeremyL;Password=BabyThing1;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");
            {

                string name = TextBox22.Text;
                string dob1 = TextBox35.Text;
                string dob2 = TextBox38.Text;
                string dod1 = TextBox36.Text;
                string dod2 = TextBox39.Text;
                string id = TextBox37.Text;

                SqlCommand com = new SqlCommand("museumSchema.SearchArtist");  
                museumConn.Open();
                com.Connection = museumConn;
                com.CommandType = System.Data.CommandType.StoredProcedure;

                if (name.Trim() != "")
                {
                    com.Parameters.AddWithValue("name", name); 
                }
                if (dob1.Trim() != "")
                {
                    com.Parameters.AddWithValue("dob1", dob1);
                }
                if (dob2.Trim() != "")
                {
                    com.Parameters.AddWithValue("dob2", dob2);
                }
                if (dod1.Trim() != "")
                {
                    com.Parameters.AddWithValue("dod1", dod1);
                }
                if (dod2.Trim() != "")
                {
                    com.Parameters.AddWithValue("dod2", dod2);
                }
                if (id.Trim() != "")
                {
                    com.Parameters.AddWithValue("id", id);
                }

                SqlDataReader rdr = com.ExecuteReader(); 

                Label41.Visible = true; 
                Label41.Text = "Search Successful (If no table then no results)"; 
                GridView2.DataSource = rdr;
                GridView2.DataBind();
                GridView3.DataBind();
                GridView4.DataBind();
            }
        }

        protected void Button8_Click(object sender, EventArgs e)
        {
            SqlConnection museumConn = new SqlConnection("Server=tcp:museum.database.windows.net,1433;Initial Catalog=MuseumDB;Persist Security Info=False;User ID=JeremyL;Password=BabyThing1;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");
            {

                string oldID = TextBox29.Text;  //making oldArtistName the old Name input
                string newname = TextBox30.Text;  //making newArtistName the new Name input
                string newdob = TextBox32.Text; //making newArtistDOB the new DOB input
                string newdod = TextBox34.Text; //making newArtistDOD the new DOD input
                string newID = TextBox40.Text;
                SqlCommand com = new SqlCommand("museumSchema.ModifyArtist");  //making 'com' the command Stored Procedure I made in SSMS
                museumConn.Open();
                com.Connection = museumConn;
                com.CommandType = System.Data.CommandType.StoredProcedure;

                SqlParameter param = new SqlParameter("@oldID", oldID);  //making 'param' the Name parameters
                com.Parameters.Add(param);

                if (newname.Trim() != "")
                {
                    SqlParameter param4 = new SqlParameter("@newname", newname);  //making 'param4' the Name parameters
                    com.Parameters.Add(param4); //connecting parameteres to Stored Procedure command in SSMS

                }
                if (newdob.Trim() != "")
                {
                    SqlParameter param5 = new SqlParameter("@newdob", newdob); //making 'param5' the Name parameters
                    com.Parameters.Add(param5); //connecting parameteres to Stored Procedure command in SSMS
                }
                if (newdod.Trim() != "")
                {
                    SqlParameter param6 = new SqlParameter("@newdod", newdod); //making 'param6' the Name parameters
                    com.Parameters.Add(param6); //connecting parameteres to Stored Procedure command in SSMS
                }
                if (newID.Trim() != "")
                {
                    SqlParameter param6 = new SqlParameter("@newID", newID); //making 'param6' the Name parameters
                    com.Parameters.Add(param6); //connecting parameteres to Stored Procedure command in SSMS
                }

                com.ExecuteNonQuery();


                Label55.Visible = true;
                Label55.Text = "Delete Artist Submission Successful"; //executing the Stored Procedure 'UPDATE' command
                GridView3.DataBind();
                GridView4.DataBind();
            }
        }
    }
}