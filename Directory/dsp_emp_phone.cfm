
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
<cfset list1="(,), ,-,x,.">
<cfset list2=",,,,,">
</cfsilent>
<span class="SubHeadText<cfoutput>#session.workstream_text_size#</cfoutput>">Phone</span><br>
<cfoutput query="get_emp_phone">
#phone_type#: 
<cfset phone=ReplaceList(phone_number,list1,list2)>
<cfif len(phone) EQ 10>
(#left(phone,3)#) #mid(phone,4,3)#-#right(phone,4)#
<cfelseif len(phone) EQ 7>
#left(phone,3)#-#right(phone,4)#
<cfelse>
#phone#
</cfif>
<cfif compare(extension,"")> x#extension#</cfif><br>
</cfoutput>

