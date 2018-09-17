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

  // Même longueur que caractère pré-encodé ou validé
  if (Length(param_email) <= param_original_length) or v_valide_email = True
    }
>>>>>>> master

  if Length(text) = 0 then
  begin
        Result := 'Le nom ne peut pas être vide';
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
    Enlever les caractères indésirables (espaces, tirets)
    Déplacer les 4 premiers caractères à droite
    Substituer les lettres par des chiffres via une table de conversion (A=10, B=11, C=12 etc.)
    Diviser le nombre ainsi obtenu par 97. Si le reste n'est pas égal à 1 l'IBAN est incorrect : Modulo de 97 égal à 1
  }
  // Vérification au format Iban
  if param_iban = True then
  begin
    v_chaine := copy(param_NoCompte, 3, 12) + 'BE' + copy(param_NoCompte, 0, 2);
    // substitustion de BE par 11(=B)14(=E)
    v_chaine := copy(param_NoCompte, 3, 12) + '1114' +
      copy(param_NoCompte, 0, 2);
    // division du résultat par 97
    v_NoCompte_ok := ((Length(param_NoCompte) = 14) and
      ((StrToInt64(v_chaine)) mod 97 = 1)) or (param_NoCompte = '');
  end
  // Vériciation ancien format bancaire
  else if param_iban = False then
  begin
    // VB A vérifier si un jour nous remettons cela en production car j'ai dû modifier la manière de travailler
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

  // Même longueur que caractère pré-encodé ou validé
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
  v_value: Int64; // nécessaire pour la fonction TryStrToInt64

begin

  v_length := Length(param_mobile_phone_number);
  v_text_error := '';

  // Cas où rien n'est encodé
  if v_length = param_original_length then
  begin
    Result := v_text_error;
    exit();
  end;

  // Numéro avec préfixe International belge
  if LeftStr(param_mobile_phone_number, 3) = '+32' then
  begin
    if v_length <> c_belgium_mobile_phone_international_length then
    begin
      v_text_error := v_text_error +
        '- Le n° de gsm Belge avec préfixe international doit contenir 12 caractères'
        + #13#10;
    end;
  end
  // Numéro avec préfixe International
  else if LeftStr(param_mobile_phone_number, 1) = '+' then
  begin
    if v_length <= c_international_mobile_phone_length then
    begin
      v_text_error := v_text_error +
        '- Le n° de gsm international doit contenir MINIMUM 8 chiffres'
        + #13#10;
    end;
  end
  // Encodage n° belge sans préfixe international
  else
  begin
    if v_length <> c_belgium_mobile_phone_length then
    begin
      v_text_error := v_text_error +
        '- Le n° de gsm Belge doit comporter 10 chiffres' + #13#10;
    end;
    if TryStrToInt64(param_mobile_phone_number, v_value) = False then
    begin
      v_text_error := v_text_error +
        '- Le n° de gsm Belge doit UNIQUEMENT comporter des chiffres' + #13#10;
    end;
    if LeftStr(param_mobile_phone_number, 1) <> '0' then
    begin
      v_text_error := v_text_error +
        '- Le n° de gsm Belge doit COMMENCER par "0" ' + #13#10;
    end;
  end;
  // On envoit le résultat de vérification en texte pour gérer de manière globale dans les formulaires.
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
  // Si vide et si vide au départ, on ne bloque pas
  if (Trim(v_national_id) = '') and
    (v_originalLength = Length(Trim(v_national_id))) then
    Result := True
  else
    // Vérification que nous avons une valeur numérique
    if TryStrToInt64(v_national_id, v_value) = False then
    begin
      Result := False;
      ShowMessage('N° National' + #13#13 +
        'Le numéro national n''est pas un nombre correct')
    end
    // Si valeur numérique, vérification de la taille et modulo
    else if ((Length(v_national_id) = v_length) and
      (StrToInt64(copy(v_national_id, 10, 2)) = 97 -
      StrToInt64(copy(v_national_id, 1, 9)) mod 97)) then
      Result := True
    else
    begin
      Result := False;
      ShowMessage('N° National' + #13#13 +
        'Le numéro national n''est pas correct.' + #13 +
        'Vérifiez votre encodage');
    end;
end;

function f_ibis_number(ibis_number: string; FirstLetterName: string;
  original_length: Integer): Boolean;
// Vérification numéro d'Actiris

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

  // Si vide et si vide au départ, on ne bloque pas
  if (Trim(v_ibis_number) = '') and
    (v_originalLength = Length(Trim(v_ibis_number))) then
    Result := True
  else
    // Vérification que nous avons une valeur alphanumérique et la longueur
    if v_originalLength in [0, 9] then
      if TryStrToInt64(v_LastCharacterIbis, v_value) = False then
      begin
        Result := False;
        ShowMessage('N° IBIS' + #13#13 +
          'Les caractères 2 à 9 du numéro IBIS n''est pas un nombre entier correct')
      end
      else if IsLetter(v_ibis_number, 1) = False then
      begin
        Result := False;
        ShowMessage('N° IBIS' + #13#13 +
          'Le premier caractère doit être une lettre')
      end
      else if (Length(v_ibis_number) <> v_length) then
      begin
        Result := False;
        ShowMessage('N° IBIS' + #13#13 +
          'Le n° IBIS doit comporter 9 caractères')
      end
      // Si valeur alphanumérique, on vérifie que la première lettre est égale à celle du nom
      else if v_FirstLetterName <> v_FirstCharacterIbis then
      begin
        ShowMessage('N° IBIS' + #13#13 +
          'Le premier caractère du n° IBIS doit être le premier caractère du nom de l''etudiant.');
        Result := False
      end
      else
        Result := True;
end;

end.
