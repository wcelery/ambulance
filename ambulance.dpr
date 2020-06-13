program ambulance;

uses
  System.StartUpCopy,
  FMX.Forms,
  index in 'index.pas' {frmIndex};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmIndex, frmIndex);
  Application.Run;
end.
