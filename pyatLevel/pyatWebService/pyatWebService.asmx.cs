using System;
using System.Data;
using System.Web;
using System.Collections;
using System.Web.Services;
using System.Web.Services.Protocols;
using System.ComponentModel;
using pyatLevelLogicLayer;
using DAL;
using DAL.pyatLevelDSTableAdapters;


namespace pyatWebService
{
    /// <summary>
    /// Summary description for pyatWebService
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [ToolboxItem(false)]
    public class pyatWebService : System.Web.Services.WebService
    {

        //[WebMethod]
        //public string getUserInfo(string userid )
        //{
        //    pyatLevelLogic pLG = new pyatLevelLogic();
        //    DataSet ds = new DataSet();
        //    ds.Tables.Add(pLG.getDataByUserID(Convert.ToInt32(userid)));
        //    return (ds.GetXml());
        //}

        //[WebMethod]
        //public string setUserInfo(i)
        //{
        //    pyatLevelLogic pLG = new pyatLevelLogic();
        //    DataSet ds = new DataSet();
        //    ds.Tables.Add(pLG.getDataByUserID(userid));
        //    return (ds.GetXml());
        //}
    }
}
