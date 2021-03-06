using System;
using DAL;
using DAL.pyatLevelDSTableAdapters;
using System.ComponentModel;
using System.Net.Mail;


namespace pyatLevelLogicLayer
{
    [DataObject(true)]
    public class pyatLevelLogic : MarshalByRefObject
    {


        [DataObjectMethod(DataObjectMethodType.Select, true)]
        public int GetDataByUserNamenPassword(string username, string password)
        {
            tbluserTableAdapter adapter = new tbluserTableAdapter();
            pyatLevelDS.tbluserDataTable tbl = new pyatLevelDS.tbluserDataTable();
            tbl = adapter.GetDataByUserNamenPassword(username, password);
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

        public int LogIn(string username, string Password, string Emailid)
        {
            tbluserTableAdapter adapter = new tbluserTableAdapter();
            pyatLevelDS.tbluserDataTable tbl = new pyatLevelDS.tbluserDataTable();

            tbl = adapter.GetDataByCredentials(username,Password , Emailid);
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
                tbl = adapter.GetUserinfoByUserId(userID);

            }
            catch
            {

            }

            return tbl;

        }
        [DataObjectMethod(DataObjectMethodType.Insert, true)]
        public int addUserInfo(int UniqueID, string UserName, string Qustion, string Answer, string Email)
        {
            tbluserinfoTableAdapter adapter = new tbluserinfoTableAdapter();
            return adapter.AddUserInfo(UniqueID, UserName, Qustion, Answer, Email);
        }

        [DataObjectMethod(DataObjectMethodType.Select, true)]
        public int addNewUser(string name, string emailid, int isactive)
        {

            DAL.pyatLevelDSTableAdapters.tbluserTableAdapter adapter = new tbluserTableAdapter();
            int success = Convert.ToInt32(adapter.addNewUser(name, emailid, isactive));

            if (success > 1)
            {
                return success;
            }
            else
            {
                return -1;
            }

        }

        public int addNewUser(string userName, string password, string Email, string address, String phoneNo)
        {
            /*if 
           * getUserwithSameName() returns null then go ahead and
           * AddNewUser();
           * then AddUserInfo()
           * then setPassword()
           * 
           * */
            int insertionsuccess = -1;
            DAL.pyatLevelDSTableAdapters.tbluserTableAdapter useradapter = new tbluserTableAdapter();
            DAL.pyatLevelDSTableAdapters.tbluserinfoTableAdapter infoAdapter = new tbluserinfoTableAdapter();
            DAL.pyatLevelDSTableAdapters.tblpasswordTableAdapter passwordAdapter = new tblpasswordTableAdapter();

            if (useradapter.GetUserIDByName(userName) != null)
            {
                //we got result back. Which means there is a user with the same name.
                return -1;
            }
            else
            {
                try
                {

                    int userid = addNewUser(userName, address, 0);
                    int success = infoAdapter.AddUserInfo(userid, userName, address, phoneNo, Email);
                    insertionsuccess = passwordAdapter.SetPasswordInfo(password, password, 0, userid);
                }
                catch
                {
                }

            }

            return insertionsuccess;

        }

        [DataObjectMethod(DataObjectMethodType.Update, true)]
        public int UpdateUserInfoByUserInfoID(Int32 userinfoid, string UserName, string Address, string Phone, string Email)
        {
            DAL.pyatLevelDSTableAdapters.tbluserinfoTableAdapter infoAdapter = new tbluserinfoTableAdapter();
            return infoAdapter.UpdateUserInfoByUserInfoID(UserName, Address, Phone, Email, userinfoid);

        }

    }

    [DataObject(true)]
    public class pyatLevelLogicClient : MarshalByRefObject
    {


        [DataObjectMethod(DataObjectMethodType.Select, true)]
        public pyatLevelDS.tblClientDataTable GetClient(int userid)
        {
            tblClientTableAdapter adapter = new tblClientTableAdapter();
            return adapter.GetClientsByUserid(userid);
        }
        [DataObjectMethod(DataObjectMethodType.Insert, true)]
        public Int32 InsertClient(string name, int userid, string companyAddress)
        {
            tblClientTableAdapter adapter = new tblClientTableAdapter();
            return adapter.InsertClient(name, userid, companyAddress);
        }
    }

    [DataObject(true)]
    public class pyatLevelLogicPhoneNumber : MarshalByRefObject
    {


        [DataObjectMethod(DataObjectMethodType.Select, true)]
        public pyatLevelDS.tblphoneNumbersDataTable GetPhoneNumber(int clientid)
        {
            tblphoneNumbersTableAdapter adapter = new tblphoneNumbersTableAdapter();
            return adapter.GetPhoneNumbersByClientID(clientid);
        }
        [DataObjectMethod(DataObjectMethodType.Insert, true)]
        public Int32 InsertPhoneNumber(string phonenumber,string name, string emailid, int userid, int clientid)
        {
            tblphoneNumbersTableAdapter adapter = new tblphoneNumbersTableAdapter();
            return adapter.InsertPhoneNumber(phonenumber, name, emailid, userid, clientid);
        }
    }
}