unit UMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  System.StrUtils,
  Vcl.ExtCtrls, Vcl.ComCtrls, Upopupmodal, lib.Windows, Inifiles, Data.DB,
  IBODataset, Data.DBXFirebird, Data.FMTBcd, Vcl.Grids, Wwdbigrd, Wwdbgrid,
  Vcl.DBCtrls, Datasnap.DBClient, Datasnap.Provider, Data.SqlExpr,
  IB_Components, IB_Access, Vcl.Mask, Vcl.DBGrids, IB_Controls, wwdbedit,
  Wwdotdot, Wwdbcomb, lib.validation.field;

type
  TFHelloWorld = class(TForm)
    edt_name: TEdit;
    StaticText1: TStaticText;
    edt_firstname: TEdit;
    btn_submit: TButton;
    lbl_firstname: TLabel;
    lbl_name: TLabel;
    edt_error: TEdit;
    lbl_errors_name: TLabel;
    ibqry_etudiant: TIBOQuery;
    ds2: TDataSource;
    dbnvgr_personne: TDBNavigator;
    ibdtbs_connexion: TIBODatabase;
    wdbgrd1: TwwDBGrid;
    lbl_mat_etud: TLabel;
    dbedt_MAT_ETUD: TDBEdit;
    lbl_nom: TLabel;
    dbedt_NOM: TDBEdit;
    lbl_prenom: TLabel;
    dbedt_PRENOM: TDBEdit;
    lbl_sexe: TLabel;
    cbb_SEXE: TwwDBComboBox;
    lbl_DATE_NAISS: TLabel;
    dbedt_DATE_NAISS: TDBEdit;
    lbl_1: TLabel;
    dbedt_NOM_1: TDBEdit;
    lbl_PAYS: TLabel;
    dbedt_ID_PAYS_NATIONALITE: TDBEdit;
    strngfld_etudiantMAT_ETUD: TStringField;
    strngfld_etudiantNOM: TStringField;
    strngfld_etudiantPRENOM: TStringField;
    strngfld_etudiantSEXE: TStringField;
    dtfld_etudiantDATE_NAISS: TDateField;
    strngfld_etudiantVILLE_NAISSANCE: TStringField;
    strngfld_etudiantPAYS: TStringField;
    strngfld_etudiantADR_RUE: TStringField;
    strngfld_etudiantADR_NO: TStringField;
    strngfld_etudiantADR_BOITE: TStringField;
    strngfld_etudiantLOCALITE: TStringField;
    strngfld_etudiantCP: TStringField;
    strngfld_etudiantGSM: TStringField;
    strngfld_etudiantTEL: TStringField;
    strngfld_etudiantNO_COMPTE: TStringField;
    strngfld_etudiantALLOC_FAM: TStringField;
    strngfld_etudiantNO_NATIONAL: TStringField;
    strngfld_etudiantEMAIL: TStringField;
    dtmfld_etudiantDATE_CREATED: TDateTimeField;
    dtmfld_etudiantDATE_MODIFIED: TDateTimeField;
    strngfld_etudiantUSERNAME: TStringField;
    strngfld_etudiantMODIFIED_BY: TStringField;
    wdbgrd_alloc: TwwDBGrid;
    ds_alloc: TDataSource;
    ibqry_alloc: TIBOQuery;
    strngfld_allocDENOM_CRT: TStringField;
    strngfld_allocSEC_SUP: TStringField;
    dtfld_allocDATE_DEB: TDateField;
    dtfld_allocDATE_FIN: TDateField;
    smlntfld_allocNB_PERIODES_STAGE: TSmallintField;
    smlntfld_allocNB_PERIODES: TSmallintField;
    ibcdfld_allocPERIODES_SEMAINE: TIBOBCDField;
    procedure Submit(Sender: TObject);
    procedure wdbgrd1TitleButtonClick(Sender: TObject; AFieldName: string);
    procedure searchSetQuery(Ordering, direction: String);
    procedure dbedt_NOMExit(Sender: TObject);
    procedure dbedt_PRENOMExit(Sender: TObject);
    procedure dbedt_NOMChange(Sender: TObject);
    procedure dbedt_PRENOMChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbedt_DATE_NAISSExit(Sender: TObject);
    procedure dbedt_DATE_NAISSChange(Sender: TObject);
    procedure wdbgrd1DblClick(Sender: TObject);
    procedure dbedt_MAT_ETUDChange(Sender: TObject);

  private
    { Déclarations privées }
    direction: string;
  public
    { Déclarations publiques }
  end;

