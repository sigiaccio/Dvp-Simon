unit cadreAFSTIBOnemU;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, IBODataset, StdCtrls, ComCtrls, Datasnap.DBClient, Vcl.Grids, Wwdbigrd,
  Wwdbgrid, System.DateUtils, IB_Grid, wwclient, IB_Components, IB_Access;

type
  TAllocFamFrm = class(TFrame)
    PgCtrl: TPageControl;
    AFTbSht: TTabSheet;
    OnemTbSht: TTabSheet;
    PeriodesOnemScrllBx: TScrollBox;
    Label5: TLabel;
    PerSubLbl: TLabel;
    ds_allocFamil: TDataSource;
    grid_allocFamil: TwwDBGrid;
    qry_allocFamil: TIBOQuery;
    btn_allocFamil2: TButton;
    dset_allocFamil: TwwClientDataSet;
    dateDebut: TDateTimeField;
    dateFin: TDateTimeField;
    secondaire: TFloatField;
    superieur: TFloatField;
    ects: TFloatField;
    allocFamiltest: TwwDBGrid;
    ibdtbs_connexion: TIBODatabase;
    qry_allocFamilNO_CLASSE: TIntegerField;
    qry_allocFamilDENOM_CRT: TStringField;
    qry_allocFamilSEC_SUP: TStringField;
    qry_allocFamilDATE_DEB: TDateField;
    qry_allocFamilDATE_FIN: TDateField;
    qry_allocFamilNB_PERIODES: TSmallintField;
    qry_allocFamilNB_PERIODES_STAGE: TSmallintField;
    qry_allocFamilPERIODES_SEMAINE: TIBOBCDField;
    qry_allocFamilECTS_NBR: TIntegerField;
    ds_allocFamiTEST: TDataSource;
    strngfld_allocFamilMAT_ETUD: TStringField;
    procedure btn_allocFamil2Click(Sender: TObject);
  private
    { Déclarations privées }
    STIBOK: Boolean;
  public
    { Déclarations publiques }
    procedure AllocFam(LstClasses: TStringList);
    function EnOrdreSTIB: Boolean;
  end;

implementation

{$R *.DFM}

uses BDU, Math, calcPeriodesAFSTIBOnemU, selectEtudU;

procedure TAllocFamFrm.AllocFam(LstClasses: TStringList);
var
  I: Integer;
  LstPeriodesAF: TLstPeriodesAF;
  LstPeriodesSTIB: TLstPeriodesAF;
  LstPeriodesOnem: TLstPeriodesAF;
  Couleur: TColor;

  procedure AjouterLabel(ScrllBx: TScrollBox; PosV, PosH, Taille: Integer;
    Couleur: TColor; Texte: String);
  var
    Lbl: TLabel;
  begin
    Lbl := TLabel.Create(nil);
    Lbl.Top := PosV;
    Lbl.Left := PosH;
    Lbl.Width := Taille;
    Lbl.Caption := Texte;
    Lbl.Font.Color := Couleur;
    Lbl.Font.Size := 10;
    Lbl.Font.Style := [fsBold];
    ScrllBx.InsertControl(Lbl);
  end;

  procedure ViderScrollBox(ScrllBx: TScrollBox);
  var
    Ctrl: TControl;
  begin
    while (ScrllBx.ControlCount > 0) do
    begin
      Ctrl := ScrllBx.Controls[0];
      Ctrl.Parent := nil;
      Ctrl.Free;
    end;
  end;

begin
  calcPeriodesAFSTIBOnemDM.CreerLstPeriodesClasses(LstClasses, LstPeriodesAF,
    LstPeriodesSTIB, LstPeriodesOnem);

  ViderScrollBox(PeriodesOnemScrllBx);

  for I := 0 to LstPeriodesOnem.NbElem - 1 do
  begin
    with LstPeriodesOnem[I] do
    begin
      Couleur := IfThen(NbPer >= NbPerOnemMin, clGreen, clRed);

      AjouterLabel(PeriodesOnemScrllBx, 5 + I * 18, 3, 80, Couleur,
        FormatDateTime('dd"/"mm', DateDeb) + '-' + FormatDateTime('dd"/"mm',
        dateFin));
      AjouterLabel(PeriodesOnemScrllBx, 5 + I * 18, PerSubLbl.Left, 60, Couleur,
        Format('%.1f', [NbPer]));
    end;
  end;

  LstPeriodesAF.Free;
  LstPeriodesSTIB.Free;
  LstPeriodesOnem.Free;
