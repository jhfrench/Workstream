
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
	 || 
	END FUSEDOC --->
</cfsilent>
<h4>Address</h4>
<dl class="dl-horizontal">
<cfoutput query="get_emp_location">
	<dt>#location_type#</dt>
	<dd>
		<address>
			#address1#<br />
			<cfif compare(address2,"")>#address2#<br /></cfif>
			#city#, #state# #zip#
		</address>
	</dd>
</cfoutput>
</dl>