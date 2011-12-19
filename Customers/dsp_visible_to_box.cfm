
<!--Customers/dsp_visible_to_box.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I

	||
	Edits:
	$Log$
Revision 1.0  2005/02/15 20:45:56  daugherty
Initial revision

Revision 1.1  2001-10-11 10:56:26-04  long
added $log $ for edits.  To all CFM files that have fusedocs.


	 
	||
	END FUSEDOC --->

<cfselect  required="Yes" message="You must select a company to be visible to."name="visible_to" size="3" multiple  class="RegText#session.workstream_text_size#">
						<cfoutput query="get_visable_to">
							<option value="<cfif isdefined("visible_to")>#visible_to#<cfelse>#company_id#</cfif>" selected>#company#</option>
						</cfoutput>
						<cfoutput query="get_companies">
							<option value="#company_id#" >#company#</option>
						</cfoutput>
				</cfselect>
				