
<!-- common_files/act_forward_browser.cfm
	Author: Jeromy F-->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am an act file that takes a list of names for fields, each 
	field must have a vlaue associated with it.  The form will automatically submit and therby
	Forward you 

	||
	Edits: 
	$Log$
	Revision 1.0  2005/02/15 20:41:04  daugherty
	Initial revision

	||
	Variables:
	==> fields:  this is the list
	==> action: the action page of the form.
	END FUSEDOC --->
<cfoutput>
<form name="continue_on" method="post" action="#attributes.action#">
	<cfloop list="#attributes.fields#" index="ii">
	<input type="Hidden" name="#ii#" value="#evaluate(ii)#">
	</cfloop>
</form>
</cfoutput>
<script language="JavaScript">
	document.continue_on.submit()
</script>