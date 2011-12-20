
<!--Reports/dsp_new_engage_input.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the input page that lets a user choose a set of customers to retrieve new engagement histories.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
	END FUSEDOC --->
</cfsilent>
<tr align="center">
	<td>
		<cfselect name="root_code" query="new_engage_input" value="root_code" display="customer_name" size="#min(new_engage_input.recordcount,15)#" required="Yes" message="Please choose at least one customer." multiple="Yes" class="RegText"></cfselect>
	</td>
</tr>


