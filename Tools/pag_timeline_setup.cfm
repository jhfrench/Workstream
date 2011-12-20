
<!--Tools/pag_timeline_setup.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I contain the fuses for the change date locked screen.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
	END FUSEDOC --->
<cfparam name="session.last_submitted" default="#now()#">
<cfset variables.start=0>
<cfparam name="attributes.step" default="1">
<cfif attributes.step EQ 4>
	<cfset variables.section_title="Entered: #attributes.project_planning_name#">
<cfelse>
	<cfset variables.section_title="Setup, Step #attributes.step#">
</cfif>
</cfsilent>
<cfoutput>
<cfform name="timeline_setup" action="index.cfm?fuseaction=#attributes.fuseaction#" method="POST">
<table align="center" cellpadding="3" cellspacing="0" border="0" width="96%">
	<cfmodule template="../common_files/dsp_section_title.cfm" title_class="SubHeadTextWhite" section_color="772862" section_title="Project Timeline #variables.section_title#" gutter="0" align="left" colspan="5">
<cfif attributes.step NEQ 4>
<tr bgcolor="##c0c0c0">
	<td class="SubHeadText">Timeline Details</td>
	<td class="SubHeadText">Instructions</td>
</tr>
</cfif>
<cfif attributes.step EQ 1>
	<cfinclude template="dsp_timeline_setup_step1.cfm">
<cfelseif attributes.step EQ 2>
	<cfinclude template="dsp_timeline_setup_step2.cfm">
<cfelseif attributes.step EQ 3>
	<cfinclude template="dsp_timeline_setup_step3.cfm">
</cfif>
<cfif attributes.step EQ 4>
<cfif attributes.last_submitted NEQ session.last_submitted>
	<cfinclude template="act_timeline_setup.cfm">
	<cfinclude template="dsp_timeline_setup_step4.cfm">
<cfelse>
	<cfmodule template="../common_files/dsp_section_title.cfm" title_class="Note" section_color="ffffff" section_title="You've already entered this timeline." gutter="0" align="left" colspan="2">
</cfif>
<cfelse>
<tr>
	<td align="center" valign="top" class="RegText">
		<input type="submit" value="Proceed to the next step" class="RegText">
	</td>
	<td valign="top">
		<cfset variables.start=incrementvalue(variables.start)><ol type="1" start="#variables.start#" class="Note"><li>Click this button when you are ready to proceed to the next step. The information for this new timeline will not be stored until the wizard is finished.</li></ol>
	</td>
</tr>
</cfif>
</table>
</cfform>
</cfoutput>

