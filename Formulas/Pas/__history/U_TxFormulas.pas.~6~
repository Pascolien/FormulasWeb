unit U_TxFormulas;

interface
uses
  SysUtils, contnrs,
  U_Abstract,
  U_Small_Lib;

type TxVariable=class
  private
    sName: String;
    fValue: Extended;
    sUnit: String;
  public
end;

type TxFormula=class
  private
     OL_Variable: TObjectList;
     sFormula: String;

     procedure Initialize;
  public
    Constructor Create();override;
    constructor Create_From_TEEXMA(ATxObject:TS_Object_Data);

    Destructor Destroy(); override;


end;

function Get_Formula(AArr_Input: array of const): Tarr_Varrec; stdcall; export;
//function  ;
implementation
uses
  U_MainFormulas,
  U_TxFormula_Ini;

var Id_Obj:Integer;

function Get_Formula(AArr_Input: array of const): Tarr_Varrec;
var
  Id_Obj: Integer;
  TxObj_CycleTime: TS_Object_Data;
  rTxObj_Formula: TS_Object_Data;
  sFormula: string;
begin
  Setlength(result, 2);
  TxObj_CycleTime := nil;
  try
    DoInitialize_Dll(VarrecToStr(AArr_Input[0]));
    Id_Obj := StrToInt(VarRecToStr(AArr_Input[1]));

    TxObj_CycleTime := Create_Object_Data_From_Attribute_Set(Get_ID_AS_Formula, Id_Obj);
    fCycleTime := TxObj_CycleTime.Get_Data_fValue(Get_ID_Att_fVal1, true);

    rTxObj_Formula := TxObj_CycleTime.Get_Data_Object_Lkd(Get_ID_Att_Lnk_Formula,true);

    sFormula := rTxObj_Formula.Get_Data_sValue(Get_ID_Att_sFormula);


    Set_VarRec(result[0], 'ok');
    Set_VarRec(result[1], 'toto' );

    FreeExt(TxObj_Formula);

  except on e:exception do
  begin
    Set_VarRec(result[0], 'ko');
    Set_VarRec(result[1],e.message);
  end;

  end;

end;

{ TxFormula }

constructor TxFormula.Create;
begin
  inherited;
  Initialize;
end;

constructor TxFormula.Create_From_TEEXMA(ATxObject: TS_Object_Data);
begin

end;

destructor TxFormula.Destroy;
begin
  Freeext(OL_Variable);
  inherited;
end;

procedure TxFormula.Initialize;
begin
  OL_Variable := TObjectList.Create;
end;

end.
