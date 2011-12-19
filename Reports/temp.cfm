
<!--- <cfset from_date = form.From_date_Expense>
<cfset through_date = form.through_date_Expense> --->

<cfquery name="get_Reimbursement"  datasource="#application.datasources.main#">
SELECT reimbursement_type, reimbursement_id
FROM REF_Reimbursement_Type
</cfquery>

<cfquery name="get_Expense_Type" datasource="#application.datasources.main#">
SELECT  *
FROM REF_Expense_Type
ORDER BY Expense_ID
</cfquery>
<cfquery name="expenses" datasource="#application.datasources.main#">
SELECT Emp_Contact.name, Emp_Contact.lname, Expense.work_date,
	Notes.note, Expense_Amount.expense_type_id, Expense_Amount.expense_amount, 
	REF_Reimbursement_Type.reimbursement_type, REF_Expense_Type.expense_type
FROM Emp_Contact
	INNER JOIN Expense ON Emp_Contact.emp_id = Expense.emp_id
	INNER JOIN Expense_Amount ON Expense.expense_id = Expense_Amount.expense_id
	INNER JOIN Notes ON Expense.notes_id = Notes.Notes_ID
	INNER JOIN REF_Reimbursement_Type ON Expense.reimbursement_type_id = REF_Reimbursement_Type.Reimbursement_ID
	INNER JOIN REF_Expense_Type ON Expense_Amount.Expense_type_id = REF_Expense_Type.Expense_ID
WHERE Expense.emp_id = #emp_id#
	AND Expense.Work_Date >= '#from_date#'
	AND Expense.Work_Date <= '#through_date#'
ORDER BY REF_Reimbursement_Type.reimbursement_type, work_date, project_id
</cfquery>


	<title>Expense Report</title>
</head>

<cfset grand_total = 0>
<body>

<h1><em>Expense Report  &nbsp;&nbsp;<cfoutput> #company_name# &nbsp;&nbsp; From  #from_date# to #through_date#
      </cfoutput></em></h1>
     <br>

     <table width="50%">
<cfoutput><tr>
	<td><strong>#last_name#</strong></td>
	<td><strong>#first_name#</strong></td>
	<td><strong>#emp_id#</strong></td>
</tr>
</cfoutput>
</table>

<table cellpadding="4" cellspacing="0" border="1" rules="cols" frame="void">
	<tr>
		<td colspan="17"><hr color="##000000"></td>
	</tr>
	
<cfset  total_hours_Date = 0>
<cfset total_hours_Type = 0>
<cfloop from="1" to="#get_reimbursement.recordcount#" index="ii">
<cfset "row_Total#ii#"= 0> 
</cfloop>   
	
	<tr>
		<td ><strong>Notes</strong></td>
	     <td><strong>Code</strong></td>
	     <cfoutput query="Get_Expense_Type">
		<td>#expense_type#</td>
		</cfoutput>
		<td><strong>Total Expense</strong></td>
	</tr>	
	<cfoutput query="Expenses" group="reimbursement_type">

<tr>
	   <td colspan="8">#reimbursement_type#</td>
	</tr>
		<cfoutput>
		<tr>
		   <td><strong>#dateformat(work_date,"mm/d/yy")#</strong><br><br>#note# </td>
		   <td>#code# </td>
		<cfloop from="1" to="#Get_Expense_Type.recordcount#" index="ii">
		   <td align="center">#dollarformat(evaluate("ExpenseType_#ii#"))#</td><cfset  total_hours_Date = total_hours_Date + Evaluate("ExpenseType_#ii#")><cfset "row_total#ii#" = evaluate("ExpenseType_#ii#") + evaluate("Row_Total#ii#")>
		</cfloop>
		   <td>#dollarformat(total_hours_Date)#</td><cfset  Grand_total = Grand_total + total_hours_date><cfset  total_hours_Date = 0>
		</tr>
		<tr>
				<td colspan="2" align="center"><strong>Totals:</strong></td>
				<cfloop from="1" to="#Get_Expense_Type.recordcount#" index="ii">
				<td align="center">#dollarformat(evaluate("row_total#ii#"))#</td><cfset row_total1 =0>
				</cfloop>
		</tr></cfoutput>

	</cfoutput>
	</table>
	<!--- 
	<tr>
		<td colspan="17"><hr color="##000000"></td>
	</tr>
	
	<tr>
		<td colspan="8"><strong>Non-Billable Expense</strong></td>
	</tr>

 <cfoutput query="Expenses2">  	
