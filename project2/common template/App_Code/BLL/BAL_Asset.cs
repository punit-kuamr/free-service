using System.Data;

public class BAL_Asset
{
    DAL_Asset dal = new DAL_Asset();

    // =========================
    // ASSETS
    // =========================
    public DataTable GetAssets()
    {
        return dal.GetAssets();
    }

    public int InsertAsset(string assetID, string assetName, string category, string status)
    {
        return dal.InsertAsset(assetID, assetName, category, status);
    }

    public int UpdateAsset(string assetID, string assetName, string category, string status)
    {
        return dal.UpdateAsset(assetID, assetName, category, status);
    }

    public int DeleteAsset(string assetID)
    {
        return dal.DeleteAsset(assetID);
    }

    // =========================
    // STAFF
    // =========================
    public DataTable GetStaff()
    {
        return dal.GetStaff();
    }
}