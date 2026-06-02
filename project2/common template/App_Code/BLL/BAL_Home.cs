using System.Data;

public class BAL_Home
{
    DAL_Home objDAL = new DAL_Home();

    public DataTable GetStates()
    {
        return objDAL.GetStates();
    }

    public DataTable FetchDistrictsByState(int StateID)
    {
        return objDAL.GetDistrictsByState(StateID);
    }

    public DataTable FetchPincodes(int districtID)
    {
        return objDAL.GetPincodes(districtID);
    }

    public DataTable FetchBranches(string pincode)
    {
        return objDAL.GetBranches(pincode);
    }

    public DataTable FetchAssets()
    {
        return objDAL.GetAssets();
    }

    public DataTable FetchStaff()
    {
        return objDAL.GetStaff();
    }

    public DataTable FetchAssignments()
    {
        return objDAL.GetAssignments();
    }

    public DataTable GetAssetsByOfficeAndGroup(int officeId, string groupName)
    {
        return objDAL.GetAssetsByOfficeAndGroup(officeId, groupName);
    }

    // ✅ FIX: THIS METHOD WAS MISSING (MAIN ERROR FIX)
    public void InsertAsset(string item,
                         int qty,
                         string status,
                         string remark,
                         int officeId,
                         string group)
    {
        objDAL.InsertAsset(item, qty, status, remark, officeId, group);
    }
    public void UpdateAsset(
    int id,
    string itemName,
    int qty,
    string status,
    string group)
    {
        objDAL.UpdateAsset(
            id,
            itemName,
            qty,
            status,
            group);
    }

    public void DeleteAsset(
        int id,
        string group)
    {
        objDAL.DeleteAsset(
            id,
            group);
    }
    public DataTable GetAssetsByGatewayRouting(
        string gateway,
        string district,
        string subDistrict,
        string branch,
        string pincode)
    {
        DataTable dt = new DataTable();

        dt.Columns.Add("AssetID");
        dt.Columns.Add("AssetName");
        dt.Columns.Add("Category");
        dt.Columns.Add("Status");

        // MOCK DATA (replace with DB later)
        dt.Rows.Add("EQ-IT-01", "Router Device", "IT", "Active");
        dt.Rows.Add("EQ-FN-02", "Office Chair", "Furniture", "Allocated");
        dt.Rows.Add("EQ-EL-03", "AC Unit", "Electronics", "Active");

        return dt;
    }
}