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
using System.Web.Caching;

namespace WebApplication1
{
    public partial class Shifts : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["USER"] != null)
            {
                HelloName.Text = "Hello, " + Session["USER"].ToString();
            }
            string ID = Session["USER"].ToString();
            SqlConnection museumConn2 = new SqlConnection("Server=tcp:museum.database.windows.net,1433;Initial Catalog=MuseumDB;Persist Security Info=False;User ID=JeremyL;Password=BabyThing1;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");
            SqlCommand read = new SqlCommand("SELECT * FROM museumSchema.Shifts WHERE employeeID = " + "'" + ID + "'", museumConn2);
            museumConn2.Open();
            read.Connection = museumConn2;
            SqlDataReader rdr = read.ExecuteReader();
            GridView1.DataSource = rdr;
            GridView1.DataBind();

            SqlConnection museumConn = new SqlConnection("Server=tcp:museum.database.windows.net,1433;Initial Catalog=MuseumDB;Persist Security Info=False;User ID=JeremyL;Password=BabyThing1;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");
            {
                SqlCommand com = new SqlCommand("museumSchema.checkR");
                museumConn.Open();
                com.Connection = museumConn;
                com.CommandType = System.Data.CommandType.StoredProcedure;

                com.Parameters.AddWithValue("@ID", ID);
            }
        }

        protected void SignOut_Click(object sender, EventArgs e)
        {
            Session.Remove("USER");
            Session.RemoveAll();
            Response.Redirect("Home.aspx");
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "RequestOff")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = GridView1.Rows[rowIndex];
                string ID = row.Cells[0].Text;
                string start = row.Cells[1].Text;
                string end = row.Cells[2].Text;

                SqlConnection museumConn = new SqlConnection("Server=tcp:museum.database.windows.net,1433;Initial Catalog=MuseumDB;Persist Security Info=False;User ID=JeremyL;Password=BabyThing1;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");
                {
                    // Opening connection to the database and stored procedure
                    SqlCommand com = new SqlCommand("museumSchema.RequestOff");
                    museumConn.Open();
                    com.Connection = museumConn;
                    com.CommandType = System.Data.CommandType.StoredProcedure;

                    // Connecting variables to StoreProcedure's variables
                    com.Parameters.AddWithValue("@ID", ID);
                    com.Parameters.AddWithValue("@start", start);
                    com.Parameters.AddWithValue("@end", end);

                    // Executing Stored Procedure
                    com.ExecuteNonQuery();

                    // Making label visible
                    Label2.Visible = true; //making label visible
                    Label2.Text = "Request Off Sent";
                    string eID = Session["USER"].ToString();
                    SqlConnection museumConn2 = new SqlConnection("Server=tcp:museum.database.windows.net,1433;Initial Catalog=MuseumDB;Persist Security Info=False;User ID=JeremyL;Password=BabyThing1;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");
                    SqlCommand read = new SqlCommand("SELECT * FROM museumSchema.Shifts WHERE employeeID = " + "'" + eID + "'", museumConn2);
                    museumConn2.Open();
                    read.Connection = museumConn2;
                    SqlDataReader rdr = read.ExecuteReader();
                    GridView1.DataSource = rdr;
                    GridView1.DataBind();
                }
            }
        }
    }
}