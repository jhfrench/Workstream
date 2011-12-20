
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
<span class="SubHeadText">Email</span><br>
<cfoutput query="get_emp_email">
#email_type#: <a href="mailto:#email#"  class="RegText">#email#</a><br>
</cfoutput>

