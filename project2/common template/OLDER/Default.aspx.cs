using TCILTrackDMA.Bll;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        qzload.Visible = false;
        if (!IsPostBack)
        {
            Bind_District();
            // // Get_Gps_Penalty();

            //string script = "$(document).ready(function () { $('[id*=btnSubmit]').click(); });";
            //ClientScript.RegisterStartupScript(this.GetType(), "load", script, true);

            //Bind_FortNight();
        }
    }

    private void Bind_District()
    {
        //ddlDistrict
        try
        {
            Common clsCommon = new Common();
            DataTable Dist = new DataTable();
            Dist = clsCommon.getdistrict();
            ddlDistrict.DataSource = Dist;
            ddlDistrict.DataTextField = "district_name";
            ddlDistrict.DataValueField = "district_id";
            ddlDistrict.DataBind();
        }
        catch (Exception ex)
        {
            ErrorHandler.ErrorsEntry(ex.ToString(), "Default.aspx || Bind_District()" + DateTime.Now, " " + Session["user_name"].ToString());

        }
    }


    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        

    }



    private void bindData(string id, string dist, String varFromDt, String varToDt)
    {

        Common clsCommon = new Common();
        DataTable dtData = new DataTable();

        dtData = clsCommon.getData_DMATrackDateWise(id, dist, varFromDt, varToDt);
        if (dtData.Rows.Count <= 0)
        {
            lblStatus.Text = "Data Not Available";
        }
        lblStatus.Text = "";
        grdData.DataSource = dtData;
        grdData.DataBind();
        ViewState["Data"] = dtData;
        qzload.Visible = false;
    }

    protected void grdData_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {

        grdData.PageIndex = e.NewPageIndex;
        //bindData(ddlfortNight.SelectedItem.Value.ToString(), ddlDistrict.SelectedItem.Value.ToString());
    }

    
    protected void btnBindData_Click(object sender, EventArgs e)
    {
        qzload.Visible = true;
        if (ddlDistrict.SelectedIndex < 0)
        {
            lblStatus.Text = "Please select District";
            return;
        }

        string varUserType = Session["user_type_id"].ToString();
        int id = 0;

        switch (varUserType)
        {
            case "0":
                id = 0;
                break;
            case "10":
                id = 10;
                break;
            case "108":
                id = 108;
                break;
            case "104":
                id = 104;
                break;
            default:
                break;
        }


        // dvLoader.Visible = true;
        // lblStatus.Text = "Submit Clicked ";
        Common clsCommon = new Common();
        String varFromDate = txtFromDate.Text;
        String varToDate = txtToDate.Text;
        
        lblid.Text = id.ToString();

       // string id = ddlfortNight.SelectedItem.Value.ToString();
        string dist = ddlDistrict.SelectedItem.Value.ToString();
        bindData(id.ToString(), dist, varFromDate, varToDate);
    }


    public void Show(string message)
    {
        ScriptManager.RegisterStartupScript(this, GetType(), "msg", "alert('" + message + "');", true);
    }

    protected void btnExport_Click(object sender, EventArgs e)
    {
        try
        {
            qzload.Visible = true;
            Response.Clear();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", "attachment;filename=" + "Data" + DateTime.Now.ToString("dd_MM_yyyy_HHmmss") + ".xls");
            // Response.ContentType = "application/ms-excel";
            Response.Charset = "UTF-8";
            Response.ContentType = "application/vnd.xlsx";
            StringWriter sw = new StringWriter();
            HtmlTextWriter htw = new HtmlTextWriter(sw);
            DataTable data = new DataTable();
            data = (DataTable)ViewState["Data"];
            grdDatadummy.DataSource = data;
            grdDatadummy.DataBind();
            //grddummyExport.Visible = false;
            grdDatadummy.RenderControl(htw);
            // Panel1.RenderControl(htw);
            Response.Write(sw.ToString());
            Response.End();
            qzload.Visible = false;
        }
        catch (Exception ex)
        {

        }

    }
    public override void VerifyRenderingInServerForm(Control control)
    {
        //base.VerifyRenderingInServerForm(control);
    }



}