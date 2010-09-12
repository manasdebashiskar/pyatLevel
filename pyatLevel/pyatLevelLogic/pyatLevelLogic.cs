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
            DAL.pyatLevelDSTableAdapters.tbluserTableAdapter adapter = new DAL.pyatLevelDSTableAdapters.tbluserTableAdapter();
            return (int)adapter.getIDByNamenPassword(username, password);
        }

    }

}
