unit Uvilles;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Wwdbigrd, Wwdbgrid, Data.DB, IB_Components, IB_Access, IBODataset, Vcl.StdCtrls;

type
  Tfrm_villes = class(TForm)
    qry_villes: TIBOQuery;
    qry_localites: TIBOQuery;
    ibdtbs_connexion: TIBODatabase;
    ds_villes: TDataSource;
    ds_localites: TDataSource;
    grid_villes: TwwDBGrid;
    grid_localites: TwwDBGrid;
    btn_update: TButton;
    procedure btn_updateClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_villes: Tfrm_villes;

implementation

{$R *.dfm}

procedure Tfrm_villes.btn_updateClick(Sender: TObject);
var cpt_ville, cpt_localite : Integer;
begin
  OutputDebugString(pchar('BOUTON VILLE'));

  cpt_localite := qry_localites.RecordCount;
  cpt_ville := qry_villes.RecordCount;

  OutputDebugString(pchar('Nbre de ville '+IntToStr(cpt_ville)));
  OutputDebugString(pchar('Nbre de localités '+IntToStr(cpt_localite)));

  cpt_ville := 0;
  cpt_localite := 0;

  while not ds_localites.DataSet.Eof do
  begin
    //  OutputDebugString(PChar(IntToStr(cpt_localite)+' '+qry_localites.FieldByName('NOM').AsString));
      ds_localites.DataSet.Next;
  while not ds_villes.DataSet.Eof  do
  begin
  OutputDebugString(PChar(IntToStr(cpt_localite)+' '+qry_localites.FieldByName('NOM').AsString));
      OutputDebugString(PChar(IntToStr(cpt_ville)+' '+qry_villes.FieldByName('NOM').AsString));
        if AnsiLowerCase(qry_localites.FieldByName('NOM').AsString) = AnsiLowerCase(qry_villes.FieldByName('NOM').AsString) then
        begin
          OutputDebugString(pchar('identique '+qry_villes.FieldByName('NOM').AsString+' '+qry_localites.FieldByName('NOM').AsString));
        end;

        ds_villes.DataSet.Next;

     Inc(cpt_ville);
  end;
     Inc(cpt_localite);
  end;

end;

end.
