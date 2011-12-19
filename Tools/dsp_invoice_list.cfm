
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
	Revision 1.3  2005/08/25 16:15:34  stetzer
	<>

	Revision 1.2  2005-08-25 12:14:17-04  stetzer
	<>

	Revision 1.1  2005-08-25 12:10:23-04  stetzer
	Adding capability to post invoices individually for off-cycle needs.

	Revision 1.0  2005-02-15 16:01:17-05  daugherty
	Initial revision

	Revision 1.2  2002-01-29 18:00:32-05  french
	Added JavaScript formatting to output to prevent JavaScript errors on page load.

	Revision 1.1  2001-10-11 13:15:36-04  long
	Added FuseDoc

	||
	Variables:
	END FUSEDOC --->
</cfsilent>
<cfoutput query="invoice_list">
	<tr<cfif (currentrow MOD 2)> bgcolor="##E1E1E1"</cfif> class="RegText#session.workstream_text_size#">
		<td class="RegText#session.workstream_text_size#">
			<cfset StatusMsg=JSStringFormat("(#root_code##Replace(project_code,root_code,"")#) #trim(customers_name)# #trim(Replace(project_name,"#customers_name#",""))#")><a href="javascript:list_to_details('#project_id#|#billable_id#');" onmouseover="MM_displayStatusMsg('View details for #StatusMsg#.');return document.MM_returnValue;" onmouseout="MM_displayStatusMsg('');" class="RegText#session.workstream_text_size#">#StatusMsg#</a>
		</td>
		<td align="right" class="RegText#session.workstream_text_size#">
			#billable_type#
		</td>
		<td align="right" class="RegText#session.workstream_text_size#">
			#DollarFormat(bill)#
		</td>
		<td align="right" class="RegText#session.workstream_text_size#">
			<a href="javascript:list_to_tasks('#project_id#');" onmouseover="MM_displayStatusMsg('View tasks for #StatusMsg#.');return document.MM_returnValue;" onmouseout="MM_displayStatusMsg('');" class="RegText#session.workstream_text_size#">#total_tasks#</a>
	<cfif authuser contains 'stetzer'>
	&nbsp;&nbsp;&nbsp;&nbsp;<a href="../../monitor/Invoice_Post_Individually.cfm?project_id=#project_id#&Total_bill_amount=#bill#">Post</a>
	</cfif>
		</td>

	
		
	</tr>
</cfoutput>
