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
  IB_Components, IB_Access, Vcl.Mask, Vcl.DBGrids;
  //checkType in '..\Lib\checkType.pas';

type
  TFHelloWorld = class(TForm)
    edt_name: TEdit;
    StaticText1: TStaticText;
    edt_firstname: TEdit;
    Button1: TButton;
    Label1: TLabel;
    Label2: TLabel;
    edt_error: TEdit;
    lbl_errors_name: TLabel;
    ibqry_etudiant: TIBOQuery;
    ds2: TDataSource;
    dbnvgr_personne: TDBNavigator;
    wdbgrd1: TwwDBGrid;
    ibdtbs_connexion: TIBODatabase;
    lblNom: TLabel;
    lbl_prenom: TLabel;
    dbedt_nom: TDBEdit;
    dbedt_prenom: TDBEdit;
    dbedtMatricule: TDBEdit;
    lblDate_naissance: TLabel;
    dbedtSEXE: TDBEdit;
    Label3: TLabel;
    lbl_lieu: TLabel;
    strngfld_etudiantMAT_ETUD: TStringField;
    strngfld_etudiantNOM: TStringField;
    strngfld_etudiantPRENOM: TStringField;
    dbedt_lieu_naissance: TDBEdit;
    strngfld_etudiantSEXE: TStringField;
    dtfld_etudiantDATE_NAISS: TDateField;
    strngfld_etudiantNOM_1: TStringField;
    intgrfld_etudiantID_PAYS_NATIONALITE: TIntegerField;
    strngfld_etudiantADR_RUE: TStringField;
    strngfld_etudiantADR_NO: TStringField;
    strngfld_etudiantADR_BOITE: TStringField;
    strngfld_etudiantNOM_2: TStringField;
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
    lbl_ville: TLabel;
    dbedt_ville: TDBEdit;
    lbl_cp: TLabel;
    dbedt_cp: TDBEdit;
    lbl_rue: TLabel;
    dbedt_rue: TDBEdit;
    procedure Submit(Sender: TObject);
    procedure wdbgrd1TitleButtonClick(Sender: TObject; AFieldName: string);
    procedure searchSetQuery(Ordering, direction: String);
    procedure dbedt_nomExit(Sender: TObject);

  private
    { Déclarations privées }
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
  name, firstname, text, value1, username_windows: string;
  var1, index, cpt, cpt1, Result: integer;
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

end;

procedure TFHelloWorld.wdbgrd1TitleButtonClick(Sender: TObject;
  AFieldName: string);
var
  listOrderBy: TStringList;
  index: integer; // not used but needed
  iCount, cpt: integer;
begin

  direction := 'ASC';

  listOrderBy := TStringList.Create;
  listOrderBy.add('MAT_ETUD');
  listOrderBy.add('NOM');
  listOrderBy.add('PRENOM');

  listOrderBy.add('SEXE');
  listOrderBy.add('DATE_NAISS');
  listOrderBy.add('NOM');
  listOrderBy.add('ID_PAYS_NATIONALITE');
  listOrderBy.add('ADR_RUE');
  listOrderBy.add('ADR_NO');
  listOrderBy.add('ADR_BOITE');
  listOrderBy.add('NOM');
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

  searchSetQuery('etd.'+Ordering, direction);

  // wdbgrd1.Sort('Nom', True);

end;

procedure TFHelloWorld.dbedt_nomExit(Sender: TObject);
begin

//if dbedt_nom.Text  then


end;

procedure TFHelloWorld.searchSetQuery(Ordering, direction: String);
var
  iCount: integer;
begin
  OutputDebugString(Pchar('----- REQ searchSetQuery - ordering - direction ' +
    Ordering + direction));

  ibqry_etudiant.SQL.text := '';
ibqry_etudiant.SQL.add('SELECT MAT_ETUD' +
     ', etd.NOM' +
     ', etd.PRENOM' +
     ', etd.SEXE'   +
     ', etd.DATE_NAISS'+
     ', v.nom         ' +
     ', etd.ID_PAYS_NATIONALITE' +
     ', etd.ADR_RUE ' +
     ', etd.ADR_NO' +
     ', etd.ADR_BOITE' +
     ', l.NOM ' +
     ', l.CP' +
     ', etd.GSM' +
     ', etd.TEL' +
     ', etd.NO_COMPTE' +
     ', etd.ALLOC_FAM ' +
     ', etd.NO_NATIONAL '+
    ', etd.EMAIL        '+
    ', etd.DATE_CREATED  '+
     ', etd.DATE_MODIFIED '+
     ', etd.USERNAME       '+
     ', etd.MODIFIED_BY     '+
'FROM ETUDIANTS etd       '+
'inner join VILLES v on v.ID_VILLE=etd.ID_VILLE_NAISS '+
'inner join LOCALITES l on l.ID_LOCALITE = etd.ADR_ID_LOCALITE');

  ibqry_etudiant.SQL.add(' ORDER BY ' + Ordering + ' ' + direction + ' ');

//  OutputDebugString(PChar(ibqry_etudiant.SQL.Text));

  ibqry_etudiant.Open;
  iCount := ibqry_etudiant.RecordCount;

  OutputDebugString(Pchar('Count_personne : ' + IntToStr(iCount)));

  // lbl_personne.Caption := IntToStr(iCount) + ' personnes';
end;

end.
