using TCILTrackDMA.DLL;
using System.Data;
using MySql.Data.MySqlClient;
using System;
using System.Net;
using System.Net.Sockets;

namespace TCILTrackDMA.Bll
{
    public class Common : SQLHelper
    {

        public DataTable getData_DMATrackDateWise(string id, string dist, String varFromDate, String varToDt)
        {
            DataTable dtDMA_TrackDetails = new DataTable();
            try
            {
                // String lvarDt = 
                String[] varDt = varFromDate.Split('/');
                varFromDate = varDt[2] + "-" + varDt[0] + "-" + varDt[1];
                varDt = varToDt.Split('/');
                varToDt = varDt[2] + "-" + varDt[0] + "-" + varDt[1];

                MySqlCommand cmd = new MySqlCommand();
                string query = "CALL Get_daily_dma_rep_VendorWise (" + id + "," + dist + ",'" + varFromDate + "','" + varToDt + "')";
                MySqlDataReader sdr = SQLHelper.ExecuteReader(cmd, CommandType.Text, query);
                dtDMA_TrackDetails.Load(sdr);

            }
            catch (Exception ex)
            {
                //Do Log
            }
            return dtDMA_TrackDetails;
        }


 
        public DataTable getdistrict()
        {
            DataTable dtVehicleDetails = new DataTable();
            try
            {

                MySqlCommand cmd = new MySqlCommand();
                string query = "CALL get_Veh_District()";
                MySqlDataReader sdr = SQLHelper.ExecuteReader(cmd, CommandType.Text, query);
                dtVehicleDetails.Load(sdr);

            }
            catch(Exception ex)
            {
                //Do Log
            }
            return dtVehicleDetails;
        }

       
        public static string GetLocalIPAddress()
        {
            var host = Dns.GetHostEntry(Dns.GetHostName());
            foreach (var ip in host.AddressList)
            {
                if (ip.AddressFamily == AddressFamily.InterNetwork)
                {
                    return ip.ToString();
                }
            }
            ErrorHandler.ErrorsEntry(host.ToString(), "GetIPAddress~Exception", "000000");
            return "000.000.000.000";

        }

      
    }

}