using System;
namespace DAL
{
    public partial class pyatLevelDS
    {
         public partial class tbluserDataTable
        {
        }
        public partial class tblpasswordDataTable
        {
        }
        public partial class tbluserinfoDataTable
        {
        }

        public partial class tbluserDataRow
        {
            private pyatLevelDSTableAdapters.tbluserTableAdapter adapter = new DAL.pyatLevelDSTableAdapters.tbluserTableAdapter();
       
            public int getIDByNamenPassword(string username, string password)
            {
                if (adapter.getIDByNamenPassword(username, password) == null)
                    return 0;
                else
                   return (int)adapter.getIDByNamenPassword(username, password);
                
            }

        }
        public partial class tblpasswordDataRow
        {
        }
        public partial class tbluserinfoDataRow
        {

        }

    }

}


namespace DAL.pyatLevelDSTableAdapters
{

    public partial class tbluserTableAdapter
    {
    }
    public partial class tblpasswordTableAdapter
    {
    }
    public partial class tbluserinfoTableAdapter
    {
    }


}
