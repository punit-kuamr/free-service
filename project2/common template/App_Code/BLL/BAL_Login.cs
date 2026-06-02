using System;
using System.Data;

public class BAL_User
{
    DAL_User dal = new DAL_User();

    public bool Login(string username, string password, string role)
    {
        DataTable dt = dal.CheckLogin(username, password, role);

        return dt.Rows.Count > 0;
    }
}