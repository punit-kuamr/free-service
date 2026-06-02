using System.Data;

public class BAL_Staff
{
    DAL_Staff dal = new DAL_Staff();

    public int MyAssets(string staff)
    {
        return dal.GetMyAssets(staff);
    }

    public int Reports()
    {
        return dal.GetReports();
    }

    public DataTable LoadAssets(string staff)
    {
        return dal.GetStaffAssets(staff);
    }

    public DataTable Search(string keyword)
    {
        return dal.Search(keyword);
    }
}