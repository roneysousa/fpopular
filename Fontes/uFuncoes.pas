unit uFuncoes;

interface

Uses DBClient, wcrypt2;

// Funcões e procedures para o sistema.
type
    TTypeLocalizar = (fsInteger, fsString);
    Function StrZero(Zeros:string;Quant:integer):String;
    function Empty(inString:String): Boolean;
    Function SysComputerName: string;
    Function ContaCaracs(Edit:String): integer;
    Function Replicate( Caracter:String; Quant:Integer ): String;
    Function CPF(num: string): boolean;
    Function CGC(num: string): boolean;
    Function Alltrim(const Search: string): string;
    Function Datafinal(dataini:tdatetime; dias_uteis:integer):tdatetime;
    Function DataExtenso(Data:TDateTime): String;
    Function MesExtenso (xMes : TDateTime) : string;
    function StrToPChar(const Str: string): PChar;
    Function Arredondar(Valor: Double; Dec: Integer): Double;
    Function tbReplChar(const Ch: Char; const Len: integer): string;
    Function Padr(s:string;n:integer):string;
    Function Justifica(mCad:string;mMAx:integer):string;
    function extenso (valor: real): string;
    function Maiuscula(Texto:String): String;
    Function DiadaSemana(Data : String) : string;
    function RemoveChar(Const Texto:String):String;
    function StrIsFloat(const S: string): boolean;
    function StrIsInteger(const S: string): boolean;
    function CalculaCnpjCpf(Numero : String) : String;
    function FormataCPF(cTexto : String) : String;
    function percorreArquivoTexto ( nomeDoArquivo: String ) : String;
    Procedure FilterCDS(aCds : TClientDataSet; aType : TTypeLocalizar ; aBusca : String);
    procedure RefreshCDS(aDateSet : TClientDataSet);
    function RemoveAcento(Str:String): String;
    function ReplaceStr (Text,oldstring,newstring:string):string;
    function FormataCNPJ(CNPJ: string): string;
    function MD5(const Input: string): string;
    function TrocaCaracterEspecial(aTexto : string; aLimExt : boolean) : string;

    //Declarações
    Function IdentificaEstacao: PChar; stdcall; external 'gbasmsb_library.dll';
    Function PegaSolicitacao(cCNPJ, cCPJ, cCRM, cUFCRM, cDataEmissao: Pchar): Pchar; cdecl; external 'gbasmsb_library.dll';
    Function PegaConfirmacao(cCNPJ, cNumAutorizacao, cCupomFiscal: Pchar): Pchar; cdecl; external 'gbasmsb_library.dll';

const
    MSG_OK   = 'Registro gravado com sucesso.';
    MSG_ERRO = 'Erro ao tentar gravar registro.';
    MSG_PERGUTA = 'Deseja excluir este registro?';
    MSG_PERMISSOES = 'Você não tem pemissão para isto';
    MSG_ERROR = 'Ocorreu um erro!';
    chave = 'email';
    aCorGrid = 'clSkyBlue';
    M_PASTA_REQ  = 'C:\INFOG2\FARMA\POP_REQ';
    M_PASTA_RESP = 'C:\INFOG2\FARMA\POP_RESP';

implementation

uses
  SysUtils, Types, Windows, Dialogs;

function CalculaCnpjCpf(Numero : String) : String;
var
  i,j,k, Soma, Digito : Integer;
  CNPJ : Boolean;
begin
  Result := Numero;
  case Length(Numero) of
  9:
  CNPJ := False;
  12:
  CNPJ := True;
  else
  Exit;
  end;
  for j := 1 to 2 do
  begin
  k := 2;
  Soma := 0;
  for i := Length(Result) downto 1 do
  begin
  Soma := Soma + (Ord(Result[i])-Ord('0'))*k;
  Inc(k);
  if (k > 9) and CNPJ then
  k := 2;
  end;
  Digito := 11 - Soma mod 11;
  if Digito >= 10 then
  Digito := 0;
  Result := Result + Chr(Digito + Ord('0'));
  end;
end;