var
  FHelloWorld: TFHelloWorld;
  Ordering, direction: string;

implementation

{$R *.dfm}

procedure ShowTime;
begin
  // Display the current date and time
  OutputDebugString(Pchar('Date : ' + DateTimeToStr(Now)));

end;

function outputD(text: string; var1: string = ''; var2: string = '')
  : string; overload;
// function outputD(text:string,var1:string,var2:string='');  overload;
begin
  OutputDebugString(Pchar(text + var1 + var2));
  Result := 'test';
end;

procedure TFHelloWorld.Submit(Sender: TObject);
var
  name, text, value1, username_windows: string;
  index, cpt, cpt1, Result: integer;
  myFile: TextFile;
  bool: Boolean;
  tab1: TStringList;
  libWindows: EWindows;
  init_file: TIniFile;

begin

  //
  // name := 'Text';
  // var1 := 12;
  // name:= firstname;

  // Show help (hint) for users
  edt_name.Hint := 'Entrez votre nom';
  edt_name.ShowHint := True;

  edt_name.Hint := 'Entrez votre prénom';
  edt_name.ShowHint := True;
  // check if variable is empty or not
  if edt_name.text = '' then
  begin
    edt_error.text := 'Le champ Name doit être rempli';
    lbl_errors_name.Visible := True;
    lbl_errors_name.Caption := 'Le champ Name doit être rempli';
  end
  else if edt_firstname.text = '' then
  begin
    edt_error.text := 'Le champ Firstname doit être rempli';
    lbl_errors_name.Visible := True;
    lbl_errors_name.Caption := 'Le champ Firstname doit être rempli';
  end
  else
  begin
    lbl_errors_name.Visible := False;
    lbl_errors_name.Caption := '';

    edt_error.text := '';
    OutputDebugString(Pchar('Name : ' + edt_name.text));
    OutputDebugString(Pchar('Firstname : ' + edt_firstname.text));

    // open another form
    popupmodal := Tpopupmodal.Create(Self);
    popupmodal.ShowModal;
    popupmodal.Free;

    // compare string text
    Result := CompareStr('testA', 'testB');
    OutputDebugString(Pchar('Compare : ' + IntToStr(Result)));



    // create file and insert line

    AssignFile(myFile, 'C:\Delphi-dev\HelloWorld\test.txt');
    Rewrite(myFile);

    WriteLn(myFile, 'Ceci est un test');

    Reset(myFile);

    // read file
    while not Eof(myFile) do
    begin
      ReadLn(myFile, text);
      OutputDebugString(Pchar('Texte fichier : ' + text));
    end;

    CloseFile(myFile);

    // BOOLEAN

    bool := False;
    bool := not bool;
    if bool = True then
      outputD('C est vrai');

    // use PROCEDURE
    ShowTime();

    // LOOP
    for cpt := 0 to 10 do
    begin
      OutputDebugString(Pchar('Test :' + IntToStr(cpt)));
    end;

    while cpt <= 15 do
    begin
      // ShowMessage(IntToStr(cpt));
      inc(cpt);
    end;

    // T string

    tab1 := TStringList.Create;

    tab1.add('a');
    tab1.add('b');
    tab1.add('c');
    tab1.Sort;

    for cpt := 0 to tab1.Count - 1 do
    begin
      OutputDebugString(Pchar('cpt :' + IntToStr(cpt)));
      // ShowMessage(tab1[cpt]);
    end;

    tab1.Sort;
    tab1.CommaText := 'alpha=1 ,beta=2 ,gamma=3';
    value1 := tab1.Values['alpha'];
    OutputDebugString(Pchar('Alpha chiffre:' + value1));

    value1 := tab1.Values['gamma'];
    OutputDebugString(Pchar('gamma chiffre:' + value1));

    if tab1.Find('beta=2', index) then
    begin
      OutputDebugString(Pchar('Index ' + IntToStr(index)));
    end;

    tab1.Free;

    // tstring with objects

    tab1 := TStringList.Create;
    tab1.AddObject('Alpha', TObject(integer(20)));
    tab1.AddObject('Beta', TObject(integer(20)));
    tab1.AddObject('Gamma', TObject(integer(20)));
    OutputDebugString(Pchar(tab1[0]));
    OutputDebugString(Pchar(tab1[1]));
    OutputDebugString(Pchar(tab1[2]));

    tab1.Sort;

    OutputDebugString(Pchar('TABLEAU index = ' + IntToStr(tab1.Count)));

    for cpt1 := 0 to tab1.Count - 1 do
    begin
      OutputDebugString(Pchar('loop ' + tab1[cpt1]));
    end;

    // get user account windows
    username_windows := libWindows.GetUserName();
    OutputDebugString(Pchar('USERNAME_LIB ' + username_windows));

    username_windows := GetEnvironmentVariable('USERNAME');
    OutputDebugString(Pchar('USERNAME ' + username_windows));

    // write parameters
    init_file := TIniFile.Create('C:\Delphi-dev\HelloWorld\config.ini');
    init_file.WriteString('parameters', 'simon', 'giaccio');
    init_file.WriteInteger('parameters', 'test', 123);

    // read parameters
    name := init_file.ReadString('parameters', 'debug', '');
    OutputDebugString(Pchar('Return ini file' + name));

    init_file.Free;

  end;

  // DB
  ibqry_etudiant.Active := True;

   ibqry_alloc.Active := True;

