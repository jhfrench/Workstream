
<!--Marketing/index.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!-- FUSEDOC
	||
	Responsibilities: I am the FUSEBOX for the Marketing module of the spiffy Nucleus designed timekeeping system. 

	||
	Edits:
	$Log$
	Revision 1.0  2005/02/15 20:51:08  daugherty
	Initial revision

	Revision 1.2  2001-11-30 11:59:06-05  french
	Fixing report access error and de-stetzering..

	Revision 1.1  2001-10-11 10:55:48-04  long
	Added $log $ for edits to all CFM files that have fusedocs.
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

