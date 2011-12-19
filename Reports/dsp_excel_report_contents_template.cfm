
<!-- Reports\dsp_excel_report_contents_template.cfm
	Author: Josh P-->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I 
	||
	Name: Josh Peters
	||
	Edits: 
	$Log$
	||
	Variables:
	
	END FUSEDOC --->
</cfsilent><!--- dsp_excel_report_contents_template.cfm --->
<cfoutput>
	<cfset num_of_cols = "#ListLen(wkst_col_list ,",")#">
	<cfset curr_col = 0>
	<cfset rownum = 0>
	<cfset begin_data_row = static_rows_used>
	<cfset STARTROW = totalrecords>
	<cfset totals = StructNew()>

	<!--- BUILD MULTI-D ARRAY FOR POPULATING REPORT --->
	dim arr_#wkst_id#( #totalrecords#,#num_of_cols#) 
	dim rng_#wkst_id# 
	set rng_#wkst_id# = assign_sheet.Range("A#begin_data_row#:A#num_of_cols#").Resize(#STARTROW#,#num_of_cols#)
</cfoutput>	

	<!--- ADD COLUMN HEADERS VIA PASSED LIST --->	
	<cfloop INDEX="col_value" LIST="#wkst_col_list#" DELIMITERS=",">		
		<cfoutput>
	 	arr_#wkst_id#(#rownum#,#curr_col#) = "#col_value#"
		<cfset curr_col = curr_col + 1>
	
		</cfoutput>	
	</cfloop>
	
	<cfset curr_col = 0>
	<cfset rownum = rownum + 1> 

	<cfoutput query="get_expenses">

		<cfif NOT CompareNoCase(current_type, get_expenses.reimbursement_type)>
		
			<cfset expense_id = get_expenses.expense_id> 
			<cfset format_rownum = rownum + 7>

			assign_sheet.Range("A" & #format_rownum#).VerticalAlignment =  -4160 	
			arr_#wkst_id#(#rownum#,#curr_col#) = "#name# #lname#"
			<cfset curr_col = curr_col + 1>
			
			assign_sheet.Range("B" & #format_rownum#).VerticalAlignment =  -4160 			
			arr_#wkst_id#(#rownum#,#curr_col#) = "#dateFormat(work_date, 'mm/dd/yy')#"
			<cfset curr_col = curr_col + 1>
			
			assign_sheet.Range("C" & #format_rownum#).VerticalAlignment =  -4160 						
			arr_#wkst_id#(#rownum#,#curr_col#) = "#project_code#"	
			<cfset curr_col = curr_col + 1>
			
			assign_sheet.Range("D" & #format_rownum#).VerticalAlignment =  -4160 			
			arr_#wkst_id#(#rownum#,#curr_col#) = "#trim(Description)#"	
			<cfset curr_col = curr_col + 1>
			
			assign_sheet.Range("E" & #format_rownum#).VerticalAlignment =  -4160 			
			arr_#wkst_id#(#rownum#,#curr_col#) = "#note#"
			<cfset curr_col = curr_col + 1>
			
			<cfset currow = get_expenses.CurrentRow>
			
			<cfset expense_start_col = curr_col + 64>
			<cfloop query="get_expense_type">
				<cfset dynamic_col = curr_col + 65>
				column_letter = (chr(#dynamic_col#))
				assign_sheet.Range(column_letter & #format_rownum#).VerticalAlignment =  -4160 
				arr_#wkst_id#(#rownum#,#curr_col#) = "#dollarformat(get_expenses[expense_type][currow])#"								
				<cfset curr_col = curr_col + 1>
				<cfset expense_end_col = curr_col + 64>
				<!--- <cfset totals[Expense_Type] =totals[Expense_Type] + get_expenses[expense_type][currow]> --->
			</cfloop>
			
			expense_cell_start = chr(#expense_start_col#)
			expense_cell_end = chr(#expense_end_col#)		
			
			<cfset last_content_col_set = curr_col + 64>
			<cfset rownum = rownum + 1> 
			<cfset curr_col = 0>
				
			last_content_letter = (#cols_needed_count# + 64)
			col = (#cols_needed_count# + 63)
			col = chr(col)
			last_content_letter = (chr(last_content_letter))
			
			<cfset format_rownum = rownum + 6>
			row_header_cell_range = "A7:" & last_content_letter & "7"
			content_cell_range = "A8:" & col & "#format_rownum#"
		</cfif>
	</cfoutput>
		
<cfoutput>
	<!--- Fill the worksheet all at once --->
	rng_#wkst_id#.value = arr_#wkst_id# 	 
	
	<!--- BOLD COL HEADERS, RESIZE/AUTOFIT CELLS, SET COL WIDTH FOR DECRIPTION AND NOTES --->
	assign_sheet.Range(row_header_cell_range).Font.Bold = True	
	assign_sheet.Range("A8:C#rownum#").EntireColumn.AutoFit	
	assign_sheet.Range("F8:" & last_content_letter & #rownum#).EntireColumn.AutoFit
	
	assign_sheet.Range("E8").ColumnWidth = 18
	assign_sheet.Range("D8").ColumnWidth = 18
	
	<!--- LOOP THOUGH EACH ROW AND ADD COLUMN TOTALS --->
	<cfset format_rownum = rownum + 6>
	<cfloop from=8 to="#format_rownum#" index = "xx">
		row_total = "F" & #xx# & ":" & chr(#expense_end_col#) & #xx#
		col = chr(#expense_end_col# + 1) & #xx#
		assign_sheet.Range(col).VerticalAlignment =  -4160 			
		assign_sheet.Range(col).value = "#dollarformat(0)#"
		assign_sheet.Range(col).formula = "=sum(" & row_total & ")"
		assign_sheet.Range(col).Font.Bold = True
		assign_sheet.Range(col).EntireColumn.AutoFit
		assign_sheet.Range("D#xx#").EntireColumn.WrapText = True	
		assign_sheet.Range("E#xx#").EntireColumn.WrapText = True		
	</cfloop>
	
	<!--- LOOP THROUGH EACH COLUMN AND ADD ROW TOTALS --->
	<cfloop from = 70 to = #expense_end_col# index="column">
		col = chr(#column#)
		formula_cell = (#rownum# + 7)
		formula_cell = col & formula_cell
		col = col & 8 & ":" & col & (#rownum# + 6)
		assign_sheet.Range(col).VerticalAlignment =  -4160 
		assign_sheet.Range(formula_cell).value = "#dollarformat(0)#"
		assign_sheet.Range(formula_cell).formula = "=sum(" & col & ")"
		assign_sheet.Range(formula_cell).Font.Bold = True
		assign_sheet.Range(formula_cell).EntireColumn.AutoFit
		formula_cell = "F7:" & (chr(#expense_end_col#)) & (#rownum# + 7)		
		<cfset Grand_total = column + 1>
	</cfloop>	
		formula_cell = (#rownum# + 7)
		col = chr(#grand_total#)
		col = col & formula_cell
		assign_sheet.Range(col).Font.Bold = True
		assign_sheet.Range(col).value = "#dollarformat(0)#"
		range = "f" & formula_cell & ":" & chr(#expense_end_col# ) & formula_cell
		assign_sheet.Range(col).formula = "=sum(" & range & ")"
	
</cfoutput>
	
