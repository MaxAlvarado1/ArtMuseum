using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class ManageMembers : System.Web.UI.Page
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
                string Fname = InputMemberFname.Text;
                string Lname = InputMemberLname.Text;
                int Price = 0;

                if (InputMemberType.SelectedIndex == 0)
                {
                    Price = 40;
                }
                else if (InputMemberType.SelectedIndex == 1)
                {
                    Price = 70;
                }

                SqlCommand addMember = new SqlCommand("museumSchema.AddNewMember");
                museumConn.Open();
                addMember.Connection = museumConn;
                addMember.CommandType = System.Data.CommandType.StoredProcedure;

                addMember.Parameters.AddWithValue("@NewMemberName", Fname.Trim() + " " + Lname.Trim());
                addMember.Parameters.AddWithValue("@MemberPrice", Price);


                addMember.ExecuteNonQuery();

                SqlConnection museumConn2 = new SqlConnection("Server=tcp:museum.database.windows.net,1433;Initial Catalog=MuseumDB;Persist Security Info=False;User ID=JeremyL;Password=BabyThing1;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");
                SqlCommand read = new SqlCommand("SELECT membership_ID FROM museumSchema.Members WHERE memberName = '" + (Fname + " " + Lname) + "'");
                museumConn2.Open();
                read.Connection = museumConn2;
                SqlDataReader ID = read.ExecuteReader();
                string newMemberID = "";
                while (ID.Read())
                {
                    newMemberID += ID["membership_ID"].ToString();
                }

                LabelNewMemberMessage.Visible = true;
                LabelNewMemberMessage.Text = "Subscription Successful. Your ID is: ";
                LabelNewMemberID.Visible = true; //making label visible
                LabelNewMemberID.Text = newMemberID.ToString();
                GridView2.DataBind();
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            SqlConnection museumConn = new SqlConnection("Server=tcp:museum.database.windows.net,1433;Initial Catalog=MuseumDB;Persist Security Info=False;User ID=JeremyL;Password=BabyThing1;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");
            {
                // Naming variable from input
                string removeID = DropDownList1.Text;

                // Opening connection to the database and stored procedure
                SqlCommand com = new SqlCommand("museumSchema.DeleteMember");
                museumConn.Open();
                com.Connection = museumConn;
                com.CommandType = System.Data.CommandType.StoredProcedure;

                // Connecting variables to StoreProcedure's variables
                com.Parameters.AddWithValue("@ID", removeID);

                // Executing Stored Procedure
                com.ExecuteNonQuery();

                // Making label visible
                LabelRemoveMemberMessage.Visible = true; //making label visible
                LabelRemoveMemberMessage.Text = "Removal successful";
                GridView2.DataBind();
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            SqlConnection museumConn = new SqlConnection("Server=tcp:museum.database.windows.net,1433;Initial Catalog=MuseumDB;Persist Security Info=False;User ID=JeremyL;Password=BabyThing1;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");
            {
                // Naming variables from inputs
                string name = DropDownList2.Text;
                string id = DropDownList3.Text;
                string price = SearchMemberType.Text;
                string start1 = SearchMemberStart1.Text;
                string start2 = SearchMemberStart2.Text;
                string end1 = SearchMemberEnd1.Text;
                string end2 = SearchMemberEnd2.Text;

                // Opening connection to the database and stored procedure
                SqlCommand com = new SqlCommand("museumSchema.SearchMember");
                museumConn.Open();
                com.Connection = museumConn;
                com.CommandType = System.Data.CommandType.StoredProcedure;

                // Connecting variables to StoreProcedure's variables
                if (name.Trim() != "All")
                    com.Parameters.AddWithValue("@name", name);
                if (id.Trim() != "All")
                    com.Parameters.AddWithValue("@id", id);
                if (price.Trim() != "All")
                    com.Parameters.AddWithValue("@price", price);
                if (start1.Trim() != "")
                    com.Parameters.AddWithValue("@start1", start1);
                if (start2.Trim() != "")
                    com.Parameters.AddWithValue("@start2", start2);
                if (end1.Trim() != "")
                    com.Parameters.AddWithValue("@end1", end1);
                if (end1.Trim() != "")
                    com.Parameters.AddWithValue("@end2", end2);

                // Executing Stored Procedure
                SqlDataReader rdr = com.ExecuteReader();

                // Making label visible
                LabelMemberSearchMessage.Visible = true; //making label visible
                LabelMemberSearchMessage.Text = "Search successful.";

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
                string oldID = DropDownList4.Text;
                string newFName = InputUpdateFname.Text;
                string newLName = InputUpdateLname.Text;
                string newID = InputUpdateMemberID.Text;
                string newPrice = InputUpdateMemberType.Text;
                string newStart = InputNewStart.Text;
                string newEnd = InputUpdateExpiration.Text;
                string newName = newFName + " " + newLName;

                // Opening connection to the database and stored procedure
                SqlCommand com = new SqlCommand("museumSchema.UpdateMember");
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
                if (newPrice.Trim() != "No Change")
                    com.Parameters.AddWithValue("@newPrice", newPrice);
                if (newStart.Trim() != "")
                    com.Parameters.AddWithValue("@newStart", newStart);
                if (newEnd.Trim() != "")
                    com.Parameters.AddWithValue("@newEnd", newEnd);

                // Executing Stored Procedure
                com.ExecuteNonQuery();

                // Making label visible
                LabelUpdateMemberMessage.Visible = true; //making label visible
                LabelUpdateMemberMessage.Text = "Update successful";
                GridView2.DataBind();
            }
        }
    }
}