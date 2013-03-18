
<!--Directory/dsp_emp_phone.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the phone numbers for an employee.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 || 
	END FUSEDOC --->
<cfset variables.list1="(,), ,-,x,.">
<cfset variables.list2=",,,,,">
</cfsilent>
<h4>Phone</h4>
<dl class="dl-horizontal">
<cfoutput query="get_emp_phone">
	<dt>#phone_type#</dt>
	<dd>
		<cfset variables.phone=replacelist(phone_number, variables.list1, variables.list2)>
		<cfif len(variables.phone) EQ 10>
			<cfset variables.phone="#left(variables.phone,3)#.#mid(variables.phone,4,3)#.#right(variables.phone,4)#">
			<a href="tel:#replace(variables.phone, ".", "-", "all")#">#variables.phone#</a>
		<cfelseif len(variables.phone) EQ 7>
			#left(variables.phone,3)#-#right(variables.phone,4)#
		<cfelse>
			#variables.phone#
		</cfif>
		<cfif len(extension)> x#extension#</cfif>
	</dd> 
</cfoutput>
</dl>