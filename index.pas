unit index;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.MultiView, FMX.Objects, FMX.Layouts,
  FMX.Effects, Data.DB, Data.Win.ADODB, System.Rtti, FMX.Grid.Style,
  FMX.ScrollBox, FMX.Grid, Fmx.Bind.Grid, System.Bindings.Outputs,
  Fmx.Bind.Editors, Data.Bind.EngExt, Fmx.Bind.DBEngExt, Data.Bind.Components,
  Data.Bind.Grid, Data.Bind.DBScope, Data.Bind.Controls, Fmx.Bind.Navigator,
  FMX.TabControl, System.Actions, FMX.ActnList, FMX.Edit, FMX.Filter.Effects,
  FMX.Colors, FMX.frxClass, FMX.frxDBSet;

type
  TfrmIndex = class(TForm)
    drawer: TMultiView;
    btnDoctors: TButton;
    btnRecept: TButton;
    btnCourses: TButton;
    btnRegistration: TButton;
    btnDrawer: TButton;
    StyleBook1: TStyleBook;
    Label1: TLabel;
    ico3: TButton;
    ico1: TButton;
    ico2: TButton;
    searchBySpec: TButton;
    searchByBld: TButton;
    searchByInsur: TButton;
    icoFolder: TButton;
    connectDB: TButton;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    ico4: TButton;
    ico5: TButton;
    curDoctors: TButton;
    treatCourses: TButton;
    connection: TADOConnection;
    OpenDialog1: TOpenDialog;
    doctor_MW: TMultiView;
    VertScrollBox1: TVertScrollBox;
    TabControl1: TTabControl;
    main_tab: TTabItem;
    specialization: TTabItem;
    blood_type: TTabItem;
    ActionList1: TActionList;
    NextTabAction1: TNextTabAction;
    PreviousTabAction1: TPreviousTabAction;
    ChangeTabAction1: TChangeTabAction;
    insurance: TTabItem;
    ChangeTabAction2: TChangeTabAction;
    ChangeTabAction3: TChangeTabAction;
    ChangeTabAction4: TChangeTabAction;
    ChangeTabAction5: TChangeTabAction;
    specRun: TButton;
    specClear: TButton;
    datasource_specialization: TDataSource;
    specEdit: TEdit;
    specGrid: TStringGrid;
    query_specialization: TADOQuery;
    BindSourceDB1: TBindSourceDB;
    BindingsList1: TBindingsList;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    Label5: TLabel;
    FillRGBEffect1: TFillRGBEffect;
    Button6: TButton;
    Button7: TButton;
    Layout1: TLayout;
    Layout2: TLayout;
    Label6: TLabel;
    btEdit: TEdit;
    btRun: TButton;
    btClear: TButton;
    btGrid: TStringGrid;
    Button10: TButton;
    FillRGBEffect2: TFillRGBEffect;
    query_bt: TADOQuery;
    datasource_bt: TDataSource;
    BindSourceDB2: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB2: TLinkGridToDataSource;
    Label7: TLabel;
    insurEdit: TEdit;
    Button8: TButton;
    insurRun: TButton;
    insurClear: TButton;
    insurGrid: TStringGrid;
    query_insur: TADOQuery;
    datasource_insur: TDataSource;
    FillRGBEffect3: TFillRGBEffect;
    BindSourceDB3: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB3: TLinkGridToDataSource;
    table_doctor: TADOTable;
    frxDBDataset1: TfrxDBDataset;
    frxReport1: TfrxReport;
    frxDBDataset2: TfrxDBDataset;
    frxReport2: TfrxReport;
    table_treatment: TADOTable;
    doctorGrid: TStringGrid;
    Button11: TButton;
    BindSourceDB4: TBindSourceDB;
    tabDoctor: TADOTable;
    BindSourceDB5: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB5: TLinkGridToDataSource;
    reception_MW: TMultiView;
    courses_MW: TMultiView;
    registration_MW: TMultiView;
    coursesGrid: TStringGrid;
    receptGrid: TStringGrid;
    registrationGrid: TStringGrid;
    Button1: TButton;
    Button3: TButton;
    Button4: TButton;
    tabCourses: TADOTable;
    tabRecept: TADOTable;
    tabRegist: TADOTable;
    BindSourceDB6: TBindSourceDB;
    BindSourceDB7: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB7: TLinkGridToDataSource;
    BindSourceDB8: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB8: TLinkGridToDataSource;
    BindSourceDB9: TBindSourceDB;
    LinkGridToDataSourceBindSourceDB9: TLinkGridToDataSource;
    Button2: TButton;
    Button5: TButton;
    Button9: TButton;
    Button12: TButton;
    procedure connectDBClick(Sender: TObject);
    procedure verstscroll (Sender: TObject);
    procedure specRunClick(Sender: TObject);
    procedure specClearClick(Sender: TObject);
    procedure specEditClick (Sender: TObject);
    procedure btEditClick (Sender: TObject);
    procedure btRunClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure insurEditClick (Sender: TObject);
    procedure insurRunClick(Sender: TObject);
    procedure insurClearClick(Sender: TObject);
    procedure btClearClick(Sender: TObject);
    procedure curDoctorsClick(Sender: TObject);
    procedure treatCoursesClick(Sender: TObject);




  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmIndex: TfrmIndex;

