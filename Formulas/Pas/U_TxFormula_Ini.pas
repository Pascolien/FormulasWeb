///<author>dev@bassetti.fr</author>
///<summary>This unit allows to read and write the file "TxFormula.ini". It also allows to access to the variables and check their relevancy. This unit is fully generated from the inifile. Do not modify!</summary>
Unit U_TxFormula_INI;

interface

const
  C_Filename = 'TxFormula.ini';

var
  //CycleTime
  ID_OT_CycleTime: integer;
  ID_Att_fVal1: integer;
  ID_Att_fVal2: integer;
  ID_Att_fVal3: integer;
  ID_Att_fVal4: integer;
  ID_Att_fVal5: integer;
  ID_Att_Lnk_Formula: integer;
  ID_Att_Result1: integer;
  ID_Att_Result2: integer;

  //Formula
  ID_OT_Formula: integer;
  ID_Att_sFormula: integer;

///<summary>Procedure reading the whole content of the inifile.</summary>
///<param name="ADir">The absolute path to the directory of the inifile.</param>
///<param name="ACheck_Settings">If true, the function Check_Settings is called after the initialization of the variables.</param>
procedure Load(const ADir: string; const ACheck_Settings: boolean=true);

///<summary>Procedure save the variables of the inifile.</summary>
///<param name="ADir">The absolute path to the directory of the inifile.</param>
procedure Save(const ADir: string);

///<summary>Procedure checking the various parameters read in the inifile and raising errors if they are not correct.</summary>
procedure Check_Settings; stdcall; export;

//CycleTime
function Get_ID_OT_CycleTime: integer; stdcall; export;
function Get_ID_Att_fVal1: integer; stdcall; export;
function Get_ID_Att_fVal2: integer; stdcall; export;
function Get_ID_Att_fVal3: integer; stdcall; export;
function Get_ID_Att_fVal4: integer; stdcall; export;
function Get_ID_Att_fVal5: integer; stdcall; export;
function Get_ID_Att_Lnk_Formula: integer; stdcall; export;
function Get_ID_Att_Result1: integer; stdcall; export;
function Get_ID_Att_Result2: integer; stdcall; export;

//Formula
function Get_ID_OT_Formula: integer; stdcall; export;
function Get_ID_Att_sFormula: integer; stdcall; export;

implementation

uses
  SysUtils,Inifiles,Math,Classes,

  U_Small_Lib,
  U_Abstract;


procedure Load(const ADir: string; const ACheck_Settings: boolean);
var
  F: TIniFile; //Do not change this variable name.
begin
  F := nil;
  try
    F := TIniFile.Create(ADir+C_Filename);

    //CycleTime
    ID_OT_CycleTime := F.ReadInteger('CycleTime','ID_OT_CycleTime',-1);
    ID_Att_fVal1 := F.ReadInteger('CycleTime','ID_Att_fVal1',-1);
    ID_Att_fVal2 := F.ReadInteger('CycleTime','ID_Att_fVal2',-1);
    ID_Att_fVal3 := F.ReadInteger('CycleTime','ID_Att_fVal3',-1);
    ID_Att_fVal4 := F.ReadInteger('CycleTime','ID_Att_fVal4',-1);
    ID_Att_fVal5 := F.ReadInteger('CycleTime','ID_Att_fVal5',-1);
    ID_Att_Lnk_Formula := F.ReadInteger('CycleTime','ID_Att_Lnk_Formula',-1);
    ID_Att_Result1 := F.ReadInteger('CycleTime','ID_Att_Result1',-1);
    ID_Att_Result2 := F.ReadInteger('CycleTime','ID_Att_Result2',-1);

    //Formula
    ID_OT_Formula := F.ReadInteger('Formula','ID_OT_Formula',-1);
    ID_Att_sFormula := F.ReadInteger('Formula','ID_Att_sFormula',-1);

    if ACheck_Settings then
      Check_Settings;

  finally
    if F<>nil then
      F.Free;
  end;
end;

procedure Save(const ADir: string);
var
  F: TIniFile; //Do not change this variable name.
begin
  F := nil;
  try
    F := TIniFile.Create(ADir+C_Filename);

    //CycleTime
    F.WriteInteger('CycleTime','ID_OT_CycleTime',ID_OT_CycleTime);
    F.WriteInteger('CycleTime','ID_Att_fVal1',ID_Att_fVal1);
    F.WriteInteger('CycleTime','ID_Att_fVal2',ID_Att_fVal2);
    F.WriteInteger('CycleTime','ID_Att_fVal3',ID_Att_fVal3);
    F.WriteInteger('CycleTime','ID_Att_fVal4',ID_Att_fVal4);
    F.WriteInteger('CycleTime','ID_Att_fVal5',ID_Att_fVal5);
    F.WriteInteger('CycleTime','ID_Att_Lnk_Formula',ID_Att_Lnk_Formula);
    F.WriteInteger('CycleTime','ID_Att_Result1',ID_Att_Result1);
    F.WriteInteger('CycleTime','ID_Att_Result2',ID_Att_Result2);

    //Formula
    F.WriteInteger('Formula','ID_OT_Formula',ID_OT_Formula);
    F.WriteInteger('Formula','ID_Att_sFormula',ID_Att_sFormula);

    F.UpdateFile;
  finally
    if F<>nil then
      F.Free;
  end;
