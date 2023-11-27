object IWServerController: TIWServerController
  AppName = 'MaintDB'
  ComInitialization = ciMultiThreaded
  Description = 'Maintenance Database'
  DisplayName = 'MaintDB'
  Port = 8086
  SSLOptions.SSLVersion = SSLv3
  Version = '15.5.0'
  ExceptionLogger.ReportInfos = [riAppInfo, riExceptionInfo, riIWAppInfo, riStackTrace]
  ExceptionLogger.Enabled = True
  HttpKeepAlive = True
  SessionOptions.SessionTimeout = 30
  OnNewSession = IWServerControllerBaseNewSession
  OnGetMainForm = IWServerControllerBaseGetMainForm
  Height = 310
  Width = 342
end
