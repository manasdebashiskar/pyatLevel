using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Diagnostics;
using System.ServiceProcess;
using System.Text;
using System.Runtime.Remoting;
using System.Runtime.Remoting.Channels;
using System.Runtime.Remoting.Channels.Tcp;
using pyatLevelLogicLayer;

namespace pyatlevelBLLService
{
    public partial class pyatlevelBLLService : ServiceBase
    {
        public pyatlevelBLLService()
        {
            InitializeComponent();
        }

        protected override void OnStart(string[] args)
        {
            // TODO: Add code here to start your service.
            EventLog myevent = new EventLog();
            myevent.Source = " pyatlevelBLLService";
            myevent.WriteEntry(" pyatlevelBLLService has started");
            TcpChannel mychannel = new TcpChannel(7777);
            ChannelServices.RegisterChannel(mychannel, false);
            pyatLevelLogic mypyatLevelLogicLayer = new pyatLevelLogic();
            // Register the Proxy class for remoting.
            RemotingConfiguration.RegisterWellKnownServiceType(
                                        typeof(pyatLevelLogic),
                                        "pyatLevelLogic",
                                         WellKnownObjectMode.Singleton);
         }

        protected override void OnStop()
        {
            // TODO: Add code here to perform any tear-down necessary to stop your service.
        }
    }
}