end;

procedure TAllocFamFrm.btn_allocFamil2Click(Sender: TObject);
var
  debug, nb_diffDate, nb_colonne, nb_ligne, nb_init, nb_niveau,
    nb_compPeriod: Integer;
  day, niveau: String;
  startDate2, endDate2, period: TStringList;
  sepDate: TDateTime;
  annee, mois, jour: word;
  id_week: Integer;
  start_date, end_date, start_date_tmp, start_date_aff, end_date_tmp,
    end_date_aff: TDateTime;
  date_deb, date_fin: string;
  nb_period, nb_period_previous, nb_period_next, nb_period_secondaire,
    nb_period_superieur, nb_ects: double;
    tableauAllocationsFamiliales:
  array [0 .. 51] of array [0 .. 3] of double;

begin



  qry_allocFamil.ParamByName('PMatEtud').AsString := '2010004939';



  //ibqry_getStudents.FieldByName('MAT_ETUD').AsString;

  // NomPrenomMatLbl.Text;
//    ConsultEtudU.ConsultEtudFm.NomPrenomMatEdt.Text

qry_allocFamil.Active := True;

  // 4 colonnes et 36 lignes
  // COLONNES : Secondaire | Supérieur | ECTS
  // LIGNES : semaine 1 --> 52 (52 semaines = 1 année)

  // ShowMessage(IntToStr(WeekOfYear(StrToDateTime(qry_allocFamil.FieldByName('date_deb').AsString))));

    //dset_allocFamil.EmptyDataSet;

    // CALCULER ALLOCATIONS FAMILIALES
    // for nb_ligne := 0 to High(tableauAllocationsFamiliales[nb_colonne]) do

    // find first week from DB
    qry_allocFamil.First;
    id_week := WeekOfTheYear(StrToDateTime(qry_allocFamil.FieldByName('date_deb')
      .AsString));

    // initialize tab with index week 1 --> 52
    nb_ligne := id_week;
    nb_init := 0;
    while nb_init < 52 do
    begin
      tableauAllocationsFamiliales[nb_init, 0] := nb_ligne;
       OutputDebugString(Pchar('TabAF = ' + FloatToStr(tableauAllocationsFamiliales[nb_colonne, nb_ligne])));
       OutputDebugString(Pchar('Colonne ' + FloatToStr(nb_colonne) + ' Ligne ' + IntToStr(nb_ligne)));

      if nb_ligne = 52 then
      begin
        nb_ligne := 0;
      end;

      inc(nb_init);
      inc(nb_ligne);
    end;

    // calculate the week number of the query alloc
    // insert in the table in the right column

    // WeekOfTheYear(); delphi
    nb_ligne := 0;
    start_date_tmp := qry_allocFamil.FieldByName('date_deb').AsDateTime;

    while nb_ligne < qry_allocFamil.RecordCount do
    begin
      // retrieve the week's number
      start_date := qry_allocFamil.FieldByName('date_deb').AsDateTime;
      end_date := qry_allocFamil.FieldByName('date_fin').AsDateTime;
      // function : search week of the year with a date
      id_week := WeekOfTheYear(StrToDateTime(qry_allocFamil.FieldByName('date_deb')
        .AsString));

      // OutputDebugString(Pchar('AF ID WEEK FIRST' + IntToStr(id_week)));
      for nb_init := 0 to Length(tableauAllocationsFamiliales) - 1 do
      begin
        nb_niveau := 0;
        if tableauAllocationsFamiliales[nb_init, nb_niveau] = id_week then
        begin
          // OutputDebugString(PChar('--- tab AF = id WEEK ---'+IntToStr(id_week)));
          id_week := nb_init;
          break;
        end;
      end;

      // OutputDebugString(Pchar('ID_WEEK ' + IntToStr(id_week)));

      niveau := qry_allocFamil.FieldByName('SEC_SUP').AsString;

      if niveau = 'SEC' then
      begin
        nb_niveau := 1;
      end
      else if niveau = 'SUP' then
      begin
        nb_niveau := 2;
      end
      else
      begin
        // ETCS gestion du cas non présent dans la requête (colonne niveau): 3
        nb_niveau := 3;
      end;

      // SECONDAIRE | SUPERIEUR | SEC/SUP | ECTS
      // tableauAllocationsFamiliales[id_week][nb_niveau] := StrToInt(qry_allocFamil.FieldByName('PERIODES_SEMAINE').AsString);

      nb_period := qry_allocFamil.FieldByName('PERIODES_SEMAINE').AsFloat;
      nb_ects := qry_allocFamil.FieldByName('ects_nbr').AsFloat;

      // tableauAllocationsFamiliales[id_week,nb_niveau] := tableauAllocationsFamiliales[id_week,nb_niveau] + nb_period;

      while IncDay(start_date, 6) <= end_date do
      begin
        // OutputDebugString(Pchar('TAB AF [' + IntToStr(id_week) + ',' + IntToStr(nb_niveau) + '] PERIODES_SEMAINE ' + qry_allocFamil.FieldByName('PERIODES_SEMAINE').AsString));
        // OutputDebugString(Pchar('End date <= start date +6 ' + DateTimeToStr(end_date) + ' --- ' + DateTimeToStr(IncDay(start_date, 7))));
        // OutputDebugString(Pchar('ID_WEEK ' + IntToStr(id_week)));

        tableauAllocationsFamiliales[id_week, nb_niveau] :=
          tableauAllocationsFamiliales[id_week, nb_niveau] + nb_period;

        tableauAllocationsFamiliales[id_week, 3] := tableauAllocationsFamiliales
          [id_week, 3] + nb_ects;

        start_date := IncDay(start_date, 7);

        if IncDay(id_week) <= 52 then
        begin
          inc(id_week);
        end
        else if IncDay(id_week) = 53 then
        begin
          id_week := 0;
        end

      end;

      qry_allocFamil.Next;
      inc(nb_ligne);

    end;

    // display of information containing in the table with dates range
    nb_period := 0;
    nb_period_previous := 0;
    // for nb_colonne := 0 to 3 do
    // id_week := WeekOfTheYear(StrToDateTime(qry_allocFamil.FieldByName('date_deb').AsString));
    nb_compPeriod := 0;
    nb_ligne := 0;



    start_date_aff := start_date_tmp;

    while nb_ligne < 51 do
    begin
      // OutputDebugString(Pchar('__LOOP___'+IntToStr(nb_ligne)));
      end_date := IncDay(start_date_tmp, 6);
      end_date_aff := IncDay(start_date_tmp, 6);

      nb_period := tableauAllocationsFamiliales[nb_ligne, nb_niveau];
      nb_period_next := tableauAllocationsFamiliales[nb_ligne + 1, nb_niveau];
      nb_period_secondaire := tableauAllocationsFamiliales[nb_ligne, 1];
      nb_period_superieur := tableauAllocationsFamiliales[nb_ligne, 2];
      nb_ects := tableauAllocationsFamiliales[nb_ligne, 3];

      // nb_period : période en cours
      // nb_period_previous : période précédente

      if nb_period_previous = nb_period then
      begin
        end_date_aff := end_date;

        // OutputDebugString(Pchar('#1## ' + DateTimeToStr(start_date_aff) +' '+DateTimeToStr(end_date_aff)));
      end
      else if (nb_period_previous <> nb_period) and (nb_period_next <> nb_period)
      then
      begin
        OutputDebugString(Pchar('#2## ' + DateTimeToStr(start_date_aff) + ' ' +
          DateTimeToStr(end_date_aff) + ' ' + FloatToStr(nb_period)));
              // view in the GRID
        dset_allocFamil.Append;

        dset_allocFamil.FieldByName('dateDebut').AsDateTime :=
          start_date_aff;
        dset_allocFamil.FieldByName('dateFin').AsDateTime := end_date_aff;
        dset_allocFamil.FieldByName('secondaire').AsFloat :=
          nb_period_secondaire;
        dset_allocFamil.FieldByName('superieur').AsFloat :=
          nb_period_superieur;
        dset_allocFamil.FieldByName('ects').AsFloat := nb_ects;
        // dset_allocFamil.FieldByName('SecondaireSuperieur').AsFloat := nb_period_secondaire + nb_period_superieur;

        start_date_aff := IncDay(end_date, 1);
        end_date_aff := end_date;
        nb_period_previous := nb_period;

      end;

      start_date_tmp := IncDay(start_date_tmp, 7);
      // start_date_aff := IncDay(start_date_aff, 7);
      // start_date := IncDay(start_date, 6);

      inc(nb_ligne);

  end;

  end;

  function TAllocFamFrm.EnOrdreSTIB: Boolean;
  begin
    Result := STIBOK;
  end;

end.
