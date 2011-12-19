
<!--common_files/dsp_section_title.cfm
	Author: Jeromy F-->
<cfsilent>	
	<!--- FUSEDOC
	||
	Responsibilities: This is the header for all module welcome pages.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
Revision 1.0  2005/02/15 20:41:28  daugherty
Initial revision

Revision 1.1  2001-10-11 10:57:50-04  long
added $log $ for edits.  To all CFM files that have fusedocs.


	||
	END FUSEDOC --->
<cfparam name="attributes.colspan" default=4>
<cfparam name="attributes.section_title" default="">
<cfparam name="attributes.title_class" default="HeadText#session.workstream_text_size#White">
<cfparam name="attributes.section_color" default="ffffff">
<cfparam name="attributes.gutter" default=1>
<cfparam name="attributes.align" default="left">
<cfset variables.colspan=max(attributes.colspan-1,1)>
</cfsilent>
<cfoutput>
	<tr bgcolor="###attributes.section_color#" class="#attributes.title_class#">
		<cfif attributes.gutter><td colspan="1" width="1" valign="bottom" class="#attributes.title_class#">
			&nbsp;
		</td></cfif>
		<td colspan="#variables.colspan#" align="#attributes.align#" valign="bottom" class="#attributes.title_class#">
			#attributes.section_title#
		</td>
	</tr>
</cfoutput>

