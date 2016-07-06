<%
    'Session("sPath_DLL") = "FormulasWeb\TxFormula.dll"
	Session("sPath_DLL") = "D:\Tests\FormulasWeb\TxFormula.dll"

	SELECT CASE (request("sfunction"))

		CASE "DoInitialize_Dll"
			'Session("sPath_DLL") = "FormulasWeb\TxFormula.dll"
			 Session("sPath_DLL") = "D:\Tests\FormulasWeb\TxFormula.dll"

			AParameters = Session("Dir_TEEXMA_Path") & "|" & request("lLog") & "|" & request("sLogDir") & "|" &  request("sTxDir")
			API_ASP_TxASP.Execute_DLL Session("sPath_DLL"), "Get_Formulal", AParameters, AResult

        CASE "name function"
            AParameters = Session("Dir_TEEXMA_Path") & "|" & request("Param de la fct") & "|" & request("Param dlf")  & "|" & request("Param dlf")   
			API_ASP_TxASP.Execute_DLL Session("sPath_DLL"), "namefct", AParameters, AResult

	END SELECT

	response.write AResult
%>
