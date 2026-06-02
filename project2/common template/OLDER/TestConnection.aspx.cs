using System;
using System.Configuration;
using MySql.Data.MySqlClient;

public partial class TestConnection : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        TestDBConnection();
    }

    private void TestDBConnection()
    {
        string connStr = ConfigurationManager.ConnectionStrings["connectStr"].ConnectionString;

        using (MySqlConnection conn = new MySqlConnection(connStr))
        {
            try
            {
                conn.Open();
                lblStatus.Text = "✅ Connection Successful!";
                lblStatus.ForeColor = System.Drawing.Color.Green;
            }
            catch (Exception ex)
            {
                lblStatus.Text = "❌ Connection Failed: " + ex.Message;
                lblStatus.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}