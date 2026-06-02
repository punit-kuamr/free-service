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
        if (Session["role"] != null)
        {
            lblRole.Text = Session["role"].ToString();

            string role = Session["role"].ToString();

            if (role != "Admin")
            {
                gvAssets.Columns[5].Visible = false;
            }
        }
    }
}

    // ✅ SINGLE btnSubmit_Click (merged logic)
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        int officeId = Convert.ToInt32(ddlOffice.SelectedValue);
        string group = ddlGroup.SelectedValue;

        // set dynamic title
        if (group == "IT")
            litInsertTitle.Text = "Insert in IT";
        else if (group == "Furniture")
            litInsertTitle.Text = "Insert in Furniture";
        else if (group == "Electronics")
            litInsertTitle.Text = "Insert in Electronics";
        else
            litInsertTitle.Text = "Insert Asset";

        // fetch data
        DataTable dt = objBAL.GetAssetsByOfficeAndGroup(
            officeId,
            group
        );

        gvAssets.DataSource = dt;
        gvAssets.DataBind();
    }

    // insert function
    protected void btnInsert_Click(object sender, EventArgs e)
    {
        string item = txtItemName.Text.Trim();
        int qty = Convert.ToInt32(txtQuantity.Text);
        string status = ddlStatus.SelectedValue;
        string remark = txtRemark.Text.Trim();
        int officeId = Convert.ToInt32(ddlOffice.SelectedValue);
        string group = ddlGroup.SelectedValue;

        objBAL.InsertAsset(item, qty, status,remark, officeId,group);

        // refresh grid after insert
        btnSubmit_Click(sender, e);
    }
    protected void gvAssets_RowEditing(object sender,
    GridViewEditEventArgs e)
    {
        gvAssets.EditIndex = e.NewEditIndex;

        btnSubmit_Click(null, null);
    }

    protected void gvAssets_RowCancelingEdit(object sender,
        GridViewCancelEditEventArgs e)
    {
        gvAssets.EditIndex = -1;

        btnSubmit_Click(null, null);
    }

    protected void gvAssets_RowUpdating(object sender,
        GridViewUpdateEventArgs e)
    {
        int id = Convert.ToInt32(
            gvAssets.DataKeys[e.RowIndex].Value);

        GridViewRow row = gvAssets.Rows[e.RowIndex];

        string itemName =
            ((TextBox)row.Cells[1].Controls[0]).Text;

        int qty =
            Convert.ToInt32(
            ((TextBox)row.Cells[2].Controls[0]).Text);

        string status =
            ((TextBox)row.Cells[3].Controls[0]).Text;

        string group = ddlGroup.SelectedValue;

        objBAL.UpdateAsset(
            id,
            itemName,
            qty,
            status,
            group);

        gvAssets.EditIndex = -1;

        btnSubmit_Click(null, null);
    }

    protected void gvAssets_RowDeleting(object sender,
        GridViewDeleteEventArgs e)
    {
        int id = Convert.ToInt32(
            gvAssets.DataKeys[e.RowIndex].Value);

        string group = ddlGroup.SelectedValue;

        objBAL.DeleteAsset(id, group);

        btnSubmit_Click(null, null);
    }
}