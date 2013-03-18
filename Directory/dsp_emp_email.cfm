
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
<dl class="dl-horizontal">
<cfoutput query="get_emp_email">
	<dt>#email_type#</dt>
	<dd><a href="mailto:#email#">#email#</a></dd>
</cfoutput>
</dl>