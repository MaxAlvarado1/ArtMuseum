using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Drawing.Printing;
using System.Windows.Forms;

namespace WebApplication1
{
    public partial class BuyTicket : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["USER"] != null)
            {
                HelloName.Visible = true;
                HelloName.Text = "Hello, " + Session["USER"].ToString();
                SignButton.Visible = false;
                SignOutButton.Visible = true;
                GridView1.Visible = false;
                GridView2.Visible = true;
                TicketTypeDrop.DataSourceID = "SqlDataSource2";
                Label8.Visible = true;
            }
        }

        protected void SignOutButton_Click(object sender, EventArgs e)
        {
            Session.Remove("USER");
            Session.RemoveAll();
            Response.Redirect("Home.aspx");
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            string custName = TextBox1.Text;
            string ticketType = TicketTypeDrop.Text;
            string amount = DropDownList1.Text;
            string exhibition = ExhibitDrop.Text;
            string collection = CollectionDrop.Text;
            string datePurchased = purchaseDate.Text;
            SqlConnection museumConn = new SqlConnection("Server=tcp:museum.database.windows.net,1433;Initial Catalog=MuseumDB;Persist Security Info=False;User ID=JeremyL;Password=BabyThing1;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");
            {

                museumConn.Open();
                SqlCommand purchase = new SqlCommand("museumSchema.PurchaseTicket");
                purchase.Connection = museumConn;
                purchase.CommandType = System.Data.CommandType.StoredProcedure;
                try
                {
                    purchase.Parameters.AddWithValue("@CustName", custName);
                    purchase.Parameters.AddWithValue("@ticketType", ticketType);
                    purchase.Parameters.AddWithValue("@amount", amount);
                    if (exhibition != "None")
                        purchase.Parameters.AddWithValue("@exhibition", exhibition);
                    if (collection != "None")
                        purchase.Parameters.AddWithValue("@collection", collection);
                    if (datePurchased != "")
                        purchase.Parameters.AddWithValue("@datePurchased", datePurchased);
                    purchase.ExecuteNonQuery();
                    //MessageBox.Show("Purchase Successful", "PurchaseVerification", MessageBoxButtons.OK, MessageBoxIcon.Information, MessageBoxDefaultButton.Button1, MessageBoxOptions.DefaultDesktopOnly);
                    Response.Write("<script> alert('Purchase Successful') </script>");
                }
                catch (SqlException)
                {
                    MessageBox.Show("Purchase Unsuccessful", "Failed Purchase", MessageBoxButtons.OK, MessageBoxIcon.Information, MessageBoxDefaultButton.Button1, MessageBoxOptions.DefaultDesktopOnly);
                    Response.Write("<script> alert('Purchase Unsuccessful') </script>");
                }

            }
        }
    }
}