<cfif Expenses2.recordcount>	
	<tr> 
		   <td><strong>#dateformat(work_date,"mm/d/yy")#</strong><br><br>#notes# </td>
		   <td>#code# </td>
		   <td align="center">#dollarformat(ExpenseType_1)#</td><cfset  total_hours_Date = total_hours_Date + ExpenseType_1> <cfset row_total1 = ExpenseType_1 +Row_Total1>
		   <td align="center">#dollarformat(ExpenseType_2)#</td><cfset  total_hours_Date = total_hours_Date + ExpenseType_2><cfset row_total2 = ExpenseType_2 +Row_Total2>
		   <td align="center">#dollarformat(ExpenseType_3)#</td><cfset  total_hours_Date = total_hours_Date + ExpenseType_3><cfset row_total3 = ExpenseType_3 +Row_Total3>
		   <td align="center">#dollarformat(ExpenseType_4)#</td><cfset  total_hours_Date = total_hours_Date + ExpenseType_4><cfset row_total4 = ExpenseType_4 +Row_Total4>
		   <td align="center">#dollarformat(ExpenseType_5)#</td><cfset  total_hours_Date = total_hours_Date + ExpenseType_5><cfset row_total5 = ExpenseType_5 +Row_Total5>
		   <td align="center">#dollarformat(ExpenseType_6)#</td><cfset  total_hours_Date = total_hours_Date + ExpenseType_6><cfset row_total6 = ExpenseType_6 +Row_Total6>
		   <td align="center">#dollarformat(ExpenseType_7)#</td><cfset  total_hours_Date = total_hours_Date + ExpenseType_7><cfset row_total7 = ExpenseType_7 +Row_Total7>
		   <td align="center">#dollarformat(ExpenseType_8)#</td><cfset  total_hours_Date = total_hours_Date + ExpenseType_8><cfset row_total8 = ExpenseType_8 +Row_Total8>
		   <td align="center">#dollarformat(ExpenseType_9)#</td><cfset  total_hours_Date = total_hours_Date + ExpenseType_9><cfset row_total9 = ExpenseType_9 +Row_Total9>
		   <td align="center">#dollarformat(ExpenseType_10)#</td><cfset  total_hours_Date = total_hours_Date + ExpenseType_10><cfset row_total10 = ExpenseType_10 +Row_Total10>
		   <td align="center">#dollarformat(ExpenseType_11)#</td><cfset  total_hours_Date = total_hours_Date + ExpenseType_11><cfset row_total11 = ExpenseType_11 +Row_Total11>
		   <td align="center">#dollarformat(ExpenseType_12)#</td><cfset  total_hours_Date = total_hours_Date + ExpenseType_12><cfset row_total12 = ExpenseType_12 +Row_Total12>
		   <td align="center">#dollarformat(ExpenseType_13)#</td><cfset  total_hours_Date = total_hours_Date + ExpenseType_13><cfset row_total13 = ExpenseType_13 +Row_Total13>
		   <td align="center">#dollarformat(ExpenseType_14)#</td><cfset  total_hours_Date = total_hours_Date + ExpenseType_14><cfset row_total14 = ExpenseType_14 +Row_Total14>
		   <td>#dollarformat(total_hours_Date)#</td><cfset  Grand_total = Grand_total + total_hours_Date><cfset  total_hours_Date = 0>	
	</tr>
	<cfif expenses2.CurrentRow EQ Expenses2.recordcount>
		<tr>
				<td colspan="2" align="center"><strong>Totals:</strong></td>
				<td align="center">#dollarformat(row_total1)#</td><cfset row_total1 =0>
				<td align="center">#dollarformat(row_total2)#</td><cfset row_total2 =0>
				<td align="center">#dollarformat(row_total3)#</td><cfset row_total3 =0>
				<td align="center">#dollarformat(row_total4)#</td><cfset row_total4 =0>
				<td align="center">#dollarformat(row_total5)#</td><cfset row_total5 =0>
				<td align="center">#dollarformat(row_total6)#</td><cfset row_total6 =0>
				<td align="center">#dollarformat(row_total7)#</td><cfset row_total7 =0>
				<td align="center">#dollarformat(row_total8)#</td><cfset row_total8 =0>
				<td align="center">#dollarformat(row_total9)#</td><cfset row_total9 =0>
				<td align="center">#dollarformat(row_total10)#</td><cfset row_total10 =0>
				<td align="center">#dollarformat(row_total11)#</td><cfset row_total11 =0>
				<td align="center">#dollarformat(row_total12)#</td><cfset row_total12 =0>
				<td align="center">#dollarformat(row_total13)#</td><cfset row_total13 =0>
				<td align="center">#dollarformat(row_total14)#</td><cfset row_total14 =0>
		</tr>
	</cfif>
</cfif>		
</cfoutput>	
	<tr>
		<td colspan="17"><hr color="##000000"></td>
	</tr>
	
	<tr>      
	   <td colspan="8"><strong>Expense Paid by LewisCo Inc</strong></td>
	</tr>

	<cfoutput query="Expenses3">  	