end;

function Get_ID_OT_CycleTime: integer;
begin
  result := ID_OT_CycleTime;
end;
function Get_ID_Att_fVal1: integer;
begin
  result := ID_Att_fVal1;
end;
function Get_ID_Att_fVal2: integer;
begin
  result := ID_Att_fVal2;
end;
function Get_ID_Att_fVal3: integer;
begin
  result := ID_Att_fVal3;
end;
function Get_ID_Att_fVal4: integer;
begin
  result := ID_Att_fVal4;
end;
function Get_ID_Att_fVal5: integer;
begin
  result := ID_Att_fVal5;
end;
function Get_ID_Att_Lnk_Formula: integer;
begin
  result := ID_Att_Lnk_Formula;
end;
function Get_ID_Att_Result1: integer;
begin
  result := ID_Att_Result1;
end;
function Get_ID_Att_Result2: integer;
begin
  result := ID_Att_Result2;
end;
function Get_ID_OT_Formula: integer;
begin
  result := ID_OT_Formula;
end;
function Get_ID_Att_sFormula: integer;
begin
  result := ID_Att_sFormula;
end;

procedure Check_Settings;
var
  sLog: string;
begin

  sLog := '';

  try
    If ID_OT_CycleTime <> 0 then
      Check_OT_Existence(ID_OT_CycleTime,false,true)
  except
    on e: exception do
      sLog := Quick_Concat(sLog,'[CycleTime].ID_OT_CycleTime: '+e.Message,LB);
  end;

  try
    If ID_Att_fVal1 <> 0 then
      Check_Attribute_Existence(ID_Att_fVal1,false,true)
  except
    on e: exception do
      sLog := Quick_Concat(sLog,'[CycleTime].ID_Att_fVal1: '+e.Message,LB);
  end;

  try
    If ID_Att_fVal2 <> 0 then
      Check_Attribute_Existence(ID_Att_fVal2,false,true)
  except
    on e: exception do
      sLog := Quick_Concat(sLog,'[CycleTime].ID_Att_fVal2: '+e.Message,LB);
  end;

  try
    If ID_Att_fVal3 <> 0 then
      Check_Attribute_Existence(ID_Att_fVal3,false,true)
  except
    on e: exception do
      sLog := Quick_Concat(sLog,'[CycleTime].ID_Att_fVal3: '+e.Message,LB);
  end;

  try
    If ID_Att_fVal4 <> 0 then
      Check_Attribute_Existence(ID_Att_fVal4,false,true)
  except
    on e: exception do
      sLog := Quick_Concat(sLog,'[CycleTime].ID_Att_fVal4: '+e.Message,LB);
  end;

  try
    If ID_Att_fVal5 <> 0 then
      Check_Attribute_Existence(ID_Att_fVal5,false,true)
  except
    on e: exception do
      sLog := Quick_Concat(sLog,'[CycleTime].ID_Att_fVal5: '+e.Message,LB);
  end;

  try
    If ID_Att_Lnk_Formula <> 0 then
      Check_Attribute_Existence(ID_Att_Lnk_Formula,false,true)
  except
    on e: exception do
      sLog := Quick_Concat(sLog,'[CycleTime].ID_Att_Lnk_Formula: '+e.Message,LB);
  end;

  try
    If ID_Att_Result1 <> 0 then
      Check_Attribute_Existence(ID_Att_Result1,false,true)
  except
    on e: exception do
      sLog := Quick_Concat(sLog,'[CycleTime].ID_Att_Result1: '+e.Message,LB);
  end;

  try
    If ID_Att_Result2 <> 0 then
      Check_Attribute_Existence(ID_Att_Result2,false,true)
  except
    on e: exception do
      sLog := Quick_Concat(sLog,'[CycleTime].ID_Att_Result2: '+e.Message,LB);
  end;

  try
    If ID_OT_Formula <> 0 then
      Check_OT_Existence(ID_OT_Formula,false,true)
  except
    on e: exception do
      sLog := Quick_Concat(sLog,'[Formula].ID_OT_Formula: '+e.Message,LB);
  end;

  try
    If ID_Att_sFormula <> 0 then
      Check_Attribute_Existence(ID_Att_sFormula,false,true)
  except
    on e: exception do
      sLog := Quick_Concat(sLog,'[Formula].ID_Att_sFormula: '+e.Message,LB);
  end;

  if sLog <> '' then
    raise Exception.Create(sLog);
end;

end.
