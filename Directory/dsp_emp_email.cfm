
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
<h4>Email</h4>
<cfoutput query="get_emp_email">
<b>#email_type#</b>: <a href="mailto:#email#">#email#</a><br />
</cfoutput>