function FormataCPF(cTexto : String) : String;
begin
     //  999.999.999-99
     result := Copy(cTexto,1,3)+'.'+
               Copy(cTexto,4,3)+'.'+
               Copy(cTexto,7,3)+'-'+
               Copy(cTexto,10,2);
end;

function RemoveChar(Const Texto:String):String;
//
// Remove caracteres de uma string deixando apenas numeros
//
var
I: integer;
S: string;
begin
S := '';
for I := 1 To Length(Texto) Do
   begin
   if (Texto[I] in ['0'..'9']) then
       begin
       S := S + Copy(Texto, I, 1);
       end;
   end;
result := S;
end;

function StrIsInteger(const S: string): boolean;
// Verificar se uma string contém um valor inteiro válido
begin
  try
      StrToInt(S);
      Result := true;
  except
      Result := false;
  end;
end;


function StrIsFloat(const S: string): boolean;
// Verificar se uma string contém um valor numérico válido
begin
  try
  StrToFloat(S);
  Result := true;
  except
  Result := false;
  end;
end;

function StrZero(Zeros:string;Quant:integer):String;
{Insere Zeros à frente de uma string}
var
I,Tamanho:integer;
aux: string;
begin
  aux := zeros;
  Tamanho := length(ZEROS);
  ZEROS:='';
  for I:=1 to quant-tamanho do
  ZEROS:=ZEROS + '0';
  aux := zeros + aux;
  StrZero := aux;
end;

Function Padr(s: string; n: integer): string;
{alinha uma string à direita}
begin
       Result:=Format('%'+IntToStr(n)+'.'+IntToStr(n)+'s',[s]);
end;


Function tbReplChar(const Ch: Char; const Len: integer): string;
var
  I: integer;
begin
  SetLength(Result, Len);
  for I := 1 to Len do
  Result[I] := Ch;
end;

function Empty(inString:String): Boolean;
{Testa se a variavel está vazia ou não}
Var
  index : Byte;
Begin
  index := 1;
  Empty := True;
  while (index <= Length(inString))and (index <> 0) do
  begin
  if inString[index] = ' ' Then
  begin
inc(index)
  end
  else
Begin
  Empty := False;
  index := 0
end;
  end;
end;


{ Sys }
function SysComputerName: string;
var
  I: DWord;
begin
  I := MAX_COMPUTERNAME_LENGTH + 1;
  SetLength(Result, I);
  GetComputerName(PChar(Result), I);
  Result := string(PChar(Result));
end;

Function ContaCaracs(Edit: String): integer;
{Retorna quantos caracteres tem um Edit especificado}
begin
     Result := Length(Edit);
end;

function Replicate(Caracter: String; Quant: Integer): String;
{Repete o mesmo caractere várias vezes}
var I : Integer;
begin
Result := '';
  for I := 1 to Quant do
  Result := Result + Caracter;
end;

Function CPF(num: string): boolean;
var
n1,n2,n3,n4,n5,n6,n7,n8,n9: integer;
d1,d2: integer;
digitado, calculado: string;
begin
n1:=StrToInt(num[1]);
n2:=StrToInt(num[2]);
n3:=StrToInt(num[3]);
n4:=StrToInt(num[4]);
n5:=StrToInt(num[5]);
n6:=StrToInt(num[6]);
n7:=StrToInt(num[7]);
n8:=StrToInt(num[8]);
n9:=StrToInt(num[9]);
d1:=n9*2+n8*3+n7*4+n6*5+n5*6+n4*7+n3*8+n2*9+n1*10;
d1:=11-(d1 mod 11);
if d1>=10 then d1:=0;
d2:=d1*2+n9*3+n8*4+n7*5+n6*6+n5*7+n4*8+n3*9+n2*10+n1*11;
d2:=11-(d2 mod 11);
if d2>=10 then d2:=0;
calculado:=inttostr(d1)+inttostr(d2);
digitado:=num[10]+num[11];
if calculado=digitado then
  cpf:=true
  else
  cpf:=false;
end;

