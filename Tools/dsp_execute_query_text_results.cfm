
<!--Tools/dsp_execute_query_text_results.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I run all of the automatic daily processes for NGuage.
	||
	Name: Jeromy French
	||
	--->
</cfsilent>
<table border="1" cellpadding="0" cellspacing="0">
<cfif execute_query_text.recordcount>
<cfoutput>
	<tr>
	<cfloop list="#execute_query_text.columnlist#" index="ii">
		<td align="center" class="RegText#session.workstream_text_size#Bd">
			#ii#
		</td>
	</cfloop>
	</tr>
</cfoutput>
<cfoutput query="execute_query_text">
	<tr>
	<cfloop list="#execute_query_text.columnlist#" index="ii">
		<td class="RegText#session.workstream_text_size#">
			#evaluate(ii)#
		</td>
	</cfloop>
	</tr>
</cfoutput>
<cfelse>
<cfoutput>
	<tr>
		<td align="center" colspan="#listlen(execute_query_text.columnlist)#" class="RegText#session.workstream_text_size#Bd">
			No results returned.
		</td>
	</tr>
</cfoutput>
</cfif>
</table>