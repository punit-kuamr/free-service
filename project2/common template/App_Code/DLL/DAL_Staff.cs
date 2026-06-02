using System;
using System.Data;
using MySql.Data.MySqlClient;
using System.Configuration;

public class DAL_Staff
{
    MySqlConnection con;

    public DAL_Staff()
    {
        con = new MySqlConnection(
            ConfigurationManager.ConnectionStrings["connectStr"].ConnectionString);
    }

    // TOTAL ASSETS
    public int GetMyAssets(string staff)
    {
        con.Open();
        MySqlCommand cmd = new MySqlCommand(
            "SELECT COUNT(*) FROM staff_assets WHERE staff_name=@s", con);
        cmd.Parameters.AddWithValue("@s", staff);

        int count = Convert.ToInt32(cmd.ExecuteScalar());
        con.Close();
        return count;
    }

    // TOTAL REPORTS (example logic)
    public int GetReports()
    {
        con.Open();
        MySqlCommand cmd = new MySqlCommand(
            "SELECT COUNT(*) FROM staff_assets", con);

        int count = Convert.ToInt32(cmd.ExecuteScalar());
        con.Close();
        return count;
    }

    // LOAD STAFF ASSETS
    public DataTable GetStaffAssets(string staff)
    {
        MySqlDataAdapter da = new MySqlDataAdapter(
            "SELECT asset_name, category, assigned_date, status FROM staff_assets WHERE staff_name=@s", con);

        da.SelectCommand.Parameters.AddWithValue("@s", staff);

        DataTable dt = new DataTable();
        da.Fill(dt);
        return dt;
    }

    // SEARCH
    public DataTable Search(string keyword)
    {
        MySqlDataAdapter da = new MySqlDataAdapter(
            "SELECT * FROM staff_assets WHERE asset_name LIKE @k OR category LIKE @k", con);

        da.SelectCommand.Parameters.AddWithValue("@k", "%" + keyword + "%");

        DataTable dt = new DataTable();
        da.Fill(dt);
        return dt;
    }
}