using System;

public partial class LOGINPAGE : System.Web.UI.Page
{
    BAL_User bal = new BAL_User();

    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        string role = ddlRole.SelectedValue;
        string username = txtUsername.Text.Trim();
        string password = txtPassword.Text.Trim();

        string serverCaptcha = hdnServerCaptcha.Value;
        string userCaptcha = txtCaptchaInput.Text.Trim();

        // CAPTCHA CHECK
        if (serverCaptcha != userCaptcha)
        {
            lblMessage.Text = "Invalid CAPTCHA";
            return;
        }

        bool check = bal.Login(username, password, role);

        if (check == true)
        {
            Session["user"] = username;
            Session["role"] = role;

            if (role == "Admin")
            {
                Response.Redirect("admin.aspx");
            }
            else if (role == "Manager")
            {
                Response.Redirect("home.aspx");
            }
            else
            {
                Response.Redirect("staff.aspx");
            }
        }
        else
        {
            lblMessage.Text = "Invalid Username or Password";
        }
    }
}