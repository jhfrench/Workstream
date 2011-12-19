
<!--- Reports/dsp_employee_info_excel_report_column_headers.cfm
	Author: Joshua Peters  --->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I contain the column headers displayed in the HR excel report.
	||
	Name: Joshua Peters
	||
	Edits:
	$Log$
	||
	END FUSEDOC --->
</cfsilent>
<cfoutput>
	<!--- Build a list of the column letters going all the way to 'CZ' --->
	<cfset variables.excel_column_list="A,B,C,D,E,F,G,H,I,J,K,L,M,N,O,P,Q,R,S,T,U,V,W,X,Y,Z,AA,AB,AC,AD,AE,AF,AG,AH,AI,AJ,AK,AL,AM,AN,AO,AP,AQ,AR,AS,AT,AU,AV,AW,AX,AY,AZ,BA,BB,BC,BD,BE,BF,BG,BH,BI,BJ,BK,BL,BM,BN,BO,BP,BQ,BR,BS,BT,BU,BV,BW,BX,BY,BZ,CA,CB,CC,CD,CE,CF,CG,CH,CI,CJ,CK,CL,CM,CN,CO,CP,CQ,CR,CS,CT,CU,CV,CW,CX,CY,CZ">
	<cfset variables.current_col_num = 0>					 
				
	<cfset variables.rownum = variables.rownum + 1>
	<cfset variables.current_col_num = 0>
	
	<!--- Loop over the list of header items. --->			
	<cfloop list="#attributes.report_elements#" index="header">
		
		<!--- Make sure this column hasn't been removed. --->
		<cfif NOT  ListContainsNoCase(attributes.columns_not_to_print,header)>
			data_array(#variables.rownum#,#variables.current_col_num#) = "#header#"
			<cfset variables.current_col_num = variables.current_col_num + 1>
		</cfif>
				
	</cfloop>
	
	<!--- Format from the column A to whatever column we ended with. --->
	<cfset variables.format_end_col=listgetat(variables.excel_column_list,variables.current_col_num)>
	assign_sheet.Range("A2:#variables.format_end_col#2").Borders.Item(8).Weight = 3
	assign_sheet.Range("A2:#variables.format_end_col#2").Borders.Item(9).Weight = 3	
	assign_sheet.Range("A2:#variables.format_end_col#2").Borders(8).LineStyle = 1
	assign_sheet.Range("A2:#variables.format_end_col#2").Borders(9).LineStyle = 1	
		
	assign_sheet.Rows("2").Font.Bold = True	
	<cfset variables.rownum = variables.rownum + 1>
	<cfset variables.current_col_num = 0>
</cfoutput>
