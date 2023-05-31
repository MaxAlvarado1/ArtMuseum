using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Windows.Forms;
using System.Web.UI.DataVisualization.Charting;

namespace WebApplication1
{
    public partial class TicketsReport : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["USER"] != null)
            {
                HelloName.Visible = true;
                HelloName.Text = "Hello, " + Session["USER"].ToString();
                SignOutButton.Visible = true;
            }
            string ticketType = TicketDrop.Text;
            Chart1.Series["Series1"].IsValueShownAsLabel = true;
            Chart2.Series["Series1"].IsValueShownAsLabel = true;
            SqlConnection museumConn = new SqlConnection("Server=tcp:museum.database.windows.net,1433;Initial Catalog=MuseumDB;Persist Security Info=False;User ID=JeremyL;Password=BabyThing1;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");
            {
                museumConn.Open();
                SqlCommand clear = new SqlCommand("DELETE FROM museumSchema.ticketReportSupportTable");
                SqlCommand clear2 = new SqlCommand("DELETE FROM museumSchema.ticketReportSupportTableB");
                clear.Connection = museumConn;
                clear2.Connection = museumConn;
                clear.ExecuteNonQuery();
                clear2.ExecuteNonQuery();
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
            string startDate = StartDateBox.Text;
            string endDate = EndDateBox.Text;
            string ticketType = TicketDrop.Text;

            if (startDate == "")
                // MessageBox.Show("Please Insert Start Date", "No Start Date Detected", MessageBoxButtons.OK, MessageBoxIcon.Warning, MessageBoxDefaultButton.Button1, MessageBoxOptions.DefaultDesktopOnly);
                Response.Write("<script> alert('Please Enter Start Date') </script>");
            if (endDate == "")
                // MessageBox.Show("Please Insert End Date", "No End Date Detected", MessageBoxButtons.OK, MessageBoxIcon.Warning, MessageBoxDefaultButton.Button1, MessageBoxOptions.DefaultDesktopOnly);
                Response.Write("<script> alert('Please Enter End Date') </script>");
            if (startDate != "" && endDate != "")
            {
                SqlConnection museumConn = new SqlConnection("Server=tcp:museum.database.windows.net,1433;Initial Catalog=MuseumDB;Persist Security Info=False;User ID=JeremyL;Password=BabyThing1;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");
                {
                    museumConn.Open();
                    SqlCommand clear = new SqlCommand("DELETE FROM museumSchema.ticketReportSupportTable");
                    SqlCommand clear2 = new SqlCommand("DELETE FROM museumSchema.ticketReportSupportTableB");
                    clear.Connection = museumConn;
                    clear2.Connection = museumConn;
                    clear.ExecuteNonQuery();
                    clear2.ExecuteNonQuery();

                    SqlCommand generate = new SqlCommand("museumSchema.ticketReportSupport1A");
                    SqlCommand generatePieChart2 = new SqlCommand("museumSchema.TicketReportSupport1B");
                    SqlCommand generateMainTable = new SqlCommand("museumSchema.TicketReportMain");
                    generate.Connection = museumConn;
                    generatePieChart2.Connection = museumConn;
                    generateMainTable.Connection = museumConn;
                    generate.CommandType = System.Data.CommandType.StoredProcedure;
                    generatePieChart2.CommandType = System.Data.CommandType.StoredProcedure;
                    generateMainTable.CommandType = System.Data.CommandType.StoredProcedure;

                    generate.Parameters.AddWithValue("@ticketType", ticketType);
                    generate.Parameters.AddWithValue("@startDate", startDate);
                    generate.Parameters.AddWithValue("@endDate", endDate);

                    generatePieChart2.Parameters.AddWithValue("@startDate", startDate);
                    generatePieChart2.Parameters.AddWithValue("@endDate", endDate);

                    generateMainTable.Parameters.AddWithValue("@ticketType", ticketType);
                    generateMainTable.Parameters.AddWithValue("@startDate", startDate);
                    generateMainTable.Parameters.AddWithValue("@endDate", endDate);




                    generate.ExecuteNonQuery();
                    generatePieChart2.ExecuteNonQuery();

                    SqlDataReader rdl = generateMainTable.ExecuteReader();

                    reportView.DataSource = rdl;
                    reportView.DataBind();
                    GridView1.DataBind();
                    Chart1.DataBind();
                    Chart2.DataBind();
                }
            }
        }
    }
}