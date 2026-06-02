using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        if (txtPassword.Text == "" || txtloginemail.Text == "")
        {
            lblError.Text = "Please Enter Valid Credentials";
            return;
        }
        clsLogin clsLogin = new clsLogin();

        DataTable dtLogin = new DataTable();

        dtLogin = clsLogin.VerifyUser(txtloginemail.Text, txtPassword.Text);

        if (dtLogin.Rows.Count <= 0)
        {
            lblError.Text = "Please Enter Valid Credentials";
            return;
        }


        if (dtLogin.Rows[0]["user_type_id"].ToString() == "0" || dtLogin.Rows[0]["user_type_id"].ToString() == "10" || dtLogin.Rows[0]["user_type_id"].ToString() == "108" || dtLogin.Rows[0]["user_type_id"].ToString() == "104")
        {
          //  Session["Penalty"] = dtLogin;
            Session["user_name"] = dtLogin.Rows[0]["email"];
            Session["user_type_id"] = dtLogin.Rows[0]["user_type_id"];
            Response.Redirect("Default.aspx");
        }

    }
}