unit Unit1;

interface

uses
  SysUtils, Classes, Controls, Forms,
  IWVCLBaseContainer, IWColor, IWContainer, IWRegion, Data.DB, Vcl.Grids, Wwdbigrd, Wwdbgrid, IBODataset, Datasnap.DBClient, wwclient, IWHTMLContainer, IWHTML40Container;

type
  TIWFrame1 = class(TFrame)
    IWFrameRegion: TIWRegion;
    client_dset_1: TwwClientDataSet;
    ds1: TDataSource;
    ibqry1: TIBOQuery;
    wwDBGrid_allocFamil1: TwwDBGrid;
    intgrfldibqry1ID_ETUDIANT: TIntegerField;
    strngfldibqry1USERNAME: TStringField;
    strngfldtest: TStringField;
    procedure IWFrameRegionCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TIWFrame1.IWFrameRegionCreate(Sender: TObject);
begin

client_dset_1.CreateDataSet;

end;

end.