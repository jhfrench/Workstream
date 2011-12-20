   
<!--Tools/index.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!-- FUSEDOC
	||
	Responsibilities: I am the fuse box for the tools module.

	||
	Edits:
	$Log$
	||
	--> attributes.fuseaction: string, usually defined in the url, that dictates which page to display.
	<-- request.pagetitle: string that is used as a part of the HTML page title
	END FUSEDOC --->

<cfswitch expression="#attributes.fuseaction#">
	
	
	<!-- Begin Default Case --->
	<cfdefaultcase>
		<set name="request.pagetitle" value="Tools Home">
		<include template="pag_home.cfm">
	</cfdefaultcase>
<!-- End Default Case --->
	</cfswitch>
</cf_bodycontent>
<include template="../common_files/app_layout.cfm">

