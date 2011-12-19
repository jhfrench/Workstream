
<!--Customers/pag_new_engagement.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the page that allows the user to create a new engagement for an existint customer.

	||
	Edits:
	$Log$
Revision 1.0  2005/02/15 20:46:02  daugherty
Initial revision

Revision 1.1  2001-10-11 10:56:23-04  long
added $log $ for edits.  To all CFM files that have fusedocs.


	 
	(KL | 9/17/2001) removed the Align attribute from the cfform tag
	(KL | 10/2/2001) Added the act_new_engagement_instructions.cfm code for the instructions pop up
	(JF | 10/8/1) Turned new engagement screen into a 'wizard' in order to add new engagement details and simplify process.
	||
	END FUSEDOC --->
<cfparam name="attributes.step" default="1">
<cfparam name="attributes.fuseaction" default="new_engagement">
</cfsilent>
<cfform name="new_engagement" method="POST" action="index.cfm?fuseaction=#attributes.fuseaction#">
<table align="center" border="0" cellpadding="1" cellspacing="0" width="90%">
	<cfmodule template="../common_files/dsp_section_title.cfm" title_class="HeadText#session.workstream_text_size#White" section_color="008000" section_title="&nbsp;Create New Engagement, Step #attributes.step#" colspan="5" gutter="false" align="left">
	<cfinclude template="dsp_new_engagement_step#attributes.step#.cfm">
</table>
</cfform>

