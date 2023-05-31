using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using System.Data.SqlClient;
using System.Data;

namespace WebApplication1
{
    public partial class ManageExhibitions : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["USER"] != null)
            {
                HelloName.Visible = true;
                HelloName.Text = "Hello, " + Session["USER"].ToString();
                SignOutButton.Visible = true;
            }
            ErrorLabel.Visible = false;
            ErrorLabel2.Visible = false;
            ErrorLabel3.Visible = false;
        }

        protected void SignOutButton_Click(object sender, EventArgs e)
        {
            Session.Remove("USER");
            Session.RemoveAll();
            Response.Redirect("Home.aspx");
        }

        protected void InsertButton_Click(object sender, EventArgs e)
        {
            SqlConnection museumConn = new SqlConnection("Server=tcp:museum.database.windows.net,1433;Initial Catalog=MuseumDB;Persist Security Info=False;User ID=JeremyL;Password=BabyThing1;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");
            {
                string ExhibitName = ExhibitNameField.Text;
                string ArtistName = ArtistDropDownList.Text;
                string locationNum = LocationDropDownList.Text;
                string startDate = StartDateField.Text;
                string endDate = EndDateField.Text;
                if (startDate == "")
                    startDate = null;
                if (endDate == "")
                    endDate = null;
                if (ArtistName == "")
                    ArtistName = null;
                if (locationNum == "")
                    locationNum = null;
                if (locationNum == "Gallery")
                    locationNum = "5";
                if (locationNum == "Exhibition Room")
                    locationNum = "8";
                if (ExhibitName == "")
                    MessageBox.Show("Please Insert at least Exhibit Name", "No ExhibitName detected", MessageBoxButtons.OK, MessageBoxIcon.Warning, MessageBoxDefaultButton.Button1, MessageBoxOptions.DefaultDesktopOnly);
                else
                {

                    SqlCommand insertCol = new SqlCommand("museumSchema.InsertExhibition");
                    museumConn.Open();
                    insertCol.Connection = museumConn;
                    insertCol.CommandType = System.Data.CommandType.StoredProcedure;

                    try
                    {
                        insertCol.Parameters.AddWithValue("@ExhibitName", ExhibitName);
                        insertCol.Parameters.AddWithValue("@artist_name", ArtistName);
                        insertCol.Parameters.AddWithValue("@location_num", locationNum);
                        insertCol.Parameters.AddWithValue("@start_date", startDate);
                        insertCol.Parameters.AddWithValue("@end_date", endDate);
                        insertCol.ExecuteNonQuery();
                        GridView2.DataBind();
                    }

                    catch (System.Data.SqlClient.SqlException)
                    {
                        ErrorLabel.Visible = true;
                        ErrorLabel.Text = "Error Occured, possible causes are the Exhibition name already existing, incorrect data type entered, or invalid foreign key values entered";

                    }
                    /*
                    ErrorLabel.Visible = true;
                    ErrorLabel.Text = "Insertion Successful";
                    */
                }

            }
        }

        protected void UpdateButton_Click(object sender, EventArgs e)
        {
            string oldExNameParam = oldExhibitName.Text;
            string newExNameParam = newExhibitName.Text;
            string newArtistNameParam = newArtistDropDown.Text;
            string newLocationNumParam = newLocationDropDown.Text;
            string newStartDateParam = newStartDate.Text;
            string newEndDateParam = newEndDate.Text;

            if (newLocationNumParam == "Gallery")
                newLocationNumParam = "5";
            if (newLocationNumParam == "Exhibition Room")
                newLocationNumParam = "8";

            if (oldExNameParam == "")
                MessageBox.Show("Please fill out the name of the exhibit to be updated", "No Old Exhibit Name Detected", MessageBoxButtons.OK, MessageBoxIcon.Warning, MessageBoxDefaultButton.Button1, MessageBoxOptions.DefaultDesktopOnly);
            else if (newExNameParam == "")
                MessageBox.Show("Please fill out the new name of the exhibit", "No Exhibit Name Detected", MessageBoxButtons.OK, MessageBoxIcon.Warning, MessageBoxDefaultButton.Button1, MessageBoxOptions.DefaultDesktopOnly);
            else
            {
                SqlConnection conn = new SqlConnection("Server=tcp:museum.database.windows.net,1433;Initial Catalog=MuseumDB;Persist Security Info=False;User ID=JeremyL;Password=BabyThing1;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");
                {
                    conn.Open();
                    SqlCommand update = new SqlCommand("museumSchema.ModifyExhibitions");
                    try
                    {
                        update.Parameters.AddWithValue("@oldExhibitName", oldExNameParam);
                        update.Parameters.AddWithValue("@newExhibitName", newExNameParam);
                        if (newArtistNameParam != "")
                            update.Parameters.AddWithValue("@newArtistName", newArtistNameParam);
                        if (newLocationNumParam != "")
                            update.Parameters.AddWithValue("@LocationNum", newLocationNumParam);
                        if (newStartDateParam != "")
                            update.Parameters.AddWithValue("@startDate", newStartDateParam);
                        if (newEndDateParam != "")
                            update.Parameters.AddWithValue("@endDate", newEndDateParam);
                        update.Connection = conn;
                        update.CommandType = System.Data.CommandType.StoredProcedure;
                        update.ExecuteNonQuery();
                        GridView2.DataBind();
                        conn.Close();
                    }
                    catch (System.Data.SqlClient.SqlException)
                    {
                        ErrorLabel2.Visible = true;
                        ErrorLabel2.Text = "Error Occured, possible causes are the new exhibition name already existing, incorrect data type entered, or invalid new foreign key values entered";
                    }

                }

            }
        }

        protected void DeleteButton_Click(object sender, EventArgs e)
        {
            SqlConnection museumConn = new SqlConnection("Server=tcp:museum.database.windows.net,1433;Initial Catalog=MuseumDB;Persist Security Info=False;User ID=JeremyL;Password=BabyThing1;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");
            {
                string exhibitionName = deleteExhibitNameTextBox.Text;
                if (exhibitionName == "")
                    MessageBox.Show("Please fill out the name of the exhibit to be deleted", "No Exhibit Name Detected", MessageBoxButtons.OK, MessageBoxIcon.Warning, MessageBoxDefaultButton.Button1, MessageBoxOptions.DefaultDesktopOnly);
                else
                {
                    var selectedOption = MessageBox.Show("Are you sure you want to delete exhibit " + exhibitionName, "Confirm Deletion", MessageBoxButtons.YesNoCancel, MessageBoxIcon.Question, MessageBoxDefaultButton.Button2, MessageBoxOptions.DefaultDesktopOnly);
                    if (selectedOption == DialogResult.Yes)
                    {
                        SqlCommand deleteEx = new SqlCommand("museumSchema.deleteExhibition");
                        museumConn.Open();
                        deleteEx.Connection = museumConn;
                        try
                        {
                            deleteEx.Parameters.AddWithValue("@desiredExhibitionName", exhibitionName);
                            deleteEx.CommandType = System.Data.CommandType.StoredProcedure;
                            deleteEx.ExecuteNonQuery();
                            GridView2.DataBind();
                            museumConn.Close();
                        }
                        catch (System.Data.SqlClient.SqlException)
                        {
                            ErrorLabel3.Visible = true;
                            ErrorLabel3.Text = "Error, Possible cause is invalid type of data entered into field";
                        }
                    }
                    if (selectedOption == DialogResult.No)
                    {
                        MessageBox.Show("Deletion Aborted", "Deletion Aborted!", MessageBoxButtons.OK, MessageBoxIcon.Information, MessageBoxDefaultButton.Button1, MessageBoxOptions.DefaultDesktopOnly);
                    }
                }




            }
        }
    }
}