using System;
using System.Data;
using System.IO;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class home : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // Initial configurations
        }
    }

    protected void ddlState_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(ddlState.SelectedValue))
        {
            ddlDistrict.Enabled = true;
            ddlDistrict.Items.Clear();
            ddlDistrict.Items.Add(new ListItem("Primary Node Alpha", "N1"));
            ddlDistrict.Items.Add(new ListItem("Secondary Grid Beta", "N2"));
        }
        else
        {
            ResetDropdowns();
        }
    }

    protected void ddlDistrict_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(ddlDistrict.SelectedValue))
        {
            ddlSubDistrict.Enabled = true;
            ddlSubDistrict.Items.Clear();
            ddlSubDistrict.Items.Add(new ListItem("Router Zone 401", "Z1"));
            ddlSubDistrict.Items.Add(new ListItem("Router Zone 402", "Z2"));
        }
    }

    protected void ddlSubDistrict_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(ddlSubDistrict.SelectedValue))
        {
            ddlBranch.Enabled = true;
            ddlBranch.Items.Clear();
            ddlBranch.Items.Add(new ListItem("Terminal Core A", "C1"));
            ddlBranch.Items.Add(new ListItem("Terminal Core B", "C2"));
        }
    }

    private void ResetDropdowns()
    {
        ddlDistrict.Enabled = false;
        ddlSubDistrict.Enabled = false;
        ddlBranch.Enabled = false;
    }

    // --- WORKSPACE CORE TRIGGER ACTION ---
    protected void btnFetchDetails_Click(object sender, EventArgs e)
    {
        // 1. Surface Workspace Block Container Elements Visible
        pnlWorkspace.Visible = true;

        // 2. Fetch Mock Information Indices
        LoadAssetsData();
        LoadStaffData();
        LoadAssignmentsData();

        // 3. Command browser viewport to slide fluidly into workspace area focusing
        ExecuteScrollFocusScript();
    }

    private void LoadAssetsData()
    {
        DataTable dt = new DataTable();
        dt.Columns.Add("AssetID", typeof(string));
        dt.Columns.Add("AssetName", typeof(string));
        dt.Columns.Add("Category", typeof(string));
        dt.Columns.Add("Status", typeof(string));

        // Sample Data Rows
        dt.Rows.Add("EQ-IT-099", "Dell OptiPlex Desktop PC Matrix", "IT", "Assigned Operational");
        dt.Rows.Add("EQ-IT-104", "HP Laserjet Multi-Queue Pro Printer", "IT", "Standby Status");
        dt.Rows.Add("EQ-FN-441", "Ergonomic Mesh Support Task Chair", "Furniture", "Allocated");
        dt.Rows.Add("EQ-FN-202", "Modular Composite Desk Board (6x3)", "Furniture", "Allocated");
        dt.Rows.Add("EQ-EL-710", "Havells Heavy Duty Cooling Ceiling Fan", "Electronic", "Active Mount");
        dt.Rows.Add("EQ-EL-055", "Voltas Eco-Split 1.5 Ton AC Unit", "Electronic", "Maintenance Queue");
        dt.Rows.Add("EQ-EL-112", "Blue Star Industrial Water Cooler Hub", "Electronic", "Active Mount");

        gvAssets.DataSource = dt;
        gvAssets.DataBind();

        // Aggregate Math Operations
        int itCount = 0, furCount = 0, elecCount = 0;
        foreach (DataRow row in dt.Rows)
        {
            string cat = row["Category"].ToString();
            if (cat == "IT") itCount++;
            else if (cat == "Furniture") furCount++;
            else if (cat == "Electronic") elecCount++;
        }

        litCountIT.Text = itCount.ToString();
        litCountFurniture.Text = furCount.ToString();
        litCountElectronics.Text = elecCount.ToString();

        // Vector Chart Width Assignment Rendering Engine
        int maxItems = Math.Max(itCount, Math.Max(furCount, elecCount));
        if (maxItems > 0)
        {
            barIT.Style["width"] = ((double)itCount / maxItems * 100) + "%";
            barFur.Style["width"] = ((double)furCount / maxItems * 100) + "%";
            barElec.Style["width"] = ((double)elecCount / maxItems * 100) + "%";
        }

        lblChartIT.Text = itCount.ToString();
        lblChartFur.Text = furCount.ToString();
        lblChartElec.Text = elecCount.ToString();
    }

    private void LoadStaffData()
    {
        DataTable dt = new DataTable();
        dt.Columns.Add("StaffID", typeof(string));
        dt.Columns.Add("StaffName", typeof(string));
        dt.Columns.Add("Post", typeof(string));
        dt.Columns.Add("JoiningDate", typeof(DateTime));
        dt.Columns.Add("Salary", typeof(double));

        dt.Rows.Add("DN-ST-01", "Aarav Sharma", "Senior Network Architect", new DateTime(2021, 04, 12), 85000.00);
        dt.Rows.Add("DN-ST-02", "Priya Patel", "Operations Control Manager", new DateTime(2022, 09, 18), 72000.00);
        dt.Rows.Add("DN-ST-03", "Rohan Das", "Helpdesk Technical Engineer", new DateTime(2024, 02, 01), 38000.00);

        gvStaff.DataSource = dt;
        gvStaff.DataBind();

        // Remuneration Cost Proportional Share Logic computations
        double totalSalary = 195000.00; // Combined sum of entries above
        double execShare = ((85000.00 + 72000.00) / totalSalary) * 100;
        double techShare = (38000.00 / totalSalary) * 100;

        barExecCost.Style["width"] = execShare.ToString("0") + "%";
        barTechCost.Style["width"] = techShare.ToString("0") + "%";

        lblChartExec.Text = execShare.ToString("0") + "%";
        lblChartTech.Text = techShare.ToString("0") + "%";
    }

    private void LoadAssignmentsData()
    {
        DataTable dt = new DataTable();
        dt.Columns.Add("AssetTag", typeof(string));
        dt.Columns.Add("AssetName", typeof(string));
        dt.Columns.Add("AssignedTo", typeof(string));
        dt.Columns.Add("Role", typeof(string));
        dt.Columns.Add("HandoverDate", typeof(DateTime));

        dt.Rows.Add("EQ-IT-099", "Dell OptiPlex Desktop PC Matrix", "Aarav Sharma", "Senior Network Architect", new DateTime(2021, 04, 15));
        dt.Rows.Add("EQ-FN-441", "Ergonomic Mesh Support Task Chair", "Priya Patel", "Operations Control Manager", new DateTime(2022, 09, 20));
        dt.Rows.Add("EQ-IT-104", "HP Laserjet Multi-Queue Pro Printer", "Rohan Das", "Helpdesk Technical Engineer", new DateTime(2024, 02, 05));

        gvAssignments.DataSource = dt;
        gvAssignments.DataBind();
    }

    private void ExecuteScrollFocusScript()
    {
        string js = @"setTimeout(function() { 
            var target = document.getElementById('intelWorkspace');
            if(target) { target.scrollIntoView({ behavior: 'smooth', block: 'start' }); }
        }, 150);";
        ClientScript.RegisterStartupScript(this.GetType(), "WorkspaceScrollFocus", js, true);
    }

    // --- TAB GENERATED CONTEXTUAL REPORT COMPILER EXPORT ACTION ---
    protected void btnGenerateReport_Click(object sender, EventArgs e)
    {
        HttpResponse response = HttpContext.Current.Response;
        response.Clear();
        response.Buffer = true;
        response.Charset = "";
        response.ContentType = "text/plain";
        response.AddHeader("content-disposition", "attachment;filename=Dayton_Asset_Node_Intel_Report.txt");

        using (StringWriter sw = new StringWriter())
        {
            sw.WriteLine("=========================================================================");
            sw.WriteLine("           DAYTON NATURAL RESOURCES PVT. LTD. INTEGRITY REPORT           ");
            sw.WriteLine("                  NODE SUMMARY INTEL LOG COMPILATION                     ");
            sw.WriteLine("=========================================================================");
            sw.WriteLine("Generated On: " + DateTime.Now.ToString("dd-MMM-yyyy HH:mm:ss"));
            sw.WriteLine("Active Terminal Node: " + (string.IsNullOrEmpty(ddlState.SelectedValue) ? "Direct Pincode Access Grid Path" : ddlState.SelectedItem.Text));
            sw.WriteLine("-------------------------------------------------------------------------\n");

            sw.WriteLine("[SUMMARY COMPILATION MATRIX]");
            sw.WriteLine(" - Total Deployed Hardware Assets : 7 Registered Units");
            sw.WriteLine(" - Active Human Capital Contingent: 3 Human Officers Allocated");
            sw.WriteLine(" - Overall Node Running Cost Matrix : INR 195,000.00 / M\n");

            sw.WriteLine("[ASSET INVENTORY BREAKDOWN]");
            sw.WriteLine("Tag ID\t\tItem Description\t\t\tCategory\tStatus");
            sw.WriteLine("EQ-IT-099\tDell OptiPlex Desktop PC Matrix\t\tIT\t\tAssigned");
            sw.WriteLine("EQ-FN-441\tErgonomic Mesh Support Task Chair\tFurniture\tAllocated");
            sw.WriteLine("EQ-EL-055\tVoltas Eco-Split 1.5 Ton AC Unit\tElectronic\tMaintenance\n");

            sw.WriteLine("[CUSTODIAN RESPONSIBILITY ALLOCATIONS]");
            sw.WriteLine("Asset Reference\t\tEquipment Class\t\t\tAccountable Custodian");
            sw.WriteLine("EQ-IT-099\t\tDell OptiPlex PC\t\tAarav Sharma");
            sw.WriteLine("EQ-FN-441\t\tErgonomic Chair\t\t\tPriya Patel");
            sw.WriteLine("=========================================================================");

            response.Output.Write(sw.ToString());
            response.Flush();
            response.End();
        }
    }
}