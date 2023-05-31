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
    public partial class ManageMerchandise : System.Web.UI.Page
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
                string name = TextBox1.Text;
                string price = TextBox3.Text;
                string collection = DropDownList1.Text;
                string exhibition = DropDownList2.Text;
                string amount = TextBox6.Text;
                string sales = TextBox8.Text;
                string maxStock = TextBox9.Text;

                // Opening connection to the database and stored procedure
                SqlCommand com = new SqlCommand("museumSchema.CreateNewMerchandise");
                museumConn.Open();
                com.Connection = museumConn;
                com.CommandType = System.Data.CommandType.StoredProcedure;

                // Connecting variables to StoreProcedure's variables
                com.Parameters.AddWithValue("@name", name);
                com.Parameters.AddWithValue("@price", price);
                if (collection.Trim() != "")
                    com.Parameters.AddWithValue("@collection", collection);
                if (exhibition.Trim() != "")
                    com.Parameters.AddWithValue("@exhibition", exhibition);
                com.Parameters.AddWithValue("@amount", amount);
                if (sales.Trim() != "")
                    com.Parameters.AddWithValue("@sales", sales);
                com.Parameters.AddWithValue("@maxStock", maxStock);

                // Executing Stored Procedure
                com.ExecuteNonQuery();

                // Making labels visible
                Label11.Visible = true; //making label visible
                Label11.Text = "New Merchandise Submission Successful.";
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            SqlConnection museumConn = new SqlConnection("Server=tcp:museum.database.windows.net,1433;Initial Catalog=MuseumDB;Persist Security Info=False;User ID=JeremyL;Password=BabyThing1;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");
            {
                // Naming variable from input
                string removeName = DropDownList3.Text;

                // Opening connection to the database and stored procedure
                SqlCommand com = new SqlCommand("museumSchema.RemoveMerchandiseItem");
                museumConn.Open();
                com.Connection = museumConn;
                com.CommandType = System.Data.CommandType.StoredProcedure;

                // Connecting variables to StoreProcedure's variables
                com.Parameters.AddWithValue("@name", removeName);

                // Executing Stored Procedure
                com.ExecuteNonQuery();

                // Making label visible
                Label21.Visible = true; //making label visible
                Label21.Text = "Removal successful";
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            SqlConnection museumConn = new SqlConnection("Server=tcp:museum.database.windows.net,1433;Initial Catalog=MuseumDB;Persist Security Info=False;User ID=JeremyL;Password=BabyThing1;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");
            {
                // Naming variables from inputs
                string oldName = DropDownList6.Text;
                string newName = TextBox10.Text;
                string newPrice = TextBox11.Text;
                string newCollection = DropDownList4.Text;
                string newExhibition = DropDownList5.Text;
                string newAmount = TextBox12.Text;
                string newSales = TextBox13.Text;
                string newMax = TextBox14.Text;

                // Opening connection to the database and stored procedure
                SqlCommand com = new SqlCommand("museumSchema.UpdateMerch");
                museumConn.Open();
                com.Connection = museumConn;
                com.CommandType = System.Data.CommandType.StoredProcedure;

                // Connecting variables to StoreProcedure's variables
                if (oldName.Trim() != "")
                    com.Parameters.AddWithValue("@oldName", oldName);
                if (newName.Trim() != "")
                    com.Parameters.AddWithValue("@newName", newName);
                if (newPrice.Trim() != "")
                    com.Parameters.AddWithValue("@newPrice", newPrice);
                if (newCollection.Trim() != "No Change")
                    com.Parameters.AddWithValue("@newCollection", newCollection);
                if (newExhibition.Trim() != "No Change")
                    com.Parameters.AddWithValue("@newExhibition", newExhibition);
                if (newAmount.Trim() != "")
                    com.Parameters.AddWithValue("@newAmount", newAmount);
                if (newSales.Trim() != "")
                    com.Parameters.AddWithValue("@newSales", newSales);
                if (newMax.Trim() != "")
                    com.Parameters.AddWithValue("@newMax", newMax);

                // Executing Stored Procedure
                com.ExecuteNonQuery();

                // Making label visible
                Label39.Visible = true; //making label visible
                Label39.Text = "Update successful";
                GridView1.DataBind();
            }
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            SqlConnection museumConn = new SqlConnection("Server=tcp:museum.database.windows.net,1433;Initial Catalog=MuseumDB;Persist Security Info=False;User ID=JeremyL;Password=BabyThing1;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");
            {
                // Naming variable from input
                string item = DropDownList7.Text;
                string amount = TextBox15.Text;

                // Opening connection to the database and stored procedure
                SqlCommand com = new SqlCommand("museumSchema.RestockProcedure");
                museumConn.Open();
                com.Connection = museumConn;
                com.CommandType = System.Data.CommandType.StoredProcedure;

                // Connecting variables to StoreProcedure's variables
                com.Parameters.AddWithValue("@merchName", item);
                com.Parameters.AddWithValue("@merchAmount", amount);

                // Executing Stored Procedure
                com.ExecuteNonQuery();

                // Making label visible
                Label21.Visible = true; //making label visible
                Label21.Text = "Restock successful";
                GridView2.DataBind();
            }
        }
    }
}