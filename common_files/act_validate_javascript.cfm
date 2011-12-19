

<!--common_files/act_validate_javascript.cfm
	Author: Jeromy F-->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: Javascript that allows us to use cfform validation and an image as the submit button.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
Revision 1.0  2005/02/15 20:41:13  daugherty
Initial revision

Revision 1.1  2001-10-11 10:58:00-04  long
added $log $ for edits.  To all CFM files that have fusedocs.


	||
	END FUSEDOC --->
<cf_htmlhead>
<!--common_files/act_validate_javascript.cfm (pt2)
	Author: Jeromy F-->
<cfoutput>
<SCRIPT LANGUAGE="JavaScript" TYPE="text/javascript">
	<!--
	function submit_input_form()
	{
	if 
	( _CF_checkinput_form(document.input_form) )
				document.input_attributes.submit()
	}
	//-->
</SCRIPT>
</cfoutput>
</cf_htmlhead>

