
<!--Directory/qry_open_positions.cfm
	Author: Jeromy F -->

	<!---FUSEDOC
	||
	Responsibilities: I query the open positions from the positions table. 
	||
	Name: Jeromy French
	||
	Edits: 
	
	||
	
 --->

<cfquery name="get_position_numbers" datasource="#application.datasources.main#">
Select * 
from Positions
	LEFT  OUTER JOIN (
		Select Position_ID, Effective_StartDate, Effective_EndDate
		From Position_History,
			(
				Select Max(Position_History_ID) as Position_History_ID 
				From position_history
				Group By Position_ID
			) as inner_query
		Where Position_History.Position_History_ID = Inner_Query.Position_History_ID
	) AS Inner_Query2 ON Positions.Position_ID = Inner_Query2.Position_ID
Where Active_ind = 1 
	and (
		(
			Inner_Query2.Position_ID is not null 
			and Inner_Query2.Effective_EndDate < GETDATE()
		)
	or 
		(
			Inner_Query2.Position_ID is null
		)
)
</cfquery>