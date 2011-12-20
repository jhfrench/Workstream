
<!--Timekeeping/index.cfm
	Author: Jeromy F -->
<cfsilent>	
	<!-- FUSEDOC
	||
	Responsibilities: This is the FUSE BOX. This is where everything is fused together for the timekeeping module.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	||
	Variables:
	--> attributes.fuseaction: string, usually defined in the url, that dictates which page to display.
	<-- request.pagetitle: string that is used as a part of the HTML page title
	END FUSEDOC --->

	<cfswitch expression="#attributes.fuseaction#">
	
		<cfdefaultcase>
			<cfif session.workstream_emp_contact_type EQ 1>
				<set name="attributes.object_name" value="Home">	
				<include template="../common_files/act_object_access.cfm">
				<set name="request.pagetitle" value="Timekeeping">
				<include template="pag_timekeeping.cfm">
			</cfif>
		</cfdefaultcase>
	</cfswitch>
</cf_bodycontent>
<include template="../common_files/app_layout.cfm">

