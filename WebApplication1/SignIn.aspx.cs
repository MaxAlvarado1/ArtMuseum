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
using System.Drawing.Drawing2D;
using System.Reflection.Emit;

namespace WebApplication1
{
    public partial class SignIn : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            SqlConnection museumConn = new SqlConnection("Server=tcp:museum.database.windows.net,1433;Initial Catalog=MuseumDB;Persist Security Info=False;User ID=JeremyL;Password=BabyThing1;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");
            {
                // Naming variables from inputs
                string idNum = TextBox3.Text;
                string username = TextBox4.Text;
                string password = TextBox5.Text;
                string passwordconfirm = TextBox6.Text;

                if (password != passwordconfirm)
                {
                    Label9.Visible = true;
                    Label9.Text = "Passwords are not the same. Retry.";
                }
                else
                {
                    // Opening connection to the database and stored procedure
                    SqlCommand com = new SqlCommand("museumSchema.Register");
                    museumConn.Open();
                    com.Connection = museumConn;
                    com.CommandType = System.Data.CommandType.StoredProcedure;

                    // Connecting variables to StoreProcedure's variables
                    com.Parameters.AddWithValue("@idNum", idNum);
                    com.Parameters.AddWithValue("@username", username);
                    com.Parameters.AddWithValue("@password", password);

                    try
                    {
                        // Executing Stored Procedure
                        com.ExecuteNonQuery();

                        Label9.Visible = true;
                        Label9.Text = "Registeration Successful.";
                    }
                    catch (System.Data.SqlClient.SqlException)
                    {
                        Label9.Visible = true;
                        Label9.Text = "Failed Registeration. Invalid ID Number.";
                    }
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection museumConn = new SqlConnection("Server=tcp:museum.database.windows.net,1433;Initial Catalog=MuseumDB;Persist Security Info=False;User ID=JeremyL;Password=BabyThing1;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");
            {
                // Naming variables from inputs
                string username = TextBox1.Text;
                string password = TextBox2.Text;

                SqlConnection museumConn2 = new SqlConnection("Server=tcp:museum.database.windows.net,1433;Initial Catalog=MuseumDB;Persist Security Info=False;User ID=JeremyL;Password=BabyThing1;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");
                SqlDataAdapter user = new SqlDataAdapter("SELECT * FROM museumSchema.logInfo WHERE username = " + "\'" + username + "\'", museumConn2);
                DataTable dt = new DataTable();
                user.Fill(dt);

                if (dt.Rows.Count > 0 ) {
                    string userID = dt.Rows[0][0].ToString();
                    string userUsername = dt.Rows[0][1].ToString();
                    string userPassword = dt.Rows[0][2].ToString();
                    string userLevel = dt.Rows[0][3].ToString();

                    if (userPassword == password)
                    {
                        if (userLevel == "1")
                        {
                            Session["USER"] = userID;
                            Response.Redirect("Home.aspx");
                        }
                        else if (userLevel == "2")
                        {
                            Session["USER"] = userID;
                            Response.Redirect("Shifts.aspx");
                        }
                        else if (userLevel == "3")
                        {
                            Session["USER"] = userID;
                            Response.Redirect("AdminHome.aspx");
                        }
                    }
                    else
                    {
                        Label10.Visible = true;
                        Label10.Text = "Login Failed. Password Incorrect.";
                    }
                }
                else
                {
                    Label10.Visible = true;
                    Label10.Text = "Login Failed. Username Incorrect.";
                }
            }
        }
    }
}