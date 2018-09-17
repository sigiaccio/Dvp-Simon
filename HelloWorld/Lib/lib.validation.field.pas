unit lib.validation.field;

interface

uses
  Dialogs,
  SysUtils,
  Winapi.Windows,
  System.Character,
  System.StrUtils,
  System.RegularExpressions;

function f_national_id(national_id: string; original_length: Integer): Boolean;
function f_ibis_number(ibis_number: string; FirstLetterName: string;
  original_length: Integer): Boolean;
function f_mobile_phone(param_mobile_phone_number: string;
  param_original_length: Integer): string;
function f_email(param_email: string; param_original_length: Integer): string;
function f_compte_bancaire(param_NoCompte: String; param_iban: Boolean)
  : Boolean;
function f_check_text(text: String; original_length: Integer): string;

const
  LongNoIBIS = 9;
  LongNoInscFOREM = 8;
  LongNoNational = 11;
  c_belgium_mobile_phone_international_length = 12;
  c_belgium_mobile_phone_length = 10;
  c_international_mobile_phone_length = 8;

implementation

<<<<<<< HEAD
function f_check_text(text: String; original_length: Integer): string;
var
  size: Integer;

begin

  // verify if null
  // verify lenght
  // verify if string
  // verify if special caracter
  //
=======
function f_check_text(text: String; text_empty: Boolean; text_regex: String) : string;
var
  v_size: Integer;
  v_regex_email: Tregex;
  v_valide_email: Boolean;


begin

  // check if variable can be null
  if text_empty := True then
  begin
       Exit;
  else


  end;



   {

  v_regex_email := Tregex.Create
    ('^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]*[a-zA-Z0-9]+$');
  v_valide_email := v_regex_email.Match(param_email).Success;

  // M�me longueur que caract�re pr�-encod� ou valid�
  if (Length(param_email) <= param_original_length) or v_valide_email = True
    }
>>>>>>> master

  if Length(text) = 0 then
  begin
        Result := 'Le nom ne peut pas �tre vide';
//        OutputDebugString(Pchar('NOM VIDE '+ IntToStr(Length(text)) + ' ' + inttostr(original_length)));
  end
  else
  begin
      Result := 'OK';
      OutputDebugString(Pchar('f_check_text : ' + text + ' lenght ' +
    inttostr(original_length)));


  end;

end;

function f_compte_bancaire(param_NoCompte: String; param_iban: Boolean)
  : Boolean;
var
  v_chaine: String;
  v_NoCompte_ok: Boolean;
begin
  {
    http://fr.wikipedia.org/wiki/ISO_13616
    Enlever les caract�res ind�sirables (espaces, tirets)
    D�placer les 4 premiers caract�res � droite
    Substituer les lettres par des chiffres via une table de conversion (A=10, B=11, C=12 etc.)
    Diviser le nombre ainsi obtenu par 97. Si le reste n'est pas �gal � 1 l'IBAN est incorrect : Modulo de 97 �gal � 1
  }
  // V�rification au format Iban
  if param_iban = True then
  begin
    v_chaine := copy(param_NoCompte, 3, 12) + 'BE' + copy(param_NoCompte, 0, 2);
    // substitustion de BE par 11(=B)14(=E)
    v_chaine := copy(param_NoCompte, 3, 12) + '1114' +
      copy(param_NoCompte, 0, 2);
    // division du r�sultat par 97
    v_NoCompte_ok := ((Length(param_NoCompte) = 14) and
      ((StrToInt64(v_chaine)) mod 97 = 1)) or (param_NoCompte = '');
  end
  // V�riciation ancien format bancaire
  else if param_iban = False then
  begin
    // VB A v�rifier si un jour nous remettons cela en production car j'ai d� modifier la mani�re de travailler
    // v_NoCompte_ok := ((Length(param_NoCompte) = 12)
    // or ((StrToInt64(Copy(param_NoCompte, 1, 10)) mod 97
    // = StrToInt(Copy(param_NoCompte, 11, 2)) mod 97)
    // or (StrToInt(Copy(param_NoCompte, 11, 2)) < 97))
    // or (Copy(param_NoCompte, 1, 3) <> '040'))
    // and (param_NoCompte = '');
  end;

  if v_NoCompte_ok = True then
  begin
    Result := True;
  end
  else
  begin
    Result := False;
  end;

end;

function f_email(param_email: string; param_original_length: Integer): string;
var
  v_regex_email: Tregex;
  v_valide_email: Boolean;
begin
  v_regex_email := Tregex.Create
    ('^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]*[a-zA-Z0-9]+$');
  v_valide_email := v_regex_email.Match(param_email).Success;

  // M�me longueur que caract�re pr�-encod� ou valid�
  if (Length(param_email) <= param_original_length) or v_valide_email = True
  then
  begin
    Result := '';
  end
  else if v_valide_email = False then
  begin
    Result := '- Email : Erreur dans la syntaxe';
  end;
end;

function f_mobile_phone(param_mobile_phone_number: string;
  param_original_length: Integer): string;

var
  v_length: Integer;
  v_text_error: string;
  v_value: Int64; // n�cessaire pour la fonction TryStrToInt64