<cfif Expenses3.recordcount>	
	<tr>  
	 	    <td><strong>#dateformat(work_date,"mm/d/yy")#</strong><br><br>#notes# </td>
	   	    <td>#code# </td>
	  	     <td align="center">#dollarformat(ExpenseType_1)#</td><cfset  total_hours_Date = total_hours_Date + ExpenseType_1> <cfset row_total1 = ExpenseType_1 +Row_Total1>
		   <td align="center">#dollarformat(ExpenseType_2)#</td><cfset  total_hours_Date = total_hours_Date + ExpenseType_2><cfset row_total2 = ExpenseType_2 +Row_Total2>
		   <td align="center">#dollarformat(ExpenseType_3)#</td><cfset  total_hours_Date = total_hours_Date + ExpenseType_3><cfset row_total3 = ExpenseType_3 +Row_Total3>
		   <td align="center">#dollarformat(ExpenseType_4)#</td><cfset  total_hours_Date = total_hours_Date + ExpenseType_4><cfset row_total4 = ExpenseType_4 +Row_Total4>
		   <td align="center">#dollarformat(ExpenseType_5)#</td><cfset  total_hours_Date = total_hours_Date + ExpenseType_5><cfset row_total5 = ExpenseType_5 +Row_Total5>
		   <td align="center">#dollarformat(ExpenseType_6)#</td><cfset  total_hours_Date = total_hours_Date + ExpenseType_6><cfset row_total6 = ExpenseType_6 +Row_Total6>
		   <td align="center">#dollarformat(ExpenseType_7)#</td><cfset  total_hours_Date = total_hours_Date + ExpenseType_7><cfset row_total7 = ExpenseType_7 +Row_Total7>
		   <td align="center">#dollarformat(ExpenseType_8)#</td><cfset  total_hours_Date = total_hours_Date + ExpenseType_8><cfset row_total8 = ExpenseType_8 +Row_Total8>
		   <td align="center">#dollarformat(ExpenseType_9)#</td><cfset  total_hours_Date = total_hours_Date + ExpenseType_9><cfset row_total9 = ExpenseType_9 +Row_Total9>
		   <td align="center">#dollarformat(ExpenseType_10)#</td><cfset  total_hours_Date = total_hours_Date + ExpenseType_10><cfset row_total10 = ExpenseType_10 +Row_Total10>
		   <td align="center">#dollarformat(ExpenseType_11)#</td><cfset  total_hours_Date = total_hours_Date + ExpenseType_11><cfset row_total11 = ExpenseType_11 +Row_Total11>
		   <td align="center">#dollarformat(ExpenseType_12)#</td><cfset  total_hours_Date = total_hours_Date + ExpenseType_12><cfset row_total12 = ExpenseType_12 +Row_Total12>
		   <td align="center">#dollarformat(ExpenseType_13)#</td><cfset  total_hours_Date = total_hours_Date + ExpenseType_13><cfset row_total13 = ExpenseType_13 +Row_Total13>
		   <td align="center">#dollarformat(ExpenseType_14)#</td><cfset  total_hours_Date = total_hours_Date + ExpenseType_14><cfset row_total14 = ExpenseType_14 +Row_Total14>
		   <td>#dollarformat(total_hours_Date)#</td><cfset  Grand_total = Grand_total + total_hours_Date><!--- <cfset  total_hours_Date = 0> --->	
	</tr>
	<cfif expenses3.CurrentRow EQ Expenses3.recordcount>
		<tr>
				<td colspan="2" align="center"><strong>Totals:</strong></td>
				<td align="center">#dollarformat(row_total1)#</td><cfset row_total1 =0>
				<td align="center">#dollarformat(row_total2)#</td><cfset row_total2 =0>
				<td align="center">#dollarformat(row_total3)#</td><cfset row_total3 =0>
				<td align="center">#dollarformat(row_total4)#</td><cfset row_total4 =0>
				<td align="center">#dollarformat(row_total5)#</td><cfset row_total5 =0>
				<td align="center">#dollarformat(row_total6)#</td><cfset row_total6 =0>
				<td align="center">#dollarformat(row_total7)#</td><cfset row_total7 =0>
				<td align="center">#dollarformat(row_total8)#</td><cfset row_total8 =0>
				<td align="center">#dollarformat(row_total9)#</td><cfset row_total9 =0>
				<td align="center">#dollarformat(row_total10)#</td><cfset row_total10 =0>
				<td align="center">#dollarformat(row_total11)#</td><cfset row_total11 =0>
				<td align="center">#dollarformat(row_total12)#</td><cfset row_total12 =0>
				<td align="center">#dollarformat(row_total13)#</td><cfset row_total13 =0>
				<td align="center">#dollarformat(row_total14)#</td><cfset row_total14 =0>
		</tr>
	</cfif>
</cfif>		
</cfoutput>	
	<tr>
		<cfoutput><td colspan="17" align="right"><strong><em>Grand Total: </em>#dollarformat(grand_total)#</strong></td></cfoutput>
	</tr>

	<tr>
		<td colspan="17"><hr color="##000000"></td>
	</tr>
</table>

</body>
</html>
 --->