implementation

{$R *.fmx}


procedure TfrmIndex.FormResize(Sender: TObject);
begin
  if Width < 850 then
    Width := 850;
  if Height < 800 then
    Height := 800;
end;


procedure TfrmIndex.connectDBClick(Sender: TObject);
var tablecol,tablecol1,tablecol2,tablecol3 :integer;
begin
if OpenDialog1.Execute then
With connection do
begin
  Connected :=false;//закрываем сущ. соединение
  ConnectionString :='Provider=Microsoft.Jet.OLEDB.4.0;'+
'Data Source=' +OpenDialog1.FileName+
';Persist Security Info=false'; //формируем новую строку подключения
 Connected :=true;
 end;
tablecol:=0;
tablecol1:=0;
tablecol2:=0;
tablecol3:=0;
tabDoctor.TableName:='doctor';
tabDoctor.Active:=True;


tabRecept.TableName:='meet';
tabRecept.Active:=True;

tabCourses.TableName:='treatment_courses';
tabCourses.Active:=True;

tabRegist.TableName:='registration_card';
tabRegist.Active:=True;

for tablecol := 0 to tablecol+4 do doctorGrid.Columns[tablecol].Width:=150;
for tablecol1 := 0 to tablecol1+3 do coursesGrid.Columns[tablecol1].Width:=150;
for tablecol2 := 0 to tablecol2+8 do registrationGrid.Columns[tablecol2].Width:=150;
for tablecol3 := 0 to tablecol3+3 do receptGrid.Columns[tablecol3].Width:=150;

end;

procedure TfrmIndex.curDoctorsClick(Sender: TObject);
begin
table_doctor.TableName:='doctor';
frxReport1.PrepareReport();
frxReport1.ShowPreparedReport;
end;

procedure TfrmIndex.treatCoursesClick(Sender: TObject);
begin
table_treatment.TableName:='treatment_courses';
frxReport2.PrepareReport();
frxReport2.ShowPreparedReport;
end;

procedure TfrmIndex.specClearClick(Sender: TObject);
begin
  with  query_specialization do
  begin
   Close;
   SQL.Clear;
  end;
end;

procedure TfrmIndex.btClearClick(Sender: TObject);
begin
  with  query_bt do
  begin
   Close;
   SQL.Clear;
  end;
end;

procedure TfrmIndex.insurClearClick(Sender: TObject);
begin
  with  query_insur do
  begin
   Close;
   SQL.Clear;
  end;
end;

procedure TfrmIndex.specRunClick(Sender: TObject);
var iSpec:integer;
begin
iSpec:=0;
with  query_specialization do
  begin
    SQL.Add('SELECT * FROM doctor WHERE specialization=:specInput');
    Parameters.ParamByName('specInput').Value:=specEdit.Text;
    Open;     {Выполняем запрос и открываем набор данных}
  end;
for iSpec := 0 to iSpec+4 do
specGrid.Columns[iSpec].Width:=150;
end;

procedure TfrmIndex.btRunClick(Sender: TObject);
var
iBt:integer;
begin
iBt:=0;
with query_bt do
  begin
    SQL.Add('SELECT * FROM registration_card WHERE blood_type=:btInput');
    Parameters.ParamByName('btInput').Value:=btEdit.Text;
    Open;
  end;
for iBt := 0 to iBt+8 do
btGrid.Columns[iBt].Width:=150;
end;

procedure TfrmIndex.insurRunClick(Sender: TObject);
var
iInsur:integer;
begin
iInsur:=0;
with query_insur do
  begin
    SQL.Add('SELECT * FROM registration_card WHERE insurance_comp=:insurInput');
    Parameters.ParamByName('insurInput').Value:=insurEdit.Text;
    Open;
  end;
for iInsur := 0 to iInsur+8 do
insurGrid.Columns[iInsur].Width:=150;
end;

procedure TfrmIndex.specEditClick (Sender: TObject);
begin
FillRGBEffect1.Enabled:=true
end;

procedure TfrmIndex.btEditClick (Sender: TObject);
begin
FillRGBEffect2.Enabled:=true
end;

procedure TfrmIndex.insurEditClick (Sender: TObject);
begin
FillRGBEffect3.Enabled:=true
end;

procedure TfrmIndex.verstscroll (Sender: TObject);
begin
VertScrollBox1.AniCalculations.Animation:=true;
VertScrollBox1.AniCalculations.Elasticity:=70.0;
TabControl1.SetActiveTabWithTransition(main_tab,TTabTransition.Slide);



end;


end.
