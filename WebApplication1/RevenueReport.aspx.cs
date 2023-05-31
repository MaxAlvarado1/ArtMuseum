using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI.WebControls;
using System.Web.UI.DataVisualization.Charting;

namespace WebApplication1
{
    public partial class RevenueReport : System.Web.UI.Page
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
            string fromInput = TextBox1.Text;
            string toInput = TextBox2.Text;

            SqlParameter paramFromDate = new SqlParameter("@startDate", fromInput);
            SqlParameter paramToDate = new SqlParameter("@endDate", toInput);

            SqlConnection museumConn = new SqlConnection("Server=tcp:museum.database.windows.net,1433;Initial Catalog=MuseumDB;Persist Security Info=False;User ID=JeremyL;Password=BabyThing1;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");
            {

                museumConn.Open();
                SqlCommand clear = new SqlCommand("DELETE FROM museumSchema.revenueReportGraph");
                SqlCommand report = new SqlCommand("museumSchema.InsertRevenueReportGraph");

                report.Connection = museumConn;
                clear.Connection = museumConn;
                clear.ExecuteNonQuery();
                report.CommandType = System.Data.CommandType.StoredProcedure;

                report.Parameters.AddWithValue("@startDate", fromInput);
                report.Parameters.AddWithValue("@endDate", toInput);

                report.ExecuteNonQuery();

                Revenue_Chart.DataBind();
                Report_Success.Visible = true;
                Report_Success.Text = "Report Generated"; 
                GridView1.DataBind();
            }
        }
    }
}