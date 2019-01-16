unit villes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, IBODataset, IB_Components, IB_Access, Vcl.Grids, Wwdbigrd, Wwdbgrid, Vcl.StdCtrls;

type
  Tfrm_villes = class(TForm)
    ibdtbs_connexion: TIBODatabase;
    qry_villes: TIBOQuery;
    grid_villes: TwwDBGrid;
    ds_villes: TDataSource;
    strngfld_villesVILLE: TStringField;
    strngfld_villesPAYS: TStringField;
    edt_ville: TEdit;
    btn_ville: TButton;
    edt_villenew: TEdit;
    lbl_fleche: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure grid_villesDblClick(Sender: TObject);
    procedure grid_villesKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_villes: Tfrm_villes;

implementation

{$R *.dfm}

procedure Tfrm_villes.FormCreate(Sender: TObject);
begin
  qry_villes.Active := True;
end;

procedure Tfrm_villes.grid_villesDblClick(Sender: TObject);
begin
  edt_ville.Text := strngfld_villesVILLE.AsString;
end;

procedure Tfrm_villes.grid_villesKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  edt_ville.Text := strngfld_villesVILLE.AsString;
end;

end.
