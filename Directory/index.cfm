
<!--Directory/index.cfm
	Author: Jeromy F -->
<cfsilent>
	<!-- FUSEDOC
	||
	Responsibilities: This is the FUSE BOX. This is where everything is fused together for the Directory module which is used to add/edit/delete employees/users.
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
		<!-- <set name="attributes.object_name" value="Employee List">
		<include template="../common_files/act_object_access.cfm"> -->
		<set name="request.pagetitle" value="Employee Directory">
		<cfinclude template="pag_directory.cfm">
	</cfdefaultcase>
</cfswitch>
</cf_bodycontent>
<include template="../common_files/app_layout.cfm">

