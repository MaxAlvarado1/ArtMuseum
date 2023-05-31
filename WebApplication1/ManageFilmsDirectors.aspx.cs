using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace WebApplication1
{
    public partial class ManageFilmsDirectors : System.Web.UI.Page
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

        protected void InsertFilms_Click(object sender, EventArgs e)
        {
            string filmName = filmNameInsert.Text;
            string directorName = directiorNameInsertDrop.Text;
            string filmCompany = filmCompanyInsert.Text;
            string releaseDate = releaseDateInsert.Text;
            string filmLocation = filmLocationInsertDrop.Text;

            if (filmCompany == "")
                filmCompany = null;
            if (releaseDate == "")
                releaseDate = null;
            if (filmLocation == "Manager Offices")
                filmLocation = "1";
            else if (filmLocation == "Employee Lounge")
                filmLocation = "2";
            else if (filmLocation == "Supply Room")
                filmLocation = "3";
            else if (filmLocation == "Ticket Booth / Entrance")
                filmLocation = "4";
            else if (filmLocation == "Gallery")
                filmLocation = "5";
            else if (filmLocation == "Theater")
                filmLocation = "6";
            else if (filmLocation == "Merchandise Store")
                filmLocation = "7";
            else if (filmLocation == "Exhibition Room")
                filmLocation = "8";
            else
                filmLocation = "9";
            if (filmName == "")
                MessageBox.Show("Please Insert at least film name", "No Film Name detected", MessageBoxButtons.OK, MessageBoxIcon.Warning, MessageBoxDefaultButton.Button1, MessageBoxOptions.DefaultDesktopOnly);
            else
            {
                SqlConnection museumConn = new SqlConnection("Server=tcp:museum.database.windows.net,1433;Initial Catalog=MuseumDB;Persist Security Info=False;User ID=JeremyL;Password=BabyThing1;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");
                {
                    museumConn.Open();
                    SqlCommand insertFilm = new SqlCommand("museumSchema.InsertFilm");
                    insertFilm.Connection = museumConn;
                    insertFilm.CommandType = System.Data.CommandType.StoredProcedure;
                    try
                    {
                        insertFilm.Parameters.AddWithValue("@filmName", filmName);
                        insertFilm.Parameters.AddWithValue("@directorName", directorName);
                        insertFilm.Parameters.AddWithValue("@filmCompany", filmCompany);
                        insertFilm.Parameters.AddWithValue("@releaseDate", releaseDate);
                        insertFilm.Parameters.AddWithValue("@filmLocation", filmLocation);
                        insertFilm.ExecuteNonQuery();
                        FilmsView.DataBind();
                    }
                    catch (SqlException)
                    {
                        MessageBox.Show("Error Occured, Possible cause: incorrect Data entry", "Error Occurred", MessageBoxButtons.OK, MessageBoxIcon.Warning, MessageBoxDefaultButton.Button1, MessageBoxOptions.DefaultDesktopOnly);
                    }

                    museumConn.Close();
                }
            }
        }

        protected void UpdateButton_Click(object sender, EventArgs e)
        {
            string oldfilmName = DropDownList2.Text;
            string newfilmName = newFilmNameUpdate.Text;
            string directorName = UpdateDirectorDrop.Text;
            string filmCompany = newFilmCompanyUpdate.Text;
            string releaseDate = newReleaseDateUpdate.Text;
            string filmLocation = UpdateLocationDrop.Text;

            if (filmLocation == "Manager Offices")
                filmLocation = "1";
            else if (filmLocation == "Employee Lounge")
                filmLocation = "2";
            else if (filmLocation == "Supply Room")
                filmLocation = "3";
            else if (filmLocation == "Ticket Booth / Entrance")
                filmLocation = "4";
            else if (filmLocation == "Gallery")
                filmLocation = "5";
            else if (filmLocation == "Theater")
                filmLocation = "6";
            else if (filmLocation == "Merchandise Store")
                filmLocation = "7";
            else if (filmLocation == "Exhibition Room")
                filmLocation = "8";
            else
                filmLocation = "9";

            if (oldfilmName == "")
                MessageBox.Show("Please Insert Old Film Name", "No Film Name detected", MessageBoxButtons.OK, MessageBoxIcon.Warning, MessageBoxDefaultButton.Button1, MessageBoxOptions.DefaultDesktopOnly);
            if (newfilmName == "")
                MessageBox.Show("Please Insert new film name", "No Film Name detected", MessageBoxButtons.OK, MessageBoxIcon.Warning, MessageBoxDefaultButton.Button1, MessageBoxOptions.DefaultDesktopOnly);
            if (filmCompany == "")
                filmCompany = null;
            if (releaseDate == "")
                releaseDate = null;
            if (oldfilmName != "" && newfilmName != "")
            {
                SqlConnection museumConn = new SqlConnection("Server=tcp:museum.database.windows.net,1433;Initial Catalog=MuseumDB;Persist Security Info=False;User ID=JeremyL;Password=BabyThing1;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");
                {
                    museumConn.Open();
                    SqlCommand updateFilms = new SqlCommand("museumSchema.ModifyFilms");
                    updateFilms.Connection = museumConn;
                    updateFilms.CommandType = System.Data.CommandType.StoredProcedure;

                    try
                    {
                        updateFilms.Parameters.AddWithValue("@oldFilmName", oldfilmName);
                        updateFilms.Parameters.AddWithValue("@newFilmName", newfilmName);
                        if (directorName != "No Change")
                            updateFilms.Parameters.AddWithValue("@newDirectorName", directorName);
                        updateFilms.Parameters.AddWithValue("@filmCompany", filmCompany);
                        updateFilms.Parameters.AddWithValue("@releaseDate", releaseDate);
                        if (filmLocation != "No Change")
                            updateFilms.Parameters.AddWithValue("@film_Location", filmLocation);
                        updateFilms.ExecuteNonQuery();
                        FilmsView.DataBind();

                    }
                    catch (SqlException)
                    {
                        MessageBox.Show("Error Occured, Possible cause: incorrect Data entry", "Error Occurred", MessageBoxButtons.OK, MessageBoxIcon.Warning, MessageBoxDefaultButton.Button1, MessageBoxOptions.DefaultDesktopOnly);
                    }
                }
            }
        }

        protected void DeleteButton_Click(object sender, EventArgs e)
        {
            string filmName = DropDownList1.Text;
            if (filmName == "")
                MessageBox.Show("Please Insert at least film name", "No Film Name detected", MessageBoxButtons.OK, MessageBoxIcon.Warning, MessageBoxDefaultButton.Button1, MessageBoxOptions.DefaultDesktopOnly);
            else
            {
                //var selectedOption = MessageBox.Show("Are you sure you want to delete film " + filmName, "Confirm Deletion", MessageBoxButtons.YesNoCancel, MessageBoxIcon.Question, MessageBoxDefaultButton.Button2, MessageBoxOptions.DefaultDesktopOnly);
                
                //if (selectedOption == DialogResult.Yes)
                //{
                    SqlConnection museumConn = new SqlConnection("Server=tcp:museum.database.windows.net,1433;Initial Catalog=MuseumDB;Persist Security Info=False;User ID=JeremyL;Password=BabyThing1;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");
                    {
                        museumConn.Open();
                        SqlCommand deleteFilm = new SqlCommand("museumSchema.DeleteFilm");
                        deleteFilm.Connection = museumConn;
                        deleteFilm.CommandType = System.Data.CommandType.StoredProcedure;
                        try
                        {
                            deleteFilm.Parameters.AddWithValue("@filmName", filmName);
                            deleteFilm.ExecuteNonQuery();
                            FilmsView.DataBind();
                        }
                        catch (SqlException)
                        {
                            //MessageBox.Show("Error Occured, Possible cause: incorrect Data entry", "Error Occurred", MessageBoxButtons.OK, MessageBoxIcon.Warning, MessageBoxDefaultButton.Button1, MessageBoxOptions.DefaultDesktopOnly);
                        }
                    }

                //}
                //if (selectedOption == DialogResult.No)
                //{
                    //MessageBox.Show("Deletion Aborted", "Deletion Aborted!", MessageBoxButtons.OK, MessageBoxIcon.Information, MessageBoxDefaultButton.Button1, MessageBoxOptions.DefaultDesktopOnly);

                //}

            }
        }

        protected void InsertButton_Click(object sender, EventArgs e)
        {
            string directorName = InsertDirectorNameBox.Text;
            string dateOfBirth = InsertBirthdayBox.Text;
            string dateOfDeath = InsertDeathDayBox.Text;
            if (dateOfBirth == "")
                dateOfBirth = null;
            if (dateOfDeath == "")
                dateOfDeath = null;
            if (directorName == "")
                MessageBox.Show("Please Insert at least director name", "No director Name detected", MessageBoxButtons.OK, MessageBoxIcon.Warning, MessageBoxDefaultButton.Button1, MessageBoxOptions.DefaultDesktopOnly);
            else
            {
                SqlConnection museumConn = new SqlConnection("Server=tcp:museum.database.windows.net,1433;Initial Catalog=MuseumDB;Persist Security Info=False;User ID=JeremyL;Password=BabyThing1;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");
                {
                    museumConn.Open();
                    SqlCommand insert = new SqlCommand("museumSchema.InsertDirector");
                    insert.Connection = museumConn;
                    insert.CommandType = System.Data.CommandType.StoredProcedure;
                    try
                    {
                        insert.Parameters.AddWithValue("@DirectorName", directorName);
                        insert.Parameters.AddWithValue("@DateOfBirth", dateOfBirth);
                        insert.Parameters.AddWithValue("@DateOfDeath", dateOfDeath);
                        insert.ExecuteNonQuery();
                        DirectorView.DataBind();

                    }
                    catch
                    {
                        MessageBox.Show("Error Occured, Possible cause: incorrect Data entry", "Error Occurred", MessageBoxButtons.OK, MessageBoxIcon.Warning, MessageBoxDefaultButton.Button1, MessageBoxOptions.DefaultDesktopOnly);
                    }
                }

            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            string oldDirectorName = DropDownList3.Text;
            string newDirectorName = newDirectorNameBox.Text;
            string dateOfBirth = newBirthDayBox.Text;
            string dateOfDeath = newDeathDayBox.Text;
            if (dateOfBirth == "")
                dateOfBirth = null;
            if (dateOfDeath == "")
                dateOfDeath = null;
            if (oldDirectorName == "")
                MessageBox.Show("Please Insert old director name", "No director Name detected", MessageBoxButtons.OK, MessageBoxIcon.Warning, MessageBoxDefaultButton.Button1, MessageBoxOptions.DefaultDesktopOnly);
            if (newDirectorName == "")
                MessageBox.Show("Please Insert new director name", "No director Name detected", MessageBoxButtons.OK, MessageBoxIcon.Warning, MessageBoxDefaultButton.Button1, MessageBoxOptions.DefaultDesktopOnly);
            if (newDirectorName != "" && oldDirectorName != "")
            {
                SqlConnection museumConn = new SqlConnection("Server=tcp:museum.database.windows.net,1433;Initial Catalog=MuseumDB;Persist Security Info=False;User ID=JeremyL;Password=BabyThing1;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");
                {
                    museumConn.Open();
                    SqlCommand update = new SqlCommand("museumSchema.ModifyDirector");
                    update.Connection = museumConn;
                    update.CommandType = System.Data.CommandType.StoredProcedure;
                    try
                    {
                        update.Parameters.AddWithValue("@oldDirectorName", oldDirectorName);
                        update.Parameters.AddWithValue("@newDirectorName", newDirectorName);
                        update.Parameters.AddWithValue("@newDayOfBirth", dateOfBirth);
                        update.Parameters.AddWithValue("@newDayOfDeath", dateOfDeath);
                        update.ExecuteNonQuery();
                        DirectorView.DataBind();
                    }
                    catch (SqlException)
                    {
                        MessageBox.Show("Error Occured, Possible cause: incorrect Data entry", "Error Occurred", MessageBoxButtons.OK, MessageBoxIcon.Warning, MessageBoxDefaultButton.Button1, MessageBoxOptions.DefaultDesktopOnly);
                    }

                }
            }
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            string directorName = DropDownList4.Text;
            if (directorName == "")
                MessageBox.Show("Please Insert at least director name", "No director Name detected", MessageBoxButtons.OK, MessageBoxIcon.Warning, MessageBoxDefaultButton.Button1, MessageBoxOptions.DefaultDesktopOnly);
            else
            {
                var selectedOption = MessageBox.Show("Are you sure you want to delete director " + directorName, "Confirm Deletion", MessageBoxButtons.YesNoCancel, MessageBoxIcon.Question, MessageBoxDefaultButton.Button2, MessageBoxOptions.DefaultDesktopOnly);
                if (selectedOption == DialogResult.Yes)
                {
                    SqlConnection museumConn = new SqlConnection("Server=tcp:museum.database.windows.net,1433;Initial Catalog=MuseumDB;Persist Security Info=False;User ID=JeremyL;Password=BabyThing1;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;");
                    {
                        museumConn.Open();
                        SqlCommand delete = new SqlCommand("museumSchema.DeleteDirector");
                        delete.Connection = museumConn;
                        delete.CommandType = System.Data.CommandType.StoredProcedure;
                        try
                        {
                            delete.Parameters.AddWithValue("@DirectorName", directorName);
                            delete.ExecuteNonQuery();
                            DirectorView.DataBind();
                        }
                        catch (SqlException)
                        {
                            MessageBox.Show("Error Occured, Possible cause: incorrect Data entry", "Error Occurred", MessageBoxButtons.OK, MessageBoxIcon.Warning, MessageBoxDefaultButton.Button1, MessageBoxOptions.DefaultDesktopOnly);
                        }
                    }
                }
                if (selectedOption == DialogResult.No)
                    MessageBox.Show("Deletion Aborted", "Deletion Aborted!", MessageBoxButtons.OK, MessageBoxIcon.Information, MessageBoxDefaultButton.Button1, MessageBoxOptions.DefaultDesktopOnly);


            }
        }
    }
}