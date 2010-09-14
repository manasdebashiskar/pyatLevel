using System;
using DAL;
using DAL.pyatLevelDSTableAdapters;
using System.ComponentModel;

namespace pyatLevelLogicLayer
{
    [DataObject(true)]
    public class pyatLevelLogic
    {
        

        [DataObjectMethod(DataObjectMethodType.Select, true)]
        public int GetDataByUserNamenPassword(string username, string password)
        {
            tbluserTableAdapter adapter = new tbluserTableAdapter();
            pyatLevelDS.tbluserDataTable tbl = new pyatLevelDS.tbluserDataTable();
          tbl=  adapter.GetDataByUserNamenPassword(username, password);
            if (tbl == null || tbl.Rows.Count == 0)
                return 0;
            if (tbl.Rows.Count > 1)
                return -1;
            else
            {
                System.Data.DataColumn column = tbl.Columns[0];
                int value = Convert.ToInt32(tbl.Rows[0][0]);
                return value;
                
            }
            
        }

        [DataObjectMethod(DataObjectMethodType.Select, true)]
        public pyatLevelDS.tbluserinfoDataTable GetUserInfoByUserID(int userID)
        {
            tbluserinfoTableAdapter adapter = new tbluserinfoTableAdapter();
            pyatLevelDS.tbluserinfoDataTable tbl = new pyatLevelDS.tbluserinfoDataTable();
            try
            {
                tbl = adapter.GetUserInfoByUserID(userID);
               
            }
            catch
            {

            }
            return tbl;

        }
        


    }

}
