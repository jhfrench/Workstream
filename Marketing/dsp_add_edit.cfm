
<!--Marketing/dsp_add_edit.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the form that lets the user choose if they want to update or delete a marketing contact.

	||
	Edits:
	$Log$
	||
	END FUSEDOC --->

<form name="edit" action="index.cfm?fuseaction=Marketing.add_edit&cfgridkey=<cfoutput>#attributes.cfgridkey#</cfoutput>" method="post">

	<tr>
		<td  colspan="2"class="SubHeadText">Would you like to Edit or Delete this contact. <cfoutput query="get_contact"><span class="RegTextIt">#name# #lname#</span></cfoutput></td>
	</tr>
	<tr>
		<td align = "right">Edit</td>
		
		<td><input  type="Radio" name="select" value="e"> </td>
	</tr>
	<tr>	
		<td align = "right">Delete</td>
		<td><input type="radio" name="select" value="d"> 
		<input type="hidden" name="emp_id" value="<cfoutput>#attributes.cfgridkey#</cfoutput>">
		<input type="hidden" name="flag" value="1">
		<input type="hidden" name="cfgridkey" value="<cfoutput>#attributes.cfgridkey#</cfoutput>">
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center"><input type="submit" value="Submit"></td>
	</tr>

</form>


