
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
Revision 1.0  2005/02/15 20:46:34  daugherty
Initial revision

Revision 1.1  2001-10-11 10:56:11-04  long
added $log $ for edits.  To all CFM files that have fusedocs.


	||
	END FUSEDOC --->
<span class="SubHeadText<cfoutput>#session.workstream_text_size#</cfoutput>">Email</span><br>
<cfoutput query="get_emp_email">
#email_type#: <a href="mailto:#email#"  class="RegText#session.workstream_text_size#">#email#</a><br>
</cfoutput>