//      ibqry_alloc.ParamByName('PMatEtud').AsString := '2017005044';


end;

procedure TFHelloWorld.wdbgrd1DblClick(Sender: TObject);
begin
  // ibqry_alloc.ParamByName('PMatEtud').AsString := dbedt_MAT_ETUD.Text;
//    ibqry_alloc.ParamByName('PMatEtud').AsString := '2017005044';
   //ibqry_alloc.RefreshRows;
end;

procedure TFHelloWorld.wdbgrd1TitleButtonClick(Sender: TObject;
  AFieldName: string);
var
  listOrderBy: TStringList;
  index: integer; // not used but needed
  iCount, cpt: integer;
begin

  //direction := 'ASC';

  listOrderBy := TStringList.Create;
  listOrderBy.add('MAT_ETUD');
  listOrderBy.add('NOM');
  listOrderBy.add('PRENOM');

  listOrderBy.add('SEXE');
  listOrderBy.add('DATE_NAISS');
  listOrderBy.add('VILLE_NAISSANCE');
  listOrderBy.add('PAYS');
  listOrderBy.add('ADR_RUE');
  listOrderBy.add('ADR_NO');
  listOrderBy.add('ADR_BOITE');
  listOrderBy.add('localite');
  listOrderBy.add('CP');
  listOrderBy.add('GSM');
  listOrderBy.add('TEL');
  listOrderBy.add('NO_COMPTE');
  listOrderBy.add('ALLOC_FAM');
  listOrderBy.add('EMAIL');
  listOrderBy.add('DATE_CREATED');
  listOrderBy.add('DATE_MODIFIED');
  listOrderBy.add('USERNAME');

  listOrderBy.add('MODIFIED_BY');
  {
    SELECT etd.MAT_ETUD, etd.NOM, etd.PRENOM, etd.SEXE, etd.DATE_NAISS, v.NOM,
    etd.ID_PAYS_NATIONALITE, etd.ADR_RUE, etd.ADR_NO, etd.ADR_BOITE, l.NOM,
    l.CP, etd.GSM, etd.TEL, etd.NO_COMPTE, etd.ALLOC_FAM, etd.NO_NATIONAL,
    etd.EMAIL, etd.DATE_CREATED, etd.DATE_MODIFIED, etd.USERNAME,
    etd.MODIFIED_BY
  }
  listOrderBy.Sort(); // needed to use find

  if listOrderBy.Find(AFieldName, index) then
  begin
    Ordering := AFieldName;

    if direction = 'ASC' then
      direction := 'DESC'
    else if direction = 'DESC' then
      direction := 'ASC';
  end;

  ibqry_etudiant.Open;
  iCount := ibqry_etudiant.RecordCount;

  OutputDebugString(Pchar('COUNT personn : ' + IntToStr(iCount)));

  searchSetQuery('etd.' + Ordering, direction);

  // wdbgrd1.Sort('Nom', True);

end;

procedure TFHelloWorld.dbedt_DATE_NAISSChange(Sender: TObject);
begin

  dbedt_DATE_NAISS.Font.Color := clWindowText;
  edt_error.text := '';
  edt_error.Font.Color := clWindowText;

end;

procedure TFHelloWorld.dbedt_DATE_NAISSExit(Sender: TObject);
var
  return, date_naiss: String;
begin

//  date_naiss := strngfld_etudiantVILLE_NAISSANCE

  date_naiss := dbedt_DATE_NAISS.Field.Text;

  return := lib.validation.field.f_check_date(date_naiss, False);

  if return <> 'OK' then
  begin
    dbedt_DATE_NAISS.Font.Color := clRed;
  end;

  edt_error.text := return;
  edt_error.Font.Color := clRed;
end;

