
<!--Marketing/index.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!-- FUSEDOC
	||
	Responsibilities: I am the FUSEBOX for the Marketing module of the spiffy Nucleus designed timekeeping system. 

	||
	Edits:
	$Log$
	||
	Variables: --> fuseaction: string, usually defined in the url, that dictates which page to display.
	END FUSEDOC --->
	<cfswitch expression="#attributes.fuseaction#">
 		<cfdefaultcase>
			<set name="attributes.object_name" value="marketing">	
			<include template="../common_files/act_object_access.cfm">
			<set name="request.pagetitle" value="Marketing">
			<include template="pag_marketing_home.cfm">
		</cfdefaultcase> 
</cfswitch>
</cf_bodycontent>
<include template="../common_files/app_layout.cfm">

