using System;
using System.Data;
using System.Web.UI.WebControls;
public partial class home : System.Web.UI.Page
{
    BAL_Home objBAL = new BAL_Home();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindStates();
        }
    }

    private void BindStates()
    {
        DataTable dt = objBAL.GetStates();

        ddlState.DataSource = dt;
        ddlState.DataTextField = "StateName";
        ddlState.DataValueField = "StateID";
        ddlState.DataBind();

        ddlState.Items.Insert(0, new ListItem("-- Select State --", ""));

    }
    // STATE

    protected void ddlState_SelectedIndexChanged(object sender, EventArgs e)
    {
        lblStateMessage.Visible = false;
        lblStateMessage.Text = "";

        if (ddlState.SelectedIndex == 0)
        {
            ddlDistrict.Items.Clear();
            ddlDistrict.Enabled = false;
            return;
        }

        string selectedState = ddlState.SelectedItem.Text.Trim();

        if (selectedState != "Rajasthan" &&
            selectedState != "Jharkhand")
        {
            lblStateMessage.Visible = true;
            lblStateMessage.Text =
                "Currently services are available only for Rajasthan and Jharkhand.";

            ddlDistrict.Items.Clear();
            ddlDistrict.Enabled = false;

            return;
        }

        ddlDistrict.Enabled = true;

        DataTable dt = objBAL.FetchDistrictsByState(
            Convert.ToInt32(ddlState.SelectedValue));

        ddlDistrict.DataSource = dt;
        ddlDistrict.DataTextField = "DistrictName";
        ddlDistrict.DataValueField = "DistrictID";
        ddlDistrict.DataBind();

        ddlDistrict.Items.Insert(0,
            new ListItem("Choose District", ""));
    }

    // DISTRICT

    protected void ddlDistrict_SelectedIndexChanged(object sender, EventArgs e)
    {
        // No Branch and Node dropdowns anymore.
        // Keep this method empty or use it if you want to perform some action.
    }

    // FETCH DETAILS BUTTON

    //protected void btnFetchDetails_Click(object sender, EventArgs e)
    //{
    //    pnlWorkspace.Visible = true;

    //    BindAssets();
    //    BindStaff();
    //    BindAssignments();
    //}

    protected void btnFetchDetails_Click(object sender, EventArgs e)
    {
        Response.Redirect("home1V1.aspx");
    }

    // BIND ASSETS

    private void BindAssets()
    {
        DataTable dt = objBAL.FetchAssets();

        gvAssets.DataSource = dt;
        gvAssets.DataBind();

        int it = dt.Select("Category='IT'").Length;
        int furniture = dt.Select("Category='Furniture'").Length;
        int electronic = dt.Select("Category='Electronic'").Length;

        litCountIT.Text = it.ToString();
        litCountFurniture.Text = furniture.ToString();
        litCountElectronics.Text = electronic.ToString();

        barIT.Style["width"] = (it * 20) + "%";
        barFur.Style["width"] = (furniture * 20) + "%";
        barElec.Style["width"] = (electronic * 20) + "%";

        lblChartIT.Text = it.ToString();
        lblChartFur.Text = furniture.ToString();
        lblChartElec.Text = electronic.ToString();
    }

    // BIND STAFF

    private void BindStaff()
    {
        DataTable dt = objBAL.FetchStaff();

        gvStaff.DataSource = dt;
        gvStaff.DataBind();

        barExecCost.Style["width"] = "70%";
        barTechCost.Style["width"] = "50%";

        lblChartExec.Text = "70%";
        lblChartTech.Text = "50%";
    }

    // BIND ASSIGNMENTS

    private void BindAssignments()
    {
        DataTable dt = objBAL.FetchAssignments();

        gvAssignments.DataSource = dt;
        gvAssignments.DataBind();
    }

    // REPORT DOWNLOAD

    protected void btnGenerateReport_Click(object sender, EventArgs e)
    {
        Response.Clear();
        Response.ContentType = "text/plain";
        Response.AddHeader("content-disposition", "attachment;filename=DaytonReport.txt");

        Response.Write("DAYTON NATURAL RESOURCES REPORT");
        Response.Write(Environment.NewLine);
        Response.Write("Generated On : " + DateTime.Now);

        Response.End();
    }
}