procedure TFHelloWorld.dbedt_MAT_ETUDChange(Sender: TObject);
begin

    if dbedt_MAT_ETUD.Text <> '' then
    begin
    OutputDebugString(Pchar(' MAT ETUD ' + dbedt_MAT_ETUD.Text));

//      ibqry_alloc.ParamByName('PMatEtud').AsString := ibqry_etudiant.FieldByName('MAT_ETUD').AsString;
      ibqry_alloc.ParamByName('PMatEtud').AsString := dbedt_MAT_ETUD.Text;
       ibqry_alloc.Refresh;

       ibqry_alloc.Active := True;
    end;

end;

procedure TFHelloWorld.dbedt_NOMChange(Sender: TObject);
begin
  dbedt_NOM.Font.Color := clWindowText;
  edt_error.text := '';
  edt_error.Font.Color := clWindowText;
end;

procedure TFHelloWorld.dbedt_NOMExit(Sender: TObject);
var
  return, nom: String;
  size: integer;

begin
  // OutputDebugString(Pchar(strngfld_etudiantNOM.AsString));

  nom := strngfld_etudiantNOM.AsString;
  // size := strngfld_etudiantNOM.Size;
  return := lib.validation.field.f_check_text(nom, False);

  // OutputDebugString(Pchar('NOM '+ nom +'SIZE'+ IntToStr(size)));

  if return <> 'OK' then
  begin
    dbedt_NOM.Font.Color := clRed;
  end;

  edt_error.text := return;
  edt_error.Font.Color := clRed;

end;

procedure TFHelloWorld.dbedt_PRENOMChange(Sender: TObject);
begin
  dbedt_PRENOM.Font.Color := clWindowText;
  edt_error.text := '';
  edt_error.Font.Color := clWindowText;
end;

procedure TFHelloWorld.dbedt_PRENOMExit(Sender: TObject);
var
  return, prenom: String;
  size: integer;

begin
  // OutputDebugString(Pchar(strngfld_etudiantNOM.AsString));

  prenom := strngfld_etudiantPRENOM.AsString;
  // size := strngfld_etudiantNOM.Size;
  return := lib.validation.field.f_check_text(prenom, False);

  // OutputDebugString(Pchar('NOM '+ nom +'SIZE'+ IntToStr(size)));

  if return <> 'OK' then
  begin
    dbedt_PRENOM.Font.Color := clRed;
  end;

  edt_error.text := return;
  edt_error.Font.Color := clRed;

end;

procedure TFHelloWorld.searchSetQuery(Ordering, direction: String);
var
  iCount: integer;
begin
  OutputDebugString(Pchar('----- REQ searchSetQuery - ordering - direction ' +
    Ordering + direction));

  ibqry_etudiant.SQL.text := '';
  ibqry_etudiant.SQL.add('SELECT MAT_ETUD' + ', etd.NOM' + ', etd.PRENOM' +
    ', etd.SEXE' + ', etd.DATE_NAISS' + ', v.nom as ville_naissance ' +
    ', p.nom as pays' + ', etd.ADR_RUE ' + ', etd.ADR_NO' +
    ', etd.ADR_BOITE' + ', l.NOM as localite ' + ', l.CP' + ', etd.GSM' + ', etd.TEL' +
    ', etd.NO_COMPTE' + ', etd.ALLOC_FAM ' + ', etd.NO_NATIONAL ' +
    ', etd.EMAIL        ' + ', etd.DATE_CREATED  ' + ', etd.DATE_MODIFIED ' +
    ', etd.USERNAME       ' + ', etd.MODIFIED_BY     ' +
    'FROM ETUDIANTS etd       ' +
    'inner join VILLES v on v.ID_VILLE=etd.ID_VILLE_NAISS ' +
    'inner join LOCALITES l on l.ID_LOCALITE = etd.ADR_ID_LOCALITE' +
    ' inner join PAYS p on p.id_pays = etd.ID_PAYS_NATIONALITE');

  ibqry_etudiant.SQL.add(' ORDER BY ' + Ordering + ' ' + direction + ' ');

  // OutputDebugString(PChar(ibqry_etudiant.SQL.Text));

  ibqry_etudiant.Open;
  iCount := ibqry_etudiant.RecordCount;

  OutputDebugString(Pchar('Count_personne : ' + IntToStr(iCount)));

  // lbl_personne.Caption := IntToStr(iCount) + ' personnes';
end;

procedure TFHelloWorld.FormShow(Sender: TObject);
begin
  // default sql ordering
  ordering := 'NOM';
  direction := 'ASC';
end;


end.

