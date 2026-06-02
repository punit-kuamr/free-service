using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admim : System.Web.UI.Page
{
    BAL_Asset bal = new BAL_Asset();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadAssets();
            LoadStaff();
        }
    }

    // =========================
    // LOAD ASSETS
    // =========================
    public void LoadAssets()
    {
        DataTable dt = bal.GetAssets();

        gvAssets.DataSource = dt;
        gvAssets.DataBind();

        int it = 0;
        int fur = 0;
        int elec = 0;

        foreach (DataRow row in dt.Rows)
        {
            string cat = row["Category"].ToString();

            if (cat == "IT")
                it++;

            else if (cat == "Furniture")
                fur++;

            else if (cat == "Electronic")
                elec++;
        }

        litCountIT.Text = it.ToString();
        litCountFurniture.Text = fur.ToString();
        litCountElectronics.Text = elec.ToString();

        lblChartIT.Text = it.ToString();
        lblChartFur.Text = fur.ToString();
        lblChartElec.Text = elec.ToString();

        barIT.Style["width"] = (it * 20) + "px";
        barFur.Style["width"] = (fur * 20) + "px";
        barElec.Style["width"] = (elec * 20) + "px";
    }

    // =========================
    // LOAD STAFF
    // =========================
    public void LoadStaff()
    {
        gvStaff.DataSource = bal.GetStaff();
        gvStaff.DataBind();
    }

    // =========================
    // INSERT ASSET
    // =========================
    protected void btnInsertAsset_Click(object sender, EventArgs e)
    {
        bal.InsertAsset(
            txtNewAssetID.Text,
            txtNewAssetName.Text,
            ddlNewAssetCategory.SelectedValue,
            txtNewAssetStatus.Text
        );

        ClearAssetFields();
        LoadAssets();
    }

    // =========================
    // EDIT
    // =========================
    protected void gvAssets_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gvAssets.EditIndex = e.NewEditIndex;
        LoadAssets();
    }

    // =========================
    // CANCEL
    // =========================
    protected void gvAssets_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gvAssets.EditIndex = -1;
        LoadAssets();
    }

    // =========================
    // UPDATE
    // =========================
    protected void gvAssets_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        string assetID = gvAssets.DataKeys[e.RowIndex].Value.ToString();

        TextBox txtAssetName =
            (TextBox)gvAssets.Rows[e.RowIndex].FindControl("txtAssetName");

        DropDownList ddlCategory =
            (DropDownList)gvAssets.Rows[e.RowIndex].FindControl("ddlCategory");

        TextBox txtStatus =
            (TextBox)gvAssets.Rows[e.RowIndex].FindControl("txtStatus");

        bal.UpdateAsset(
            assetID,
            txtAssetName.Text,
            ddlCategory.SelectedValue,
            txtStatus.Text
        );

        gvAssets.EditIndex = -1;
        LoadAssets();
    }

    // =========================
    // DELETE
    // =========================
    protected void gvAssets_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string assetID = gvAssets.DataKeys[e.RowIndex].Value.ToString();

        bal.DeleteAsset(assetID);

        LoadAssets();
    }

    // =========================
    // CLEAR
    // =========================
    public void ClearAssetFields()
    {
        txtNewAssetID.Text = "";
        txtNewAssetName.Text = "";
        txtNewAssetStatus.Text = "";
    }

    // =========================
    // DROPDOWN EVENTS
    // =========================
    protected void ddlState_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlDistrict.Enabled = true;

        ddlDistrict.Items.Clear();

        ddlDistrict.Items.Add("Choose Dynamic Center");

        if (ddlState.SelectedValue == "RJ")
        {
            ddlDistrict.Items.Add("Jaipur");
            ddlDistrict.Items.Add("Jodhpur");
        }
        else if (ddlState.SelectedValue == "DL")
        {
            ddlDistrict.Items.Add("New Delhi");
        }
    }

    protected void ddlDistrict_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlSubDistrict.Enabled = true;

        ddlSubDistrict.Items.Clear();

        ddlSubDistrict.Items.Add("Pincode gateway");
        ddlSubDistrict.Items.Add("302001");
        ddlSubDistrict.Items.Add("342001");
    }

    protected void ddlSubDistrict_SelectedIndexChanged(object sender, EventArgs e)
    {
        ddlBranch.Enabled = true;

        ddlBranch.Items.Clear();

        ddlBranch.Items.Add("Pincode Router");
        ddlBranch.Items.Add("Corporate Branch");
        ddlBranch.Items.Add("Regional Branch");

        pnlWorkspace.Visible = true;
    }

    protected void btnFetchDetails_Click(object sender, EventArgs e)
    {
        pnlWorkspace.Visible = true;
    }
}