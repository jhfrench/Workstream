
<!--Tools/dsp_invoice_list.cfm
	Author: Jeromy F  -->
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
	<tr<cfif (currentrow MOD 2)> bgcolor="##E1E1E1"</cfif> class="RegText#session.workstream_text_size#">
		<td class="RegText#session.workstream_text_size#">
			<cfset StatusMsg=JSStringFormat("(#root_code##Replace(project_code,root_code,"")#) #trim(customers_name)# #trim(Replace(project_name,customers_name,""))#")><a href="javascript:list_to_details('#project_id#|#billable_type_id#');" onmouseover="MM_displayStatusMsg('View details for #StatusMsg#.');return document.MM_returnValue;" onmouseout="MM_displayStatusMsg('');" class="RegText#session.workstream_text_size#">#StatusMsg#</a>
		</td>
		<td align="right" class="RegText#session.workstream_text_size#">
			#billable_type#
		</td>
		<td align="right" class="RegText#session.workstream_text_size#">
			#dollarformat(bill)#
		</td>
		<td align="right" class="RegText#session.workstream_text_size#">
			<a href="javascript:list_to_tasks('#project_id#');" onmouseover="MM_displayStatusMsg('View tasks for #StatusMsg#.');return document.MM_returnValue;" onmouseout="MM_displayStatusMsg('');" class="RegText#session.workstream_text_size#">#total_tasks#</a>
		</td>
	</tr>
</cfoutput>
