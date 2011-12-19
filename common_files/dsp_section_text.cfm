
<!--common_files/dsp_section_text.cfm
	Author: Jeromy F -->
<cfsilent>	
	<!--- FUSEDOC
	||
	Responsibilities: I display the links and text that make up the timekeeping module welcome screen.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
	--> session.workstream_text_size: string that contains either Lg, Md, or Sm; used in dynamically creating class and refers to text size
	END FUSEDOC --->
<cfparam name="attributes.colspan" default=2>
<cfparam name="attributes.section_text" default="">
<cfparam name="attributes.title_class" default="RegText#session.workstream_text_size#">
<cfparam name="attributes.section_color" default="ffffff">
<cfparam name="attributes.section_align" default="left">
<cfset variables.colspan=max(attributes.colspan-1,1)>
</cfsilent>
<cfoutput>
	<tr bgcolor="###attributes.section_color#" class="#attributes.title_class#">
		<td colspan="1" width="1" valign="bottom" class="#attributes.title_class#">
			&nbsp;
		</td>
		<td colspan="#variables.colspan#" align="#attributes.section_align#" valign="bottom" class="#attributes.title_class#">
			#attributes.section_text#
		</td>
	</tr>
</cfoutput>

