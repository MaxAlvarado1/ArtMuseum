using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using System.Data.SqlClient;
using System.IdentityModel.Protocols.WSTrust;

namespace WebApplication1
{
    public partial class BuyMerchandise : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["USER"] != null)
            {
                HelloName.Visible = true;
                HelloName.Text = "Hello, " + Session["USER"].ToString();
                SignButton.Visible = false;
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
            string custName = TextBox1.Text;
            string itemName = DropDownList1.Text;
            string itemAmount = DropDownList2.Text;
            string purchaseDate = DateBox.Text;

            if (purchaseDate == "")
                purchaseDate = null;
            if (itemAmount == "")
                MessageBox.Show("Please Specify Item Amount", "No Merchandise Amount detected", MessageBoxButtons.OK, MessageBoxIcon.Warning, MessageBoxDefaultButton.Button1, MessageBoxOptions.DefaultDesktopOnly);
            if (itemName == "")
                MessageBox.Show("Please Specify Item Name", "No Merchandise Name detected", MessageBoxButtons.OK, MessageBoxIcon.Warning, MessageBoxDefaultButton.Button1, MessageBoxOptions.DefaultDesktopOnly);
            if (itemName != "" && itemAmount != "")
            {
                SqlConnection museumConn = new SqlConnection("Server=tcp:museum.database.windows.net,1433;Initial Catalog=MuseumDB;Persist Security Info=False;User ID=JeremyL;Password=BabyThing1;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");
                {
                    museumConn.Open();
                    SqlCommand purchase = new SqlCommand("museumSchema.PurchaseMerch");
                    purchase.Connection = museumConn;
                    purchase.CommandType = System.Data.CommandType.StoredProcedure;
                    try
                    {
                        purchase.Parameters.AddWithValue("@CustomerName", custName);
                        purchase.Parameters.AddWithValue("@itemName", itemName);
                        purchase.Parameters.AddWithValue("@itemAmount", itemAmount);
                        purchase.Parameters.AddWithValue("@itemPurchaseDate", purchaseDate);
                        purchase.ExecuteNonQuery();
                        //MessageBox.Show("Purchase Successful", "PurchaseVerification", MessageBoxButtons.OK, MessageBoxIcon.Information, MessageBoxDefaultButton.Button1, MessageBoxOptions.DefaultDesktopOnly);
                        Response.Write("<script> alert('Purchase Successful') </script>");
                        GridView1.DataBind();

                    }
                    catch (SqlException ex)
                    {
                        if (ex.Number == 51000)
                        {
                            //MessageBox.Show("Sorry,We do not have enough stock to currently process your order", "Insufficient Stock", MessageBoxButtons.OK, MessageBoxIcon.Warning, MessageBoxDefaultButton.Button1, MessageBoxOptions.DefaultDesktopOnly);
                            Response.Write("<script> alert('Sorry, We do not have enough stock to currently process your order') </script>");
                        }
                        else
                            //MessageBox.Show("Error Occured, Possible Cause: Incorrect Data Entry", "Error", MessageBoxButtons.OK, MessageBoxIcon.Warning, MessageBoxDefaultButton.Button1, MessageBoxOptions.DefaultDesktopOnly);
                            Response.Write("<script> alert('Error Occured, Possible Cause: Incorrect Data Entry') </script>");
                    }
                }

            }
        }
    }
}