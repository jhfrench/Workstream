
<!--Directory/dsp_timekeeping_columns.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I display the main employee directory page.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
	END FUSEDOC --->
	<tr valign="top">
		<td width="10%">This could be report navigation with anchor links to the appropriate section</td>
		<td width="30%">
			<table cellpadding="0" cellspacing="0" border="0" width="100%">
				<cfmodule template="../common_files/dsp_section_title.cfm" colspan="2" section_color="008080" section_title="PTO" title_class="HeadTextWhite">
				<cfmodule template="../common_files/dsp_section_text.cfm" colspan="2" section_color="ffffff" section_text="This month you have 40 hours of PTO remaining. Last month you had 32 hours. Click here to view the report." title_class="RegText">
				<cfmodule template="../common_files/dsp_section_title.cfm" colspan="2" section_color="008000" section_title="Efficiency" title_class="HeadTextWhite">
				<cfmodule template="../common_files/dsp_section_text.cfm" colspan="2" section_color="ffffff" section_text="Your efficiency decreassed from the past month. Your least efficient task (Resolve SBC Error) earned you a score of 45.62. You earned a score of 1223.1 on your most efficient task (Adam's Laptop)" title_class="RegText">
			</table>
		</td>
		<td width="30%">
			<table cellpadding="0" cellspacing="0" border="0" width="100%">
				<cfmodule template="../common_files/dsp_section_title.cfm" colspan="2" section_color="0000FF" section_title="Hours Worked" title_class="HeadTextWhite">
				<cfmodule template="../common_files/dsp_section_text.cfm" colspan="2" section_color="ffffff" section_text="Last month you worked 48 hours. This month you worked 50 hours. This is an increase of 2 hours. You spent the most time on 'workstream Query Writing.' But you should have spent it at the baseball park. Football is coming up soon. The Redskins are going to suck. How much more text can I fit in here? Looks like a lot. Usually this section would have lots of descriptive text and perhaps even a graph or two." title_class="RegText">
			</table>
		</td>
		<td width="30%">
			<table cellpadding="0" cellspacing="0" border="0" width="100%">
				<cfmodule template="../common_files/dsp_section_title.cfm" colspan="2" section_color="800000" section_title="Quality" title_class="HeadTextWhite">
				<cfmodule template="../common_files/dsp_section_text.cfm" colspan="2" section_color="ffffff" section_text="You had no tasks marked for rework. Your quality percent is 100%. Last month your quality rating was 94%" title_class="RegText">
			</table>
		</td>
	</tr>
