 using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using TCILTrackDMA.DLL;
using System.Data;
using MySql.Data.MySqlClient;

/// <summary>
/// Summary description for Login
/// </summary>
public class clsLogin
{
    public DataTable VerifyUser(string UserNAme, string Password)
    {
        DataTable dtVehicleDetails = new DataTable();
        try
        {
            MySqlCommand cmd = new MySqlCommand();
            string query = "CALL Chk_DMATrack_Login ('" + UserNAme + "','" + Password + "')" ;
            MySqlDataReader sdr = SQLHelper.ExecuteReader(cmd, CommandType.Text, query);
            dtVehicleDetails.Load(sdr);
        }
        catch (Exception ex)
        {

        }
        return dtVehicleDetails;
    }

    public DataTable GetUserDetails(string userid)
    {
        DataTable dtUserDetails = new DataTable();
        try
        {
            MySqlCommand cmd = new MySqlCommand();
            string query = "CALL Chk_DMATrack_UserType ('" + userid + "')";
            MySqlDataReader sdr = SQLHelper.ExecuteReader(cmd, CommandType.Text, query);
            dtUserDetails.Load(sdr);
        }
        catch (Exception ex)
        {

        }
        return dtUserDetails;

    }

    public DataTable GetPreveliageDetails(string PreveliageID)
    {
        DataTable dtPreveliageDetails = new DataTable();
        try
        {
            MySqlCommand cmd = new MySqlCommand();
            string query = "SELECT *  FROM  acl.`acl_previlage` WHERE previlage_id =  '" + PreveliageID + "'  AND is_active = '1' ";
            MySqlDataReader sdr = SQLHelper.ExecuteReader(cmd, CommandType.Text, query);
            dtPreveliageDetails.Load(sdr);
        }
        catch (Exception ex)
        {

        }
        return dtPreveliageDetails;
    }
}