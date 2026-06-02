using System;
using System.Data;

public partial class home : System.Web.UI.Page
{
    BAL_Home objBAL = new BAL_Home();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadGatewayDefaults();
        }
    }

    // ---------------------------
    // INITIAL LOAD (optional)
    // ---------------------------
    private void LoadGatewayDefaults()
    {
        ddlDistrict.Enabled = false;
        ddlSubDistrict.Enabled = false;
        ddlBranch.Enabled = false;
    }

    // ---------------------------
    // GATEWAY → DISTRICT
    // ---------------------------
    protected void ddlState_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlDistrict.Items.Clear();
        ddlSubDistrict.Items.Clear();
        ddlBranch.Items.Clear();

        ddlDistrict.Enabled = true;

        if (ddlState.SelectedValue == "AP")
        {
            ddlDistrict.Items.Add(new System.Web.UI.WebControls.ListItem("Visakhapatnam Hub", "VSK"));
            ddlDistrict.Items.Add(new System.Web.UI.WebControls.ListItem("Vijayawada Hub", "VJW"));
        }
        else if (ddlState.SelectedValue == "DL")
        {
            ddlDistrict.Items.Add(new System.Web.UI.WebControls.ListItem("Central Delhi", "CD"));
            ddlDistrict.Items.Add(new System.Web.UI.WebControls.ListItem("South Delhi", "SD"));
        }
        else if (ddlState.SelectedValue == "RJ")
        {
            ddlDistrict.Items.Add(new System.Web.UI.WebControls.ListItem("Jaipur Hub", "JP"));
            ddlDistrict.Items.Add(new System.Web.UI.WebControls.ListItem("Jodhpur Hub", "JOD"));
        }
    }

    // ---------------------------
    // DISTRICT → SUBDISTRICT
    // ---------------------------
    protected void ddlDistrict_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlSubDistrict.Items.Clear();
        ddlBranch.Items.Clear();

        ddlSubDistrict.Enabled = true;

        ddlSubDistrict.Items.Add(new System.Web.UI.WebControls.ListItem("Zone A Routing", "Z1"));
        ddlSubDistrict.Items.Add(new System.Web.UI.WebControls.ListItem("Zone B Routing", "Z2"));
    }

    // ---------------------------
    // SUBDISTRICT → BRANCH
    // ---------------------------
    protected void ddlSubDistrict_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlBranch.Items.Clear();

        ddlBranch.Enabled = true;

        ddlBranch.Items.Add(new System.Web.UI.WebControls.ListItem("Core Node A", "C1"));
        ddlBranch.Items.Add(new System.Web.UI.WebControls.ListItem("Core Node B", "C2"));
    }

    // ---------------------------
    // MAIN FETCH BUTTON
    // ---------------------------
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string gateway = ddlState.SelectedValue;
        string district = ddlDistrict.SelectedValue;
        string subDistrict = ddlSubDistrict.SelectedValue;
        string branch = ddlBranch.SelectedValue;
        string pincode = txtPinCode.Text;

        // if PIN code used → override routing
        if (!string.IsNullOrEmpty(pincode))
        {
            gateway = "PIN";
        }

        DataTable dt = objBAL.GetAssetsByGatewayRouting(
            gateway,
            district,
            subDistrict,
            branch,
            pincode
        );

        gvAssets.DataSource = dt;
        gvAssets.DataBind();
    }
}