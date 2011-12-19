
<!--Customers/qry_marketing_grid.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I massage the marketing query into a cfgrid friendly format.

	||
	Edits:
	$Log$
Revision 1.0  2005/02/15 20:51:20  daugherty
Initial revision

Revision 1.1  2001-10-11 10:55:41-04  long
added $log $ for edits.  To all CFM files that have fusedocs.


	 
	||
	END FUSEDOC --->

<cfset currow = 1>
	<cfscript>
		marketing_grid=querynew('emp_id1, emp_id2, emp_id3, marketing_id, project_id,project_code,Description, last_task, date, statusabovedate, statusindate, statusbestfewdate, statuscontractdate, overview, active_id, company_size, source, projected_revenue, probability, name1, lname1, Phone1, extension1, paddress1, saddress1, city1, state1, zip1, email1,name2, lname2, Phone2, extension2, paddress2, saddress2, city2, state2, zip2,  email2, name3, lname3, Phone3, extension3, paddress3, saddress3, city3, state3, zip3,  email3, add');
</cfscript>
		<cfoutput query="marketing" group="project_id">
			<cfscript>
				null=QueryAddRow(marketing_grid, 1);
				null=QuerySetCell(marketing_grid, 'marketing_id', '#marketing_id#' , #currow#);
				null=QuerySetCell(marketing_grid, 'project_id', '#project_id#' , #currow#);
				null=QuerySetCell(marketing_grid, 'project_code', '#project_code#' , #currow#);
				null=QuerySetCell(marketing_grid, 'Description', '#description#', #currow#);
				null=QuerySetCell(marketing_grid, 'last_task', '#last_task#', #currow#);
				null=QuerySetCell(marketing_grid, 'date',  '#date#', #currow#);
				null=QuerySetCell(marketing_grid, 'statusabovedate',  '#statusabovedate#', #currow#);
				null=QuerySetCell(marketing_grid, 'statusindate',  '#statusindate#', #currow#);
				null=QuerySetCell(marketing_grid, 'statusbestfewdate', '#statusbestfewdate#' , #currow#);
				null=QuerySetCell(marketing_grid, 'statuscontractdate', '#statuscontractdate#' , #currow#);
				null=QuerySetCell(marketing_grid, 'overview', '#overview#' , #currow#);
				null=QuerySetCell(marketing_grid, 'active_id', '#active_id#' , #currow#);
				null=QuerySetCell(marketing_grid, 'company_size', '#company_size#' , #currow#);
				null=QuerySetCell(marketing_grid, 'source', '#source#' , #currow#);
				null=QuerySetCell(marketing_grid, 'projected_revenue', '#projected_revenue#' , #currow#);
				null=QuerySetCell(marketing_grid, 'probability', '#probability#' , #currow#);
				null=QuerySetCell(marketing_grid, 'Add', 'Add' , #currow#);
				counter = 1;
			</cfscript>
				
				<cfoutput>
					<cfscript>
					null=QuerySetCell(marketing_grid, 'name#counter#', '#name#' , #currow#);
					null=QuerySetCell(marketing_grid, 'lname#counter#', '#lname#' , #currow#);
					null=QuerySetCell(marketing_grid, 'phone#counter#', '#phone#' , #currow#);
					null=QuerySetCell(marketing_grid, 'extension#counter#', '#extension#' , #currow#);
					null=QuerySetCell(marketing_grid, 'paddress#counter#', '#paddress#' , #currow#);
					null=QuerySetCell(marketing_grid, 'saddress#counter#', '#saddress#' , #currow#);
					null=QuerySetCell(marketing_grid, 'city#counter#', '#city#' , #currow#);
					null=QuerySetCell(marketing_grid, 'state#counter#', '#state#' , #currow#);
					null=QuerySetCell(marketing_grid, 'zip#counter#', '#zip#' , #currow#);
					null=QuerySetCell(marketing_grid, 'email#counter#', '#email#' , #currow#);
					null=QuerySetCell(marketing_grid, 'emp_id#counter#', '#emp_id#' , #currow#);
						counter=counter + 1;
					</cfscript>
				</cfoutput>
					<cfset currow = currow + 1>
		</cfoutput>
		