function cgc(num: string): boolean;
var
n1,n2,n3,n4,n5,n6,n7,n8,n9,n10,n11,n12: integer;
d1,d2: integer;
digitado, calculado: string;
begin
n1:=StrToInt(num[1]);
n2:=StrToInt(num[2]);
n3:=StrToInt(num[3]);
n4:=StrToInt(num[4]);
n5:=StrToInt(num[5]);
n6:=StrToInt(num[6]);
n7:=StrToInt(num[7]);
n8:=StrToInt(num[8]);
n9:=StrToInt(num[9]);
n10:=StrToInt(num[10]);
n11:=StrToInt(num[11]);
n12:=StrToInt(num[12]);
d1:=n12*2+n11*3+n10*4+n9*5+n8*6+n7*7+n6*8+n5*9+n4*2+n3*3+n2*4+n1*5;
d1:=11-(d1 mod 11);
if d1>=10 then d1:=0;
d2:=d1*2+n12*3+n11*4+n10*5+n9*6+n8*7+n7*8+n6*9+n5*2+n4*3+n3*4+n2*5+n1*6;
d2:=11-(d2 mod 11);
if d2>=10 then d2:=0;
calculado:=inttostr(d1)+inttostr(d2);
digitado:=num[13]+num[14];
if calculado=digitado then
  cgc:=true
  else
  cgc:=false;
end;

