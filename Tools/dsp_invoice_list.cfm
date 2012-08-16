
<!--Tools/dsp_invoice_list.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the column headers for the invoice list.
	||
	Name: Jeromy French
	||
	Edits: 
	$Log$
	||
	Variables:
	END FUSEDOC --->
</cfsilent>
<cfoutput query="invoice_list">
	<tr>
		<td>
			<a href="javascript:list_to_details('#project_id#|#billable_type_id#');">#JSStringFormat("(#root_code##replace(project_code,root_code,"")#) #trim(customer_name)# #trim(replace(project_name,customer_name,""))#")#</a>
		</td>
		<td>
			#billable_type#
		</td>
		<td class="number">
			#dollarformat(revenue)#
		</td>
		<td class="number">
			<a href="javascript:list_to_tasks('#project_id#');" title="View list of tasks.">#total_tasks#</a>
		</td>
	</tr>
</cfoutput>
