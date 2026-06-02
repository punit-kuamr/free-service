using System;
using System.Data;
using System.Web.UI.WebControls;

public partial class staff : System.Web.UI.Page
{
    BAL_Staff bal = new BAL_Staff();

    string staffName = "John"; // you can replace with login session

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadDashboard();
            LoadGrid();
        }
    }

    // LOAD CARDS
    private void LoadDashboard()
    {
        lblMyAssets.Text = bal.MyAssets(staffName).ToString();
        lblReports.Text = bal.Reports().ToString();
    }

    // LOAD TABLE DATA
    private void LoadGrid()
    {
        DataTable dt = bal.LoadAssets(staffName);

        if (dt.Rows.Count > 0)
        {
            // You can bind to GridView (recommended)
            // For now static table, so just example logic
        }
    }

    // SEARCH
    protected void txtSearch_TextChanged(object sender, EventArgs e)
    {
        DataTable dt = bal.Search(txtSearch.Text);

        // bind to GridView if added
    }

    // BUTTONS
    protected void btnViewReport_Click(object sender, EventArgs e)
    {
        Response.Redirect("reports.aspx");
    }

    protected void btnFindAsset_Click(object sender, EventArgs e)
    {
        DataTable dt = bal.Search(txtSearch.Text);

        // later bind to grid or show results
    }
}