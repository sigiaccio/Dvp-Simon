unit codes_postaux;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, IBODataset, Vcl.Grids, Wwdbigrd, Wwdbgrid, IB_Components, IB_Access;

type
  TForm_cp = class(TForm)
    grp_cp1: TGroupBox;
    grp_cp2: TGroupBox;
    btn_localites: TButton;
    wwDBGrid_localites_old: TwwDBGrid;
    wwDBGrid_localite_new: TwwDBGrid;
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
    ds_localite_old: TDataSource;
    ibdtbs_connexion: TIBODatabase;
    procedure btn_localitesClick(Sender: TObject);
    procedure edt_cpEnter(Sender: TObject);
    procedure btn_clearClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form_cp: TForm_cp;

implementation

{$R *.dfm}

procedure TForm_cp.btn_clearClick(Sender: TObject);
begin

    ibqry_localites_old.ParamByName('pcodepostal').AsString := edt_cp.Text;
    ibqry_localites_old.Active := True;
    wwDBGrid_localites_old.RedrawGrid;

    ibqry_localites_new.ParamByName('pcodepostal').AsString := edt_cp.Text;
    ibqry_localites_new.Active := True;
    wwDBGrid_localite_new.RedrawGrid;

    ibqry_etudiant.ParamByName('pcodepostal').AsString := edt_cp.Text;
    ibqry_etudiant.Active := True;
    wwDBGrid_etudiant.RedrawGrid;

    ibqry_anc_etudiant.ParamByName('pcodepostal').AsString := edt_cp.Text;
    ibqry_anc_etudiant.Active := True;
    wwDBGrid_anc_etudiant.RedrawGrid;



end;

procedure TForm_cp.btn_localitesClick(Sender: TObject);
var
  id_old, cp_old, nom_old: String;
  id_new, cp_new, nom_new: String;
  cpt_localite_old, cpt_localite_new, cpt_erreurs: integer;
  query : String;

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

  for cpt_localite_old := 0 to ibqry_localites_old.RecordCount - 1 do
  begin
    id_old := ibqry_localites_old.FieldByName('ID_LOCALITE').AsString;
    cp_old := ibqry_localites_old.FieldByName('CP').AsString;
    nom_old := ibqry_localites_old.FieldByName('NOM').AsString;

    //OutputDebugString(PChar('LOOP OLD : OLD : ' + id_old + ' ' + cp_old + ' ' + nom_old + ' NEW : ' + id_new + ' ' + cp_new + ' ' + nom_new));

    inc(cpt_erreurs);

    for cpt_localite_new := 0 to ibqry_localites_new.RecordCount - 1 do
    begin
      id_new := ibqry_localites_new.FieldByName('ID').AsString;
      cp_new := ibqry_localites_new.FieldByName('CP').AsString;
      nom_new := ibqry_localites_new.FieldByName('NOM').AsString;

      nom_new := UpperCase(nom_new);
      nom_old := UpperCase(nom_old);

      //OutputDebugString(PChar('LOOP NEW : OLD : ' + id_old + ' ' + cp_old + ' ' + nom_old + ' NEW : ' + id_new + ' ' + cp_new + ' ' + nom_new));

      if (cp_new = cp_old) then
      begin
     // OutputDebugString(PChar('NEW : OLD : ' + id_old + ' ' + cp_old + ' ' + nom_old + ' NEW : ' + id_new + ' ' + cp_new + ' ' + nom_new));
        if (nom_new = nom_old) then
        begin
        OutputDebugString(PChar('IDEM NEW : OLD : ' + id_old + ' ' + cp_old + ' ' + nom_old + ' NEW : ' + id_new + ' ' + cp_new + ' ' + nom_new));
      end
      else
        begin
//        OutputDebugString(PChar('DIFF NEW : OLD : ' + id_old + ' ' + cp_old + ' ' + nom_old + ' NEW : ' + id_new + ' ' + cp_new + ' ' + nom_new));
        end;
      end;


      {



          nom_new := ibqry_localites_new.FieldByName('NOM').AsString;
          // récupérer le nom avec la majuscule au début et ancien nom pour la DB
          // nom_new := ibqry_localites_new.FieldByName('NOM').AsString;
          // nom_old := ibqry_localites_old.FieldByName('NOM').AsString;

          nom_new := QuotedStr(nom_new);
          nom_old := QuotedStr(nom_old);

          query := 'UPDATE LOCALITES set LOCALITES.NOM = ' + nom_new + ' WHERE LOCALITES.NOM = ' + nom_old + ' AND LOCALITES.CP = ' + cp_new + '';

          OutputDebugString(pchar(query));
       }
        ibqry_localites_new.Next;

      end;
      ibqry_localites_new.First;


    ibqry_localites_old.Next;
     end;


  OutputDebugString(Pchar('Nombre d''erreurs ' + IntToStr(cpt_erreurs)));

  OutputDebugString(Pchar('DB ETUDIANT COUNT --->' + IntToStr(ibqry_etudiant.RecordCount)));
  OutputDebugString(Pchar('DB ANC ETUDIANT COUNT --->' + IntToStr(ibqry_anc_etudiant.RecordCount)));

end;

procedure TForm_cp.edt_cpEnter(Sender: TObject);
begin
  edt_cp.Text := '';

  ibqry_etudiant.Close;
  ibqry_anc_etudiant.Close;
  ibqry_localites_old.Close;
  ibqry_localites_new.Close;
end;

procedure TForm_cp.FormCreate(Sender: TObject);
begin
    ibqry_localites_old.ParamByName('pcodepostal').AsString := edt_cp.Text;
    ibqry_localites_old.Active := True;
    wwDBGrid_localites_old.RedrawGrid;

    ibqry_localites_new.ParamByName('pcodepostal').AsString := edt_cp.Text;
    ibqry_localites_new.Active := True;
    wwDBGrid_localite_new.RedrawGrid;

    ibqry_etudiant.ParamByName('pcodepostal').AsString := edt_cp.Text;
    ibqry_etudiant.Active := True;
    wwDBGrid_etudiant.RedrawGrid;

    ibqry_anc_etudiant.ParamByName('pcodepostal').AsString := edt_cp.Text;
    ibqry_anc_etudiant.Active := True;
    wwDBGrid_anc_etudiant.RedrawGrid;


end;

end.
