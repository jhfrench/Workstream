
<!--Directory/dsp_salary_entry_header.cfm
	Author: Damon S -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I display the header for the salary entry function.
	||
	Name: Damon Scott
	||
	Edits:
$Log: 

 
	||
	END FUSEDOC --->
</cfsilent>
<cfoutput>
	<tr bordercolor="##78A0EB" bgcolor="##78A0EB">
		<td<cfif isdefined("colspan")> colspan="#colspan#"</cfif> class="SubHeadText">
			<strong>Salary Entry Form</strong>
		</td>
		<td<cfif isdefined("colspan")> colspan="#colspan#"</cfif> class="SubHeadText">
			&nbsp;
		</td>
	</tr>
</cfoutput>

