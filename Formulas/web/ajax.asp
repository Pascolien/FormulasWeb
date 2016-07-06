<%
    'Session("sPath_DLL") = "FormulasWeb\TxFormula.dll"
	Session("sPath_DLL") = "D:\Tests\FormulasWeb\TxFormula.dll"

	SELECT CASE (request("sfunction"))

		CASE "Get_Formula"
			'Session("sPath_DLL") = "FormulasWeb\TxFormula.dll"
			 Session("sPath_DLL") = "D:\Tests\FormulasWeb\TxFormula.dll"

			AParameters = Session("Dir_TEEXMA_Path") & "|" & request("Id_Obj") & "|" & request("TxObj_CycleTime") & "|" &  request("fCycleTime") & "|" &  request("sFormula")
			API_ASP_TxASP.Execute_DLL Session("sPath_DLL"), "Get_Formula", AParameters, AResult

        CASE "Get_VarFormula"
            AParameters = Session("Dir_TEEXMA_Path") & "|" & request("Id_Obj") & "|" & request("TxObj_CycleTime")  & "|" & request("Obj_CycleTime")   
			API_ASP_TxASP.Execute_DLL Session("sPath_DLL"), "Get_VarFormula", AParameters, AResult

	END SELECT

	response.write AResult
%>
