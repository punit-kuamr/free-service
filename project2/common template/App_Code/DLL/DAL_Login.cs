using System;
using System.Data;
using MySql.Data.MySqlClient;
using System.Configuration;

public class DAL_User
{
    MySqlConnection con;

    public DAL_User()
    {
        con = new MySqlConnection(
            ConfigurationManager.ConnectionStrings["connectStr"].ConnectionString);
    }

    public DataTable CheckLogin(string username, string password, string role)
    {
        MySqlDataAdapter da = new MySqlDataAdapter(
            "SELECT * FROM users WHERE username=@u AND password=@p AND role=@r", con);

        da.SelectCommand.Parameters.AddWithValue("@u", username);
        da.SelectCommand.Parameters.AddWithValue("@p", password);
        da.SelectCommand.Parameters.AddWithValue("@r", role);

        DataTable dt = new DataTable();

        da.Fill(dt);

        return dt;
    }
}