using System;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class ManageTickets : System.Web.UI.Page
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
                string price = TextBox3.Text;
                string ticketType = TextBox4.Text;

                SqlCommand com = new SqlCommand("museumSchema.AddTicketType");
                museumConn.Open();
                com.Connection = museumConn;
                com.CommandType = System.Data.CommandType.StoredProcedure;

                //Creating Parameters for Adding to Database
                SqlParameter param3 = new SqlParameter("@Price", price);
                SqlParameter param4 = new SqlParameter("@TicketType", ticketType);



                //Connecting Parameters to Stored Procedure
                com.Parameters.Add(param3);
                com.Parameters.Add(param4);


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
                    Insertion_Success.Text = "Unable to insert. That Ticket exists!";
                }

            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            SqlConnection museumConn = new SqlConnection("Server=tcp:museum.database.windows.net,1433;Initial Catalog=MuseumDB;Persist Security Info=False;User ID=JeremyL;Password=BabyThing1;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");
            {
                string oldType = DropDownList2.Text;
                string newPrice = TextBox11.Text;
                string newType = TextBox12.Text;

                SqlCommand com = new SqlCommand("museumSchema.UpdateTicketType");
                museumConn.Open();
                com.Connection = museumConn;
                com.CommandType = System.Data.CommandType.StoredProcedure;

                SqlParameter param2 = new SqlParameter("@OldType", oldType);
                com.Parameters.Add(param2);
                if (newPrice.Trim() != "")
                {
                    SqlParameter param3 = new SqlParameter("@NewPrice", newPrice);
                    com.Parameters.Add(param3);

                }
                if (newType.Trim() != "")
                {
                    SqlParameter param4 = new SqlParameter("@NewType", newType);
                    com.Parameters.Add(param4);
                }

                try
                {
                    com.ExecuteNonQuery();
                    Update_Success.Visible = true;
                    Update_Success.Text = "Submission Successful!";
                }
                catch (System.Data.SqlClient.SqlException)
                {
                    Update_Success.Visible = true;
                    Update_Success.Text = "Unable to modify. Does not exist!";
                }
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            SqlConnection museumConn = new SqlConnection("Server=tcp:museum.database.windows.net,1433;Initial Catalog=MuseumDB;Persist Security Info=False;User ID=JeremyL;Password=BabyThing1;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");
            {
                string deleteTick = DropDownList1.Text;
                SqlCommand com = new SqlCommand("museumSchema.DeleteTicketType");
                museumConn.Open();
                com.Connection = museumConn;
                com.CommandType = System.Data.CommandType.StoredProcedure;

                SqlParameter param1 = new SqlParameter("@DeleteTicketType", deleteTick);
                com.Parameters.Add(param1);


                //executing the Stored Procedure 'Delete' command
                //Add Exception Handling for when an error is made           
                try
                {
                    com.ExecuteNonQuery();
                    Deletion_Success.Text = "Deletion Success";
                }
                catch (System.Data.SqlClient.SqlException)
                {
                    Deletion_Success.Text = "Unable to delete. Database Error!";
                }
            }
        }
    }
}