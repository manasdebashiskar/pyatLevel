using System;
using DAL;
using DAL.pyatLevelDSTableAdapters;
using System.ComponentModel;

namespace pyatLevelLogicLayer
{
    [DataObject(true)]
    public class pyatLevelLogic
    {
        [DataObjectMethod(DataObjectMethodType.Select, false)]
        public int getuserid(string username, string password)
        {
           //TODO: Salt Hash implementation.
            DAL.pyatLevelDSTableAdapters.tbluserTableAdapter adapter = new DAL.pyatLevelDSTableAdapters.tbluserTableAdapter();
            return (int)adapter.getIDByNamenPassword(username, password);
        }

        [DataObjectMethod(DataObjectMethodType.Select, true)]
        public pyatLevelDS.tbluserinfoDataTable getDataByUserID(int userid)
        {
            tbluserinfoTableAdapter adapter = new tbluserinfoTableAdapter();
             return adapter.GetDataByUserID(userid);
        }

    }

}
