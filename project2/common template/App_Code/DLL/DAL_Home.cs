using System;
using System.Data;
using MySql.Data.MySqlClient;
using System.Configuration;

public class DAL_Home
{
    string conStr = ConfigurationManager.ConnectionStrings["connectStr"].ConnectionString;

    // STATES
    public DataTable GetStates()
    {
        MySqlConnection con = new MySqlConnection(conStr);

        MySqlDataAdapter da =
            new MySqlDataAdapter("SP_GetStates", con);

        da.SelectCommand.CommandType = CommandType.StoredProcedure;

        DataTable dt = new DataTable();

        da.Fill(dt);

        return dt;
    }

    // DISTRICTS
    public DataTable GetDistrictsByState(int StateID)
    {
        MySqlConnection con = new MySqlConnection(conStr);
        MySqlDataAdapter da = new MySqlDataAdapter("SP_GetDistrictsByState", con);

        da.SelectCommand.CommandType = CommandType.StoredProcedure;

        da.SelectCommand.Parameters.AddWithValue("@p_StateID", StateID);

        DataTable dt = new DataTable();

        da.Fill(dt);

        return dt;



    }

    // PINCODES
    public DataTable GetPincodes(int districtID)
    {
        MySqlConnection con = new MySqlConnection(conStr);

        string query = "SELECT Pincode FROM Pincodes WHERE DistrictID=@DistrictID";

        MySqlDataAdapter da = new MySqlDataAdapter(query, con);

        da.SelectCommand.Parameters.AddWithValue("@DistrictID", districtID);

        DataTable dt = new DataTable();

        da.Fill(dt);

        return dt;
    }

    // BRANCHES
    public DataTable GetBranches(string pincode)
    {
        MySqlConnection con = new MySqlConnection(conStr);

        string query = "SELECT BranchID,BranchName FROM Branches WHERE Pincode=@Pincode";

        MySqlDataAdapter da = new MySqlDataAdapter(query, con);

        da.SelectCommand.Parameters.AddWithValue("@Pincode", pincode);

        DataTable dt = new DataTable();

        da.Fill(dt);

        return dt;
    }

    // ASSETS
    public DataTable GetAssets()
    {
        MySqlConnection con = new MySqlConnection(conStr);

        string query = "SELECT * FROM Assets";

        MySqlDataAdapter da = new MySqlDataAdapter(query, con);

        DataTable dt = new DataTable();

        da.Fill(dt);

        return dt;
    }

    // STAFF
    public DataTable GetStaff()
    {
        MySqlConnection con = new MySqlConnection(conStr);

        string query = "SELECT * FROM Staff";

        MySqlDataAdapter da = new MySqlDataAdapter(query, con);

        DataTable dt = new DataTable();

        da.Fill(dt);

        return dt;
    }

    // ASSIGNMENTS
    public DataTable GetAssignments()
    {
        MySqlConnection con = new MySqlConnection(conStr);

        string query = "SELECT * FROM Assignments";

        MySqlDataAdapter da = new MySqlDataAdapter(query, con);

        DataTable dt = new DataTable();

        da.Fill(dt);

        return dt;
    }

    // OFFICE + GROUP ASSETS
    public DataTable GetAssetsByOfficeAndGroup(int officeId, string groupName)
    {
        MySqlConnection con = new MySqlConnection(conStr);

        MySqlDataAdapter da =
            new MySqlDataAdapter("SP_GetAssets", con);

        da.SelectCommand.CommandType = CommandType.StoredProcedure;

        da.SelectCommand.Parameters.AddWithValue("@p_OfficeID", officeId);
        da.SelectCommand.Parameters.AddWithValue("@p_GroupName", groupName);

        DataTable dt = new DataTable();

        da.Fill(dt);

        return dt;
    }

    // ✅ FIX: MISSING METHOD ADDED (MAIN ERROR SOLVED)
    public void InsertAsset(string item, int qty, string status, string remark, int officeId, string group)
    {
        MySqlConnection con = new MySqlConnection(conStr);

        MySqlCommand cmd = new MySqlCommand("SP_InsertAsset", con);
        cmd.CommandType = CommandType.StoredProcedure;

        cmd.Parameters.AddWithValue("@p_ItemName", item);
        cmd.Parameters.AddWithValue("@p_Quantity", qty);
        cmd.Parameters.AddWithValue("@p_Status", status);
        cmd.Parameters.AddWithValue("@p_Remark", remark);
        cmd.Parameters.AddWithValue("@p_OfficeID", officeId);
        cmd.Parameters.AddWithValue("@p_GroupName", group);

        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }
    public void UpdateAsset(
    int id,
    string itemName,
    int qty,
    string status,
    string group)
    {
        MySqlConnection con = new MySqlConnection(conStr);

        MySqlCommand cmd =
            new MySqlCommand("SP_UpdateAsset", con);

        cmd.CommandType = CommandType.StoredProcedure;

        cmd.Parameters.AddWithValue("@p_ID", id);
        cmd.Parameters.AddWithValue("@p_ItemName", itemName);
        cmd.Parameters.AddWithValue("@p_Quantity", qty);
        cmd.Parameters.AddWithValue("@p_Status", status);
        cmd.Parameters.AddWithValue("@p_GroupName", group);

        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }

    public void DeleteAsset(
        int id,
        string group)
    {
        MySqlConnection con = new MySqlConnection(conStr);

        MySqlCommand cmd =
            new MySqlCommand("SP_DeleteAsset", con);

        cmd.CommandType = CommandType.StoredProcedure;

        cmd.Parameters.AddWithValue("@p_ID", id);
        cmd.Parameters.AddWithValue("@p_GroupName", group);

        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
    }
}