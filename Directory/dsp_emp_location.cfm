
<!--Directory/dsp_emp_location.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the mailing addresses for an employee.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
Revision 1.0  2005/02/15 20:46:36  daugherty
Initial revision

Revision 1.1  2001-10-11 10:56:11-04  long
added $log $ for edits.  To all CFM files that have fusedocs.


	||
	END FUSEDOC --->
</cfsilent>
<table cellpadding="0" cellspacing="0" border="0" width="80%">
	<tr>
		<td<cfoutput> colspan"#get_emp_location.recordcount#" class="SubHeadText#session.workstream_text_size#"</cfoutput>>
			Address
		</td>
	</tr>
	<tr>
<cfoutput query="get_emp_location">
		<td valign="top" width="40" class="RegText#session.workstream_text_size#">#location_type#:</td>
		<td valign="top" class="RegText#session.workstream_text_size#">#address1#<br><cfif compare(address2,"")>#address2#<br></cfif>#city#, #state# #zip#<br></td>
</cfoutput>
	</tr>
</table>

