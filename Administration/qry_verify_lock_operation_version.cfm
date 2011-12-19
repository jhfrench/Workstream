<!-- Administration/qry_verify_lock_operation_version.cfm
	Author: Kelly Poon -->
<!--- -->
<fusedoc language="ColdFusion MX" specification="2.0" template="qry_verify_lock_operation_version.cfm">
	<responsibilities>
		According to business rule, there can only be one Operations Plan open version at a time for a given fund.  This query checks
		to see if a fund has an open version.
	</responsibilities>
	<properties>
		<history email="kpoon@hq.nasa.gov" author="Kelly Poon" type="create" date="3/31/2008" role="FuseCoder" comments="Created File">
			$Id:$
		</history>
	</properties>
	<IO>
		<in>
		</in>
		<passthrough>
		</passthrough>
		<out>
		</out>
	</IO>
</fusedoc>
--->
<cfquery name="verify_lock_operation_version" datasource="#application.datasources.main#">
	select a.* 
	from Appropriation_version a, Link_Program_Year_Fund b
	where a.active_ind=1
  		and b.active_ind=1
  		and a.l_p_y_f_id=b.l_p_y_f_id
  		and b.program_year_id=#attributes.program_year_id#
  		and b.fund_id=#attributes.fund_id#
  		and a.appropriation_version_id NOT IN (
  			select a.appropriation_version_id 
			from Lock_Appropriation_Version a, Appropriation_version b, Link_Program_Year_Fund c
			where a.active_ind=1
				and b.active_ind=1
				and c.active_ind=1
				and a.appropriation_version_id=b.appropriation_version_id
				and b.l_p_y_f_id=c.l_p_y_f_id
				and c.program_year_id=#attributes.program_year_id#
				and c.fund_id=#attributes.fund_id#
  		)		
</cfquery>