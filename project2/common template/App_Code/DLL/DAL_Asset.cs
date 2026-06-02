using System;
using System.Configuration;
using System.Data;
using MySql.Data.MySqlClient;

public class DAL_Asset
{
    string connStr = ConfigurationManager.ConnectionStrings["connectStr"].ConnectionString;

    // =========================
    // GET ALL ASSETS
    // =========================
    public DataTable GetAssets()
    {
        DataTable dt = new DataTable();

        using (MySqlConnection con = new MySqlConnection(connStr))
        {
            string query = "SELECT * FROM assets";

            using (MySqlCommand cmd = new MySqlCommand(query, con))
            {
                using (MySqlDataAdapter da = new MySqlDataAdapter(cmd))
                {
                    da.Fill(dt);
                }
            }
        }

        return dt;
    }

    // =========================
    // INSERT ASSET
    // =========================
    public int InsertAsset(string assetID, string assetName, string category, string status)
    {
        using (MySqlConnection con = new MySqlConnection(connStr))
        {
            string query = @"INSERT INTO assets
                            (AssetID, AssetName, Category, Status)
                            VALUES
                            (@AssetID, @AssetName, @Category, @Status)";

            using (MySqlCommand cmd = new MySqlCommand(query, con))
            {
                cmd.Parameters.AddWithValue("@AssetID", assetID);
                cmd.Parameters.AddWithValue("@AssetName", assetName);
                cmd.Parameters.AddWithValue("@Category", category);
                cmd.Parameters.AddWithValue("@Status", status);

                con.Open();
                return cmd.ExecuteNonQuery();
            }
        }
    }

    // =========================
    // UPDATE ASSET
    // =========================
    public int UpdateAsset(string assetID, string assetName, string category, string status)
    {
        using (MySqlConnection con = new MySqlConnection(connStr))
        {
            string query = @"UPDATE assets
                             SET AssetName=@AssetName,
                                 Category=@Category,
                                 Status=@Status
                             WHERE AssetID=@AssetID";

            using (MySqlCommand cmd = new MySqlCommand(query, con))
            {
                cmd.Parameters.AddWithValue("@AssetID", assetID);
                cmd.Parameters.AddWithValue("@AssetName", assetName);
                cmd.Parameters.AddWithValue("@Category", category);
                cmd.Parameters.AddWithValue("@Status", status);

                con.Open();
                return cmd.ExecuteNonQuery();
            }
        }
    }

    // =========================
    // DELETE ASSET
    // =========================
    public int DeleteAsset(string assetID)
    {
        using (MySqlConnection con = new MySqlConnection(connStr))
        {
            string query = "DELETE FROM assets WHERE AssetID=@AssetID";

            using (MySqlCommand cmd = new MySqlCommand(query, con))
            {
                cmd.Parameters.AddWithValue("@AssetID", assetID);

                con.Open();
                return cmd.ExecuteNonQuery();
            }
        }
    }

    // =========================
    // STAFF DATA
    // =========================
    public DataTable GetStaff()
    {
        DataTable dt = new DataTable();

        using (MySqlConnection con = new MySqlConnection(connStr))
        {
            string query = "SELECT * FROM staff";

            using (MySqlCommand cmd = new MySqlCommand(query, con))
            {
                using (MySqlDataAdapter da = new MySqlDataAdapter(cmd))
                {
                    da.Fill(dt);
                }
            }
        }

        return dt;
    }
}