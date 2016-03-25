unit ULinkService;

interface

procedure SetupOsfOsc;
procedure RunOsfOsc;

implementation
uses   sysutils,UDMOSCommerceImport, UMainOSCommerceImport ,TcashClasses ,UDMTCCoreLink,forms,classes ;

procedure RunOsfOsc;

begin
  DMTCCoreLink := TDMTCCoreLink.create(Application);
   try
     DMTCCoreLink.AApplication := Application ;
     DMOSCommerceImport := TDMOSCommerceImport.Create(Application);
     MainOSCommerceImport := TMainOSCommerceImport.Create(Application);
    try
     MainOSCommerceImport.Show ;
     MainOSCommerceImport.BSyncOrdersClick(nil);
     MainOSCommerceImport.Close ;
      finally
       FreeAndNil(DMOSCommerceImport) ;
       FreeAndNil(MainOSCommerceImport) ;
     end;
   finally
        FreeAndNil(DMTCCoreLink);
   end;  
end;

procedure SetupOsfOsc;

begin
  DMTCCoreLink := TDMTCCoreLink.create(Application);
   try
     DMTCCoreLink.AApplication := Application ;
     DMOSCommerceImport := TDMOSCommerceImport.Create(Application);
     MainOSCommerceImport := TMainOSCommerceImport.Create(Application);
    try
     MainOSCommerceImport.ShowModal ;
     finally
       FreeAndNil(DMOSCommerceImport) ;
       FreeAndNil(MainOSCommerceImport) ;
     end;
   finally
        FreeAndNil(DMTCCoreLink);
   end;  
end;



end.
 