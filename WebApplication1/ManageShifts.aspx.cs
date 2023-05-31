using Microsoft.Data.SqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class ManageShifts : System.Web.UI.Page
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

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            DateTime dtSelected = Calendar1.SelectedDate;
            string strDate = dtSelected.ToString("MM-dd-yyyy");
            SqlConnection museumConn2 = new SqlConnection("Server=tcp:museum.database.windows.net,1433;Initial Catalog=MuseumDB;Persist Security Info=False;User ID=JeremyL;Password=BabyThing1;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");
            SqlCommand read = new SqlCommand("SELECT Employees.Name, shifts.employeeID, shifts.startDateTime, shifts.endDateTime FROM museumSchema.shifts INNER JOIN museumSchema.Employees ON shifts.employeeID = Employees.ID_num WHERE CAST(shifts.startDateTime AS Date) = " + "'" + strDate + "'", museumConn2);
            museumConn2.Open();
            SqlDataReader shifts = read.ExecuteReader();

            GridView1.DataSource = shifts;
            GridView1.DataBind();

            Label11.Visible = false;
            DropDownList2.Visible = false;
            Label9.Visible = false;
            TextBox3.Visible = false;
            Label10.Visible = false;
            TextBox4.Visible = false;
            Label15.Visible = false;
            Button2.Visible = false;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection museumConn = new SqlConnection("Server=tcp:museum.database.windows.net,1433;Initial Catalog=MuseumDB;Persist Security Info=False;User ID=JeremyL;Password=BabyThing1;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");
            {
                // Naming variables from inputs
                string employee = DropDownList1.Text;
                string start = TextBox1.Text;
                string end = TextBox2.Text;

                // Opening connection to the database and stored procedure
                SqlCommand com = new SqlCommand("museumSchema.AddShift");
                museumConn.Open();
                com.Connection = museumConn;
                com.CommandType = System.Data.CommandType.StoredProcedure;

                // Connecting variables to StoreProcedure's variables
                com.Parameters.AddWithValue("@id", employee);
                com.Parameters.AddWithValue("@start", DateTime.Parse(start));
                com.Parameters.AddWithValue("@end", DateTime.Parse(end));

                // Executing Stored Procedure
                com.ExecuteNonQuery();

                // Making label visible
                Label7.Visible = true; //making label visible
                Label7.Text = "Update successful";

            }
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DeleteShift")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = GridView1.Rows[rowIndex];
                string ID = row.Cells[1].Text;
                string start = row.Cells[2].Text;
                string end = row.Cells[3].Text;

                SqlConnection museumConn = new SqlConnection("Server=tcp:museum.database.windows.net,1433;Initial Catalog=MuseumDB;Persist Security Info=False;User ID=JeremyL;Password=BabyThing1;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");
                {
                    // Opening connection to the database and stored procedure
                    SqlCommand com = new SqlCommand("museumSchema.RemoveShift");
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
                    Label8.Visible = true; //making label visible
                    Label8.Text = "Removal successful";
                    GridView1.DataBind();
                    GridView2.DataBind();
                }
            }
            if (e.CommandName == "EditShift")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = GridView1.Rows[rowIndex];
                Label12.Text = row.Cells[1].Text;
                Label13.Text = row.Cells[2].Text;
                Label14.Text = row.Cells[3].Text;
                Label11.Visible = true;
                DropDownList2.Visible = true;
                Label9.Visible = true;
                TextBox3.Visible = true;
                Label10.Visible = true;
                TextBox4.Visible = true;
                Label15.Visible = true;
                Button2.Visible = true;
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            SqlConnection museumConn = new SqlConnection("Server=tcp:museum.database.windows.net,1433;Initial Catalog=MuseumDB;Persist Security Info=False;User ID=JeremyL;Password=BabyThing1;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");
            {
                string oldID = Label12.Text;
                string oldstart = Label13.Text;
                string oldend = Label14.Text;
                string newID = DropDownList2.Text;
                string newstart = TextBox3.Text;
                string newend = TextBox4.Text;

                // Opening connection to the database and stored procedure
                SqlCommand com = new SqlCommand("museumSchema.EditShift");
                museumConn.Open();
                com.Connection = museumConn;
                com.CommandType = System.Data.CommandType.StoredProcedure;

                // Connecting variables to StoreProcedure's variables
                if (oldID.Trim() != "")
                    com.Parameters.AddWithValue("@oldID", oldID);
                if (oldstart.Trim() != "")
                    com.Parameters.AddWithValue("@oldstart", oldstart);
                if (oldend.Trim() != "")
                    com.Parameters.AddWithValue("@oldend", oldend);
                if (newID.Trim() != "No Change")
                    com.Parameters.AddWithValue("@newID", newID);
                if (newstart.Trim() != "")
                    com.Parameters.AddWithValue("@newstart", newstart);
                if (newend.Trim() != "")
                    com.Parameters.AddWithValue("@newend", newend);

                // Executing Stored Procedure
                com.ExecuteNonQuery();

                // Making label visible
                Label8.Visible = true; //making label visible
                Label8.Text = "Edit successful";
                GridView1.DataBind();
                GridView2.DataBind();
            }
        }

        protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Accept")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = GridView2.Rows[rowIndex];
                string ID = row.Cells[1].Text;
                string start = row.Cells[2].Text;
                string end = row.Cells[3].Text;

                SqlConnection museumConn = new SqlConnection("Server=tcp:museum.database.windows.net,1433;Initial Catalog=MuseumDB;Persist Security Info=False;User ID=JeremyL;Password=BabyThing1;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");
                {
                    // Opening connection to the database and stored procedure
                    SqlCommand com = new SqlCommand("museumSchema.RemoveShift");
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
                    Label17.Visible = true; //making label visible
                    Label17.Text = "Removal successful";
                    GridView1.DataBind();
                    GridView2.DataBind();
                }
            }
            if (e.CommandName == "Deny")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = GridView2.Rows[rowIndex];
                string ID = row.Cells[1].Text;
                string start = row.Cells[2].Text;
                string end = row.Cells[3].Text;

                SqlConnection museumConn = new SqlConnection("Server=tcp:museum.database.windows.net,1433;Initial Catalog=MuseumDB;Persist Security Info=False;User ID=JeremyL;Password=BabyThing1;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");
                {
                    // Opening connection to the database and stored procedure
                    SqlCommand com = new SqlCommand("museumSchema.RemoveRequest");
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
                    Label17.Visible = true; //making label visible
                    Label17.Text = "Denial successful";
                    GridView1.DataBind();
                    GridView2.DataBind();
                }
            }
        }
    }
}