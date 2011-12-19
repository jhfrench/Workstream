<!-- sourcecode/OnRequestEnd.cfm
	Author: Jeromy French -->
<!---
<fusedoc language="ColdFusion MX" specification="2.0" template="OnRequestEnd.cfm">
	<responsibilities>
	</responsibilities>
	<properties>
		<history email="jeromy.h.french@nasa.gov" author="Jeromy French" type="create" date="12/9/2008" role="FuseCoder" comments="Created File">
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
<cfif application.log_page_request_ind>
	<cfmodule template="#variables.path_prefix#act_log_page_request.cfm" log_type_id="2" page_request_id="#variables.page_request_id#" page_request_start_time="#variables.page_request_start_time#">
</cfif>