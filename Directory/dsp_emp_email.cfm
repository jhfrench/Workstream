
<!--Directory/dsp_emp_email.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the email addresses for an employee.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
	END FUSEDOC --->
</cfsilent>
<span class="SubHeadText<cfoutput>#session.workstream_text_size#</cfoutput>">Email</span><br>
<cfoutput query="get_emp_email">
#email_type#: <a href="mailto:#email#"  class="RegText#session.workstream_text_size#">#email#</a><br>
</cfoutput>

