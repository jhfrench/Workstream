

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
	||
	END FUSEDOC --->
<cf_htmlhead>
<!--common_files/act_validate_javascript.cfm (pt2)
	Author: Jeromy F-->
<cfoutput>
<script language="JavaScript" type="text/javascript">
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

