
<!--Customers/dsp_company_id_box.cfm
	Author: Jeromy F -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I

	||
	Edits:
	$Log$
	 ||
	END FUSEDOC --->

<cfselect required="yes" message="You must select a company to be visible to." name="company_id" size="3" multiple="yes">
						<cfoutput query="get_visable_to">
							<option value="<cfif isdefined("company_id")>#company_id#<cfelse>#company_id#</cfif>" selected="selected">#company#</option>
						</cfoutput>
						<cfoutput query="get_ref_company">
							<option value="#company_id#" >#description#</option>
						</cfoutput>
				</cfselect>
