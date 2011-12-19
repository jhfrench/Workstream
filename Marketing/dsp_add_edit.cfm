
<!--Marketing/dsp_add_edit.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the form that lets the user choose if they want to update or delete a marketing contact.

	||
	Edits:
	$Log$
Revision 1.0  2005/02/15 20:50:48  daugherty
Initial revision

Revision 1.1  2001-10-11 10:56:01-04  long
added $log $ for edits.  To all CFM files that have fusedocs.


	 
	||
	END FUSEDOC --->

<form name="edit" action="index.cfm?fuseaction=Marketing.add_edit&cfgridkey=<cfoutput>#attributes.cfgridkey#</cfoutput>" method="post">

	<tr>
		<td  colspan="2"class="SubHeadText<cfoutput>#session.workstream_text_size#</cfoutput>">Would you like to Edit or Delete this contact. <cfoutput query="get_contact"><span class="RegText#session.workstream_text_size#It">#name# #lname#</span></cfoutput></td>
	</tr>
	<tr>
		<td class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>" align = "right">Edit</td>
		
		<td><input  type="Radio" name="select" value="e"> </td>
	</tr>
	<tr>	
		<td class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>" align = "right">Delete</td>
		<td><input type="radio" name="select" value="d"> 
		<input type="Hidden" name="emp_id" value="<cfoutput>#attributes.cfgridkey#</cfoutput>">
		<input type="Hidden" name="flag" value="1">
		<input type="Hidden" name="cfgridkey" value="<cfoutput>#attributes.cfgridkey#</cfoutput>">
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center"><input type="Submit" value="Submit" class="RegText<cfoutput>#session.workstream_text_size#</cfoutput>"></td>
	</tr>

</form>