begin

  v_length := Length(param_mobile_phone_number);
  v_text_error := '';

  // Cas o� rien n'est encod�
  if v_length = param_original_length then
  begin
    Result := v_text_error;
    exit();
  end;

  // Num�ro avec pr�fixe International belge
  if LeftStr(param_mobile_phone_number, 3) = '+32' then
  begin
    if v_length <> c_belgium_mobile_phone_international_length then
    begin
      v_text_error := v_text_error +
        '- Le n� de gsm Belge avec pr�fixe international doit contenir 12 caract�res'
        + #13#10;
    end;
  end
  // Num�ro avec pr�fixe International
  else if LeftStr(param_mobile_phone_number, 1) = '+' then
  begin
    if v_length <= c_international_mobile_phone_length then
    begin
      v_text_error := v_text_error +
        '- Le n� de gsm international doit contenir MINIMUM 8 chiffres'
        + #13#10;
    end;
  end
  // Encodage n� belge sans pr�fixe international
  else
  begin
    if v_length <> c_belgium_mobile_phone_length then
    begin
      v_text_error := v_text_error +
        '- Le n� de gsm Belge doit comporter 10 chiffres' + #13#10;
    end;
    if TryStrToInt64(param_mobile_phone_number, v_value) = False then
    begin
      v_text_error := v_text_error +
        '- Le n� de gsm Belge doit UNIQUEMENT comporter des chiffres' + #13#10;
    end;
    if LeftStr(param_mobile_phone_number, 1) <> '0' then
    begin
      v_text_error := v_text_error +
        '- Le n� de gsm Belge doit COMMENCER par "0" ' + #13#10;
    end;
  end;
  // On envoit le r�sultat de v�rification en texte pour g�rer de mani�re globale dans les formulaires.
  // Si v_text_error ='' => pas d'erreur
  Result := v_text_error;

end;

function f_national_id(national_id: string; original_length: Integer): Boolean;

var
  v_originalLength: Integer;
  v_length: Integer;
  v_national_id: string;
  v_value: Int64;
begin
  v_originalLength := original_length;
  v_national_id := national_id;
  v_length := LongNoNational;
  // Si vide et si vide au d�part, on ne bloque pas
  if (Trim(v_national_id) = '') and
    (v_originalLength = Length(Trim(v_national_id))) then
    Result := True
  else
    // V�rification que nous avons une valeur num�rique
    if TryStrToInt64(v_national_id, v_value) = False then
    begin
      Result := False;
      ShowMessage('N� National' + #13#13 +
        'Le num�ro national n''est pas un nombre correct')
    end
    // Si valeur num�rique, v�rification de la taille et modulo
    else if ((Length(v_national_id) = v_length) and
      (StrToInt64(copy(v_national_id, 10, 2)) = 97 -
      StrToInt64(copy(v_national_id, 1, 9)) mod 97)) then
      Result := True
    else
    begin
      Result := False;
      ShowMessage('N� National' + #13#13 +
        'Le num�ro national n''est pas correct.' + #13 +
        'V�rifiez votre encodage');
    end;
end;

function f_ibis_number(ibis_number: string; FirstLetterName: string;
  original_length: Integer): Boolean;
// V�rification num�ro d'Actiris

var
  v_originalLength: Integer;
  v_FirstLetterName: string;
  v_length: Integer;
  v_ibis_number: string;
  v_value: Int64;
  v_FirstCharacterIbis: string;
  v_LastCharacterIbis: string;

begin
  v_originalLength := original_length;
  v_FirstLetterName := FirstLetterName;
  v_ibis_number := ibis_number;
  v_length := LongNoIBIS;
  v_FirstCharacterIbis := uppercase(copy(v_ibis_number, 1, 1));
  v_LastCharacterIbis := copy(v_ibis_number, 2, 8);

  // Si vide et si vide au d�part, on ne bloque pas
  if (Trim(v_ibis_number) = '') and
    (v_originalLength = Length(Trim(v_ibis_number))) then
    Result := True
  else
    // V�rification que nous avons une valeur alphanum�rique et la longueur
    if v_originalLength in [0, 9] then
      if TryStrToInt64(v_LastCharacterIbis, v_value) = False then
      begin
        Result := False;
        ShowMessage('N� IBIS' + #13#13 +
          'Les caract�res 2 � 9 du num�ro IBIS n''est pas un nombre entier correct')
      end
      else if IsLetter(v_ibis_number, 1) = False then
      begin
        Result := False;
        ShowMessage('N� IBIS' + #13#13 +
          'Le premier caract�re doit �tre une lettre')
      end
      else if (Length(v_ibis_number) <> v_length) then
      begin
        Result := False;
        ShowMessage('N� IBIS' + #13#13 +
          'Le n� IBIS doit comporter 9 caract�res')
      end
      // Si valeur alphanum�rique, on v�rifie que la premi�re lettre est �gale � celle du nom
      else if v_FirstLetterName <> v_FirstCharacterIbis then
      begin
        ShowMessage('N� IBIS' + #13#13 +
          'Le premier caract�re du n� IBIS doit �tre le premier caract�re du nom de l''etudiant.');
        Result := False
      end
      else
        Result := True;
end;

end.
