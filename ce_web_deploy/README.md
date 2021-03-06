# Web Site 專案 SQL Server Compact 4.0 元件的部署


1. 複製相關檔案:
	* 將 C:\Program Files (x86)\Microsoft SQL Server Compact Edition\v4.0\Desktop\System.Data.SqlServerCe.dll 複製到 ~\bin
	* 將 C:\Program Files (x86)\Microsoft SQL Server Compact Edition\v4.0\Desktop\System.Data.SqlServerCe.Entity\System.Data.SqlServerCe.Entity.dll 複製到 ~\bin
	* 將 C:\Program Files (x86)\Microsoft SQL Server Compact Edition\v4.0\Private\x86\* 複製到 ~bin\x86
	* 將 C:\Program Files (x86)\Microsoft SQL Server Compact Edition\v4.0\Private\amd64\* 複製到 ~bin\amd64
	注意: System.Data.SqlServerCe.dll 及 System.Data.SqlServerCe.Entity.dll 要用 Desktop 目錄的版本而不能直接用 Private 目錄的版本；
				Private 目錄下的 x86 與 amd64 內容 Unmanaged 程式庫記得也要一併複製到 bin 目錄下(所以 bin 下應該要有 x86 及 amd64 兩個子目錄) 

2. 加入 DbProvider 設定:
伺服器未安裝 SQL CE，.NET 會不認得 Microsoft SQL Server Compact Data Provider (癥狀為出現 The specified store provider cannot be found in the configuration, or is not valid 訊息)，
如果不想更動 machine.config，在 web.config 加以下設定即可:

```
<system.data>
  <DbProviderFactories>
    <remove invariant="System.Data.SqlServerCe.4.0" />
    <add name="Microsoft SQL Server Compact Data Provider 4.0" invariant="System.Data.SqlServerCe.4.0" description=".NET Framework Data Provider for Microsoft SQL Server Compact" type="System.Data.SqlServerCe.SqlCeProviderFactory, System.Data.SqlServerCe, Version=4.0.0.0, Culture=neutral, PublicKeyToken=89845dcd8080cc91" />
  </DbProviderFactories>
</system.data> 
```

## 參考網址：                                                                                                                       
 - [Web Site 專案 SQL Server Compact 4.0 元件的手動部署](http://blog.darkthread.net/post-2013-06-30-deploy-sqlce4-by-copy-files.aspx)
