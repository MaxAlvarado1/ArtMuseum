using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace WebApplication1
{
    public partial class BuyMembership : System.Web.UI.Page
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

        protected void ButtonSubmitSignUp_Click(object sender, EventArgs e)
        {
            SqlConnection museumConn = new SqlConnection("Server=tcp:museum.database.windows.net,1433;Initial Catalog=MuseumDB;Persist Security Info=False;User ID=JeremyL;Password=BabyThing1;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");
            {
                string Fname = InputFname.Text;
                string Lname = InputLname.Text;
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

                LabelSignUpSubmit.Visible = true;
                LabelSignUpSubmit.Text = "Subscription Successful. Your ID is: ";
                LabelNewMemberID.Visible = true; //making label visible
                LabelNewMemberID.Text = newMemberID.ToString();
                Label1.Visible= true;
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

                if (dt.Rows.Count > 0)
                {
                    string userID = dt.Rows[0][0].ToString();
                    string userPassword = dt.Rows[0][2].ToString();

                    if (userPassword == password)
                    {
                        SqlCommand com = new SqlCommand("museumSchema.Unsubscribe");
                        museumConn.Open();
                        com.Connection = museumConn;
                        com.CommandType = System.Data.CommandType.StoredProcedure;

                        com.Parameters.AddWithValue("userID", userID);


                        com.ExecuteNonQuery();

                        Label8.Visible = true;
                        Label8.Text = "Unsubscribe Successful";
                    }
                    else
                    {
                        Label8.Visible = true;
                        Label8.Text = "Login Failed. Password Incorrect.";
                    }
                }
                else
                {
                    Label8.Visible = true;
                    Label8.Text = "Login Failed. Username Incorrect.";
                }
            }
        }
    }
}