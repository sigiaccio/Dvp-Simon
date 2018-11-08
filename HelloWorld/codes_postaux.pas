unit codes_postaux;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, IBODataset, Vcl.Grids, Wwdbigrd, Wwdbgrid;

type
  TForm_cp = class(TForm)
    grp_cp1: TGroupBox;
    grp_cp2: TGroupBox;
    btn_localites: TButton;
    wwDBGrid_allocFamil_update_localites: TwwDBGrid;
    wwDBGrid_allocFamil_localite_new: TwwDBGrid;
    ds_localite_old: TDataSource;
    ibqry_localites_old: TIBOQuery;
    intgrfld_localites_oldID_LOCALITE: TIntegerField;
    strngfld_localites_oldCP: TStringField;
    strngfld_localites_oldNOM: TStringField;
    ibqry_localites_new: TIBOQuery;
    ds_localite_new: TDataSource;
    intgrfld_localites_newID: TIntegerField;
    strngfld_localites_newCP: TStringField;
    strngfld_localites_newNOM: TStringField;
    edt_cp: TEdit;
    grp_cp3: TGroupBox;
    grp_cp4: TGroupBox;
    ibqry_etudiant: TIBOQuery;
    ds_etudiant: TDataSource;
    ds_anc_etudiant: TDataSource;
    ibqry_anc_etudiant: TIBOQuery;
    wwDBGrid_etudiant: TwwDBGrid;
    strngfld_etudiantMAT_ETUD: TStringField;
    intgrfld_etudiantADR_ID_LOCALITE: TIntegerField;
    strngfld_etudiantNOM: TStringField;
    wwDBGrid_anc_etudiant: TwwDBGrid;
    strngfld_anc_etudiantMAT_ETUD: TStringField;
    intgrfld_anc_etudiantADR_ID_LOCALITE: TIntegerField;
    strngfld_anc_etudiantNOM: TStringField;
    btn_clear: TButton;
    procedure btn_localitesClick(Sender: TObject);
    procedure edt_cpEnter(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_cp: TForm_cp;

implementation

{$R *.dfm}

procedure TForm_cp.btn_localitesClick(Sender: TObject);
var
  id_old, cp_old, nom_old: String;
  id_new, cp_new, nom_new: String;
  cpt_localite_old, cpt_localite_new, cpt_erreurs: integer;

begin

  OutputDebugString(Pchar('DB LOCALITE OLD COUNT --->' + IntToStr(ibqry_localites_old.RecordCount)));
  OutputDebugString(Pchar('DB LOCALITE NEW COUNT --->' + IntToStr(ibqry_localites_new.RecordCount)));

  ibqry_localites_old.First;
  ibqry_localites_new.First;

  if edt_cp.Text = '' then
  begin
    ShowMessage('Le code postal ne peut pas être vide');
  end
  else
  begin
    ibqry_etudiant.ParamByName('pcodepostal').AsString := edt_cp.Text;
    ibqry_etudiant.Active := True;
    wwDBGrid_etudiant.RedrawGrid;

    ibqry_anc_etudiant.ParamByName('pcodepostal').AsString := edt_cp.Text;
    ibqry_anc_etudiant.Active := True;
    wwDBGrid_anc_etudiant.RedrawGrid;
  end;

  for cpt_localite_old := 0 to ibqry_localites_old.RecordCount do
  begin
    id_old := ibqry_localites_old.FieldByName('ID_LOCALITE').AsString;
    cp_old := ibqry_localites_old.FieldByName('CP').AsString;
    nom_old := ibqry_localites_old.FieldByName('NOM').AsString;

    if cp_old = edt_cp.Text then
    begin
//      OutputDebugString(Pchar('OLD : ID ' + id_old + ' cp ' + cp_old + ' nom ' + nom_old));
      inc(cpt_erreurs);

      for cpt_localite_new := 0 to ibqry_localites_new.RecordCount do
      begin
        id_new := ibqry_localites_new.FieldByName('ID').AsString;
        cp_new := ibqry_localites_new.FieldByName('CP').AsString;
        nom_new := ibqry_localites_new.FieldByName('NOM').AsString;

        if (cp_old = cp_new) or (LowerCase(nom_new) = LowerCase(nom_old)) then
        begin
          OutputDebugString(Pchar('ID NEW ' + id_new + ' ' + cp_new + ' ' + nom_new + ' ID OLD ' + id_old + ' '+ nom_old));
        end;

        if (cp_new = '6238') and (cp_old = cp_new) or (LowerCase(nom_new) = LowerCase(nom_old)) then
        begin
          OutputDebugString(Pchar('ID NEW ' + id_new + ' ' + cp_new + ' ' + nom_new + ' ID OLD ' + id_old + ' '+ nom_old));
        end;

        ibqry_localites_new.Next;

      end;

    end;
    ibqry_localites_old.Next;

  end;

  OutputDebugString(Pchar('Nombre d''erreurs ' + IntToStr(cpt_erreurs)));

  OutputDebugString(Pchar('DB ETUDIANT COUNT --->' + IntToStr(ibqry_etudiant.RecordCount)));
  OutputDebugString(Pchar('DB ANC ETUDIANT COUNT --->' + IntToStr(ibqry_anc_etudiant.RecordCount)));

end;

procedure TForm_cp.edt_cpEnter(Sender: TObject);
begin
  ibqry_etudiant.Close;
  ibqry_anc_etudiant.Close;
end;

end.
