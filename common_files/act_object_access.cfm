
<!-- common_files/act_object_check.cfm
	Author: Mike H -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities:  
	||
	Name: Mike Haggerty
	||
	Edits:
	$Log$
	Revision 1.0  2005/02/15 20:41:07  daugherty
	Initial revision

	||
	Variables:
	||
	END FUSEDOC --->
<cfparam name="session.workstream_object_text" default="default value">
<cfif listcontainsnocase(session.workstream_object_access, attributes.object_name) EQ 0>
	<cflocation url="#request.dir_level#error/index.cfm?fuseaction=sorry" addtoken="no">
</cfif>
</cfsilent>

