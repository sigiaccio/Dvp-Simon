unit Upopupmodal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Grids, Wwdbigrd, Wwdbgrid, IB_Components, IB_Access, IBODataset, Data.DB, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Mask;

type
  Tpopupmodal = class(TForm)
    btn1: TButton;
    btn2: TButton;
    txt_return: TStaticText;
    ibqry_horaire: TIBOQuery;
    ds_horaire: TDataSource;
    wdbgrd_horaire: TwwDBGrid;
    intgrfld_horaireID_HORAIRE: TIntegerField;
    intgrfld_horaireNO_CLASSE: TIntegerField;
    strngfld_horaireNOM: TStringField;
    strngfld_horairePRENOM: TStringField;
    strngfld_horaireUSERNAME: TStringField;
    strngfld_horaireCoursdenom: TStringField;
    strngfld_horaireSectionsdenom: TStringField;
    strngfld_horaireNOM_1: TStringField;
    strngfld_horairePRENOM_1: TStringField;
    strngfld_horaireID_ORG: TStringField;
    strngfld_horaireDENOM: TStringField;
    dtfld_horaireDATE_DEB: TDateField;
    dtfld_horaireDATE_FIN: TDateField;
    tmfld_horaireHEURE_DEB: TTimeField;
    tmfld_horaireHEURE_FIN: TTimeField;
    smlntfld_horaireNUMER_FREQ_SEM: TSmallintField;
    smlntfld_horaireDENOM_FREQ_SEM: TSmallintField;
    smlntfld_horaireID_JOUR: TSmallintField;
    dbnvgr_personne: TDBNavigator;
    wdbgrd_cours: TwwDBGrid;
    IBOQuery1: TIBOQuery;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    StringField1: TStringField;
    StringField2: TStringField;
    DateField1: TDateField;
    DateField2: TDateField;
    StringField3: TStringField;
    SmallintField1: TSmallintField;
    TimeField1: TTimeField;
    TimeField2: TTimeField;
    SmallintField2: TSmallintField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    SmallintField3: TSmallintField;
    StringField7: TStringField;
    StringField8: TStringField;
    StringField9: TStringField;
    ibqry_count_cours: TIBOQuery;
    ds_count_horaire: TDataSource;
    intgrfld_count_coursCOUNT: TIntegerField;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure wdbgrd_horaireDblClick(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }

  end;

var
  popupmodal: Tpopupmodal;

implementation

{$R *.dfm}

uses UMain;

procedure Tpopupmodal.btn1Click(Sender: TObject);
begin

txt_return.Caption := FHelloWorld.edt_firstname.text;
ibqry_horaire.Active;

end;

procedure Tpopupmodal.btn2Click(Sender: TObject);
begin
ModalResult := mrOk;
end;

procedure Tpopupmodal.wdbgrd_horaireDblClick(Sender: TObject);
begin
    ibqry_count_cours.Active := False;
    ibqry_count_cours.ParamByName('Pno_classe').AsString :=   ibqry_horaire.FieldByName('no_classe').AsString;
//    ibqry_count_cours.ParamByName('Pdenom_cours').AsString := 'BIOLOGIE';

    OutputDebugString(PChar('No classe ' + ibqry_count_cours.ParamByName('Pno_classe').AsString));
    OutputDebugString(Pchar(ibqry_horaire.FieldByName('no_classe').AsString));

    ibqry_count_cours.ExecSQL;
    //ibqry_count_cours.Refresh;

//    ibqry_count_cours.Open;

end;

end.