Function Alltrim(const Search: string): string;
{Remove os espaços em branco de ambos os lados da string}
const
BlackSpace = [#33..#126];
var
Index: byte;
begin
Index:=1;
while (Index <= Length(Search)) and not (Search[Index] in BlackSpace) do
  begin
  Index:=Index + 1;
  end;
Result:=Copy(Search, Index, 255);
Index := Length(Result);
while (Index > 0) and not (Result[Index] in BlackSpace) do
  begin
  Index:=Index - 1;
  end;
Result := Copy(Result, 1, Index);
End;

Function Datafinal(dataini:tdatetime; dias_uteis:integer):tdatetime;
//
// Retorna uma data acresçida de mais um certo número de dias
//
var dw:integer;
Begin
  dw := DayOfWeek(dataini)-1;
  result := dataini+dias_uteis+((dias_uteis-1+dw) div 7)*2;
End;

function DataExtenso(Data:TDateTime): String;
{Retorna uma data por extenso}
var
  NoDia : Integer;
  DiaDaSemana : array [1..7] of String;
  Meses : array [1..12] of String;
  Dia, Mes, Ano : Word;
begin
{ Dias da Semana }
  DiaDasemana [1]:= 'domingo';
  DiaDasemana [2]:= 'segunda-feira';
  DiaDasemana [3]:= 'terça-feira';
  DiaDasemana [4]:= 'quarta-feira';
  DiaDasemana [5]:= 'quinta-feira';
  DiaDasemana [6]:= 'sexta-feira';
  DiaDasemana [7]:= 'sábado';
{ Meses do ano }
  Meses [1] := 'janeiro';
  Meses [2] := 'fevereiro';
  Meses [3] := 'março';
  Meses [4] := 'abril';
  Meses [5] := 'maio';
  Meses [6] := 'junho';
  Meses [7] := 'julho';
  Meses [8] := 'agosto';
  Meses [9] := 'setembro';
  Meses [10]:= 'outubro';
  Meses [11]:= 'novembro';
  Meses [12]:= 'dezembro';
  DecodeDate (Data, Ano, Mes, Dia);
  NoDia := DayOfWeek (Data);
  Result :=  IntToStr(Dia) +' de ' + Meses[Mes]+ ' de ' + IntToStr(Ano)+'.';
  //DiaDaSemana[NoDia] + ', '
end;

Function MesExtenso (xMes : TDateTime) : string;
Var
Dia, Mes, Ano : Word;
begin
Mes := 0;
DecodeDate (xMes, Ano, Mes, Dia);
{Try
Mes := Round (xMes);
Except
End;}
case Mes of
1: Result := 'JAN';
2: Result := 'FEV';
3: Result := 'MAR';
4: Result := 'ABR';
5: Result := 'MAI';
6: Result := 'JUN';
7: Result := 'JUL';
8: Result := 'AGO';
9: Result := 'SET';
10: Result := 'OUT';
11: Result := 'NOV';
12: Result := 'DEZ';
else
Result := '';
end;
end;

function StrToPChar(const Str: string): PChar;
{Converte String em Pchar}
type
  TRingIndex = 0..7;
var
  Ring: array[TRingIndex] of PChar;
  RingIndex: TRingIndex;
  Ptr: PChar;
begin
  Ptr := @Str[Length(Str)];
  Inc(Ptr);
  if Ptr^ = #0 then
  begin
  Result := @Str[1];
  end
  else
  begin
  Result := StrAlloc(Length(Str)+1);
  RingIndex := (RingIndex + 1) mod (High(TRingIndex) + 1);
  StrPCopy(Result,Str);
  StrDispose(Ring[RingIndex]);
  Ring[RingIndex]:= Result;
  end;
end;

Function Arredondar(Valor: Double; Dec: Integer): Double;
var
  Valor1,
  Numero1,
  Numero2,
  Numero3: Double;
begin
  Valor1:=Exp(Ln(10) * (Dec + 1));
  Numero1:=Int(Valor * Valor1);
  Numero2:=(Numero1 / 10);
  Numero3:=Round(Numero2);
  Result:=(Numero3 / (Exp(Ln(10) * Dec)));
end;

Function Justifica(mCad:string;mMAx:integer):string;
var
mPos,mPont,mTam,mNr,mCont:integer;
mStr:string;
begin
mTam:=Length(mCad);
if mTam>=mMax then
Result:=copy(mCad,1,mMax)
else
mStr:='';
mCont:=0;
mPont:=1;
mNr:=mMax-mTam;
while mCont<mNr do
begin
mPos:=pos(mStr,copy(mCad,mPont,100));
if mPos=0 then
begin
mStr:=mStr+' ';
mPont:=1;
continue;
end
else
begin
mCont:=mCont+1;
Insert(' ',mCad,mPos+mPont);
mPont:=mPont+mPos+length(mStr);
end;
Result:=mCad;
end;
end;

function extenso (valor: real): string;
var
Centavos, Centena, Milhar, Milhao, Texto, msg: string;
const
Unidades: array[1..9] of string = ('Um', 'Dois', 'Tres', 'Quatro', 'Cinco', 'Seis', 'Sete', 'Oito', 'Nove');
Dez: array[1..9] of string = ('Onze', 'Doze', 'Treze', 'Quatorze', 'Quinze', 'Dezesseis', 'Dezessete', 'Dezoito', 'Dezenove');
Dezenas: array[1..9] of string = ('Dez', 'Vinte', 'Trinta', 'Quarenta', 'Cinquenta', 'Sessenta', 'Setenta', 'Oitenta', 'Noventa');
Centenas: array[1..9] of string = ('Cento', 'Duzentos', 'Trezentos', 'Quatrocentos', 'Quinhentos', 'Seiscentos', 'Setecentos', 'Oitocentos', 'Novecentos');
function ifs(Expressao: Boolean; CasoVerdadeiro, CasoFalso: String): String;
begin
if Expressao
then Result:=CasoVerdadeiro
else Result:=CasoFalso;
end;



function MiniExtenso (trio: string): string;
var
    Unidade, Dezena, Centena: string;
begin
    Unidade:='';
    Dezena:='';
    Centena:='';
    if (trio[2]='1') and (trio[3]<>'0') then
      begin
      Unidade:=Dez[strtoint(trio[3])];
      Dezena:='';
    end
    else
     begin
      if trio[2]<>'0' then Dezena:=Dezenas[strtoint(trio[2])];
      if trio[3]<>'0' then Unidade:=Unidades[strtoint(trio[3])];
     end;
    if (trio[1]='1') and (Unidade='') and (Dezena='')
     then Centena:='cem'
    else
     if trio[1]<>'0'
      then Centena:=Centenas[strtoint(trio[1])]
      else Centena:='';
     Result:= Centena + ifs((Centena<>'') and ((Dezena<>'') or (Unidade<>'')), ' e ', '')
      + Dezena + ifs((Dezena<>'') and (Unidade<>''),' e ', '') + Unidade;
    end;
    begin
    if (valor>999999.99) or (valor<0) then
     begin
      msg:='O valor está fora do intervalo permitido.';
      msg:=msg+'O número deve ser maior ou igual a zero e menor que 999.999,99.';
      msg:=msg+' Se não for corrigido o número não será escrito por extenso.';
      showmessage(msg);
      Result:='';
      exit;
     end;
    if valor=0 then
     begin
      Result:='';
      Exit;
     end;
    Texto:=formatfloat('000000.00',valor);
    Milhar:=MiniExtenso(Copy(Texto,1,3));
    Centena:=MiniExtenso(Copy(Texto,4,3));
    Centavos:=MiniExtenso('0'+Copy(Texto,8,2));
    Result:=Milhar;
    if Milhar<>'' then
      if copy(texto,4,3)='000' then
      Result:=Result+' Mil Reais'
      else
      Result:=Result+' Mil, ';
    if (((copy(texto,4,2)='00') and (Milhar<>'')
      and (copy(texto,6,1)<>'0')) or (centavos=''))
      and (Centena<>'') then Result:=Result+' e ';
    if (Milhar+Centena <>'') then Result:=Result+Centena;
    if (Milhar='') and (copy(texto,4,3)='001') then
      Result:=Result+' Real'
     else
      if (copy(texto,4,3)<>'000') then Result:=Result+' Reais';
    if Centavos='' then
     begin
      Result:=Result+'.';
      Exit;
     end
    else
     begin
      if Milhar+Centena='' then
      Result:=Centavos
      else
      Result:=Result+', e '+Centavos;
    if (copy(texto,8,2)='01') and (Centavos<>'') then
      Result:=Result+' Centavo'
     else
      Result:=Result+' Centavos';
    end;
end;

function Maiuscula(Texto:String): String;
{Converte a primeira letra do texto especificado para
maiuscula e as restantes para minuscula}
var
OldStart: Integer;
begin
if Texto <> '' then
  begin
  Texto := UpperCase(Copy(Texto,1,1))+LowerCase(Copy(Texto,2,Length(Texto)));
  Result := Texto;
  end;
end;

Function DiadaSemana(Data : String) : string;
const
  semana : array[1..7] of string = ('Domingo','Segunda-feira','Terça-feira','Quarta-feira','Quinta-feira','Sexta-feira', 'Sabado');
begin
  Result := semana[DayOfWeek(strtodate(Data))]
end;

function percorreArquivoTexto ( nomeDoArquivo: String ) : String;
var arq: TextFile;
    linha: String;
begin
    AssignFile ( arq, nomeDoArquivo );
    Reset ( arq );
    ReadLn ( arq, linha );
    while not Eof ( arq ) do
    begin
        { Processe a linha lida aqui. }
        { Para particionar a linha lida em pedaços, use a função Copy. }
        ReadLn ( arq, linha );
    end;
    CloseFile ( arq );
    result := linha;
end;

procedure RefreshCDS(aDateSet : TClientDataSet);
begin
     aDateSet.Close;
     aDateSet.Open;
End;

Procedure FilterCDS(aCds : TClientDataSet; aType : TTypeLocalizar ; aBusca : String);
begin
     aCds.close;
     case aType of
          fsInteger : aCds.Params[0].AsInteger := StrtoInt(aBusca);
          fsString  : aCds.Params[0].AsString  := UpperCase(aBusca);
     end;
     aCds.Open;
End;

function RemoveAcento(Str:String): String;
Const
  ComAcento = 'àâêôûãõáéèíóúçüÀÂÊÔÛÃÕÁÉÈÍÓÚÇÜ';
  SemAcento = 'aaeouaoaeeioucuAAEOUAOAEEIOUCU';
Var
    x : Integer;
Begin
    For x := 1 to Length(Str) do
      if Pos(Str[x],ComAcento)<>0 Then
    Str[x] := SemAcento[Pos(Str[x],ComAcento)];
    Result := Str;
end;


function ReplaceStr (Text,oldstring,newstring:string):string;
var
    atual, strtofind, originalstr:pchar;
    NewText:string;
    lenoldstring,lennewstring,m,index:integer;
begin //ReplaceStr
    NewText:=Text;
    originalstr:=pchar(Text);
    strtofind:=pchar(oldstring);
    lenoldstring:=length(oldstring);
    lennewstring:=length(newstring);
    Atual := StrPos(OriginalStr,StrtoFind);
    index:=0;
    while Atual<>nil do
    begin //Atual<>nil
        m:=Atual - OriginalStr - index + 1;
        Delete(NewText,m,lenoldstring);
        Insert(newstring,NewText,m);
        inc(index,lenoldstring-lennewstring);
        Atual:=StrPos(Atual+lenoldstring,StrtoFind);
    end; //Atual<>nil
    Result:=NewText;
end; //ReplaceStr

function FormataCNPJ(CNPJ: string): string;
begin
  Result := Copy(CNPJ,1,2)+'.'+Copy(CNPJ,3,3)+'.'+Copy(CNPJ,6,3)+'/'+
            Copy(CNPJ,9,4)+'-'+Copy(CNPJ,13,2);
end;


function MD5(const Input: string): string;
var
  hCryptProvider: HCRYPTPROV;
  hHash: HCRYPTHASH;
  bHash: array[0..$7f] of Byte;
  dwHashLen: DWORD;
  pbContent: PByte;
  i: Integer;
begin
  dwHashLen := 16;
  pbContent := Pointer(PChar(Input));
  Result := '';

  if CryptAcquireContext(@hCryptProvider, nil, nil, PROV_RSA_FULL, CRYPT_VERIFYCONTEXT or CRYPT_MACHINE_KEYSET) then
  begin
    if CryptCreateHash(hCryptProvider, CALG_MD5, 0, 0, @hHash) then
    begin
      if CryptHashData(hHash, pbContent, Length(Input), 0) then
      begin
        if CryptGetHashParam(hHash, HP_HASHVAL, @bHash[0], @dwHashLen, 0) then
        begin
          for i := 0 to dwHashLen - 1 do
          begin
            Result := Result + Format('%.2x', [bHash[i]]);
          end;
        end;
      end;
      CryptDestroyHash(hHash);
    end;
    CryptReleaseContext(hCryptProvider, 0);
  end;
  Result := AnsiLowerCase(Result);
end;

function TrocaCaracterEspecial(aTexto : string; aLimExt : boolean) : string;
const
  //Lista de caracteres especiais
  xCarEsp: array[1..41] of String = ('á', 'à', 'ã', 'â', 'ä','Á', 'À', 'Ã', 'Â', 'Ä',
                                     'é', 'è','É', 'È','í', 'ì','Í', 'Ì',
                                     'ó', 'ò', 'ö','õ', 'ô','Ó', 'Ò', 'Ö', 'Õ', 'Ô',
                                     'ú', 'ù', 'ü','Ú','Ù', 'Ü','ç','Ç','ñ','Ñ', 'º', 'ª', '°');
  //Lista de caracteres para troca
  xCarTro: array[1..41] of String = ('a', 'a', 'a', 'a', 'a','A', 'A', 'A', 'A', 'A',
                                     'e', 'e','E', 'E','i', 'i','I', 'I',
                                     'o', 'o', 'o','o', 'o','O', 'O', 'O', 'O', 'O',
                                     'u', 'u', 'u','u','u', 'u','c','C','n', 'N', ' ', ' ', ' ');
  //Lista de Caracteres Extras
  xCarExt: array[1..52] of string = ('<','>','!','@','#','$','%','¨','&','*',
                                     '(',')','_','+','=','{','}','[',']','?',
                                     ';',':',',','|','*','"','~','^','´','`',
                                     '¨','æ','Æ','ø','£','Ø','ƒ','ª','º','¿',
                                     '®','½','¼','ß','µ','þ','ý','Ý','§', '€',
                                     '°','¾');
var
  xTexto : string;
  i : Integer;
begin
   xTexto := aTexto;
   for i:=1 to 41 do
     xTexto := StringReplace(xTexto, xCarEsp[i], xCarTro[i], [rfreplaceall]);
   //De acordo com o parâmetro aLimExt, elimina caracteres extras.
   if (aLimExt) then
     for i:=1 to 52 do
       xTexto := StringReplace(xTexto, xCarExt[i], '', [rfreplaceall]);   
   Result := xTexto;
end;

end.
