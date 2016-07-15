unit U_TxFormulas;

interface
uses
  SysUtils, contnrs,
  DBXJSON,
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
    Constructor Create(); overload;
    constructor Create_From_TEEXMA(const ATxObject:TS_Object_Data);

    function Get_Variable(aName : String): TxVariable; virtual;stdcall;export;
   // function Get_Ol_Variable : TObjectList;

    Destructor Destroy(); override;
end;

function Create_Formula: TxFormula; stdcall;export;

function Get_Formula(AArr_Input: array of const): Tarr_Varrec; stdcall; export; overload;
  
var
  Obj_Formula : TxFormula;


implementation
uses
  U_MainFormulas,
  U_TxFormula_Ini;

var Id_Obj:Integer;

function Create_Formula: TxFormula; stdcall;export;
begin
  result := TxFormula.Create;
end;

function Get_Formula(aName : String): Tarr_Varrec;  Overload;
var
  Id_Obj: Integer;
  TxObj_Formula: TS_Object_Data;
  rTxObj_Formula: TS_Object_Data;
  sFormula: string;
  TxJSONObject: TJSONObject;
  jPair:TJSONPair;
  jValue : TJSONValue;
  Get_ID_AS_Formula: Integer;
  rArr_Variables: TJSONArray;
  rVar: TJSONObject;
  rATT_Set: TS_Attribute_Set;
  i:integer;
  
begin
  Setlength(result, 2);
  TxObj_Formula := nil;
  //TxJSONObject := nil;
  try
    DoInitialize_Dll(VarrecToStr(AArr_Input[0]));
    Id_Obj := StrToInt(VarRecToStr(AArr_Input[1]));  

    if assigned(Obj_Formula) then
      FreeAndNil(Obj_Formula);

    TxObj_Formula := Create_Object_Data_From_Attribute_Set(Get_ID_AS_Formula, Id_Obj);
    
    Obj_Formula.Create_From_TEEXMA(TxObj_Formula);


    //Testing parse string to json object
    TxJSONObject := TJSONObject.Create;
    TxJSONObject := TJSONObject.ParseJSONValue(sFormula) as TJSONObject;

    if TxJSONObject.GetValue('variables') <> nil then
       rArr_Variables := TxJSONObject.GetValue('variables') as TJSONArray;

    for i := 0 to rArr_Variables.Size - 1 do
    begin
      rVar := TJSONObject(rArr_Variables.Get(i));
      
      
    end;
    //end 

    
    
    Set_VarRec(result[0], 'ok');
    Set_VarRec(result[1], 'toto' );
    
    //FreeExt(TxObj_Formula);

  except on e:exception do
  begin
    Set_VarRec(result[0], 'ko');
    Set_VarRec(result[1],e.message);
  end;

  end;

end;

function TxFormula.Get_Variable(aName : String):TxVariable;
Var
  ID_Attribut: integer;
  rAttribut:TS_Attribute;
  ID_Unit: integer;
  ID_Object: integer;
  rObject:TS_Object;
  TxObj_CycleTime:TJSONObject;
  MyVar:TObject;
  sName: string ;
  i:integer;
begin
  
  //MyVar := TxVariable(Obj_Formula.Get_Ol_Variable[i]);
    {TxVariable}

    if (ID_Object>1)then
    begin
      rObject := nil;
      if (ID_Attribut>0) then
      begin  
        rAttribut := nil;
        rAttribut := Get_Attribute(ID_Attribut);
        if Assigned(rAttribut) then
        begin
          sName := rAttribut.Get_Name;
          ID_Unit := rAttribut.Get_ID_Unit;
        end;
      end;
    end;
    
       
  {if Self.sName = TxJSONObject.variables.name and ((Self.fValue <> TxJSONObject.variables.value) or (Self.sUnit <> TxJSONObject.variables.unit )) then
  begin
    self.fValue := TxJSONObject;
    self.sUnit := TxJSONObject.variables.Unit ;
  end;}

   //sync TxObj
     {if (self.sName = TxObj_CycleTime) then
     begin 
       self.fValue := TxObj_CycleTime;
       self.sUnit := TxObj_CycleTime.variables.Unit;
     end;}
end;

  
   

{ TxFormula }

constructor TxFormula.Create;
begin
  inherited;
  Initialize;
end;

constructor TxFormula.Create_From_TEEXMA(const ATxObject: TS_Object_Data);
var
  rTxObj_Formula: TS_Object_Data;
begin
  rTxObj_Formula := ATxObject.Get_Data_Object_Lkd(Get_ID_Att_Lnk_Formula,true);

  sFormula := rTxObj_Formula.Get_Data_sValue(Get_ID_Att_sFormula);
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
