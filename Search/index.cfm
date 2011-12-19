
<!--Search/index.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!-- FUSEDOC
	||
	Responsibilities: I am the FUSEBOX for the Search module of the spiffy Nucleus designed workstream system. 
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	Revision 1.1  2006/04/07 17:57:40  csy
	task42743 Added the edit search case to handle search criteria update

	Revision 1.0  2005-02-15 15:58:27-05  daugherty
	Initial revision

	Revision 1.2  2001-10-17 09:45:43-04  french
	Corrected the page title for the search results page.

	Revision 1.1  2001-10-11 10:55:24-04  long
	Added $log $ for edits to all CFM files that have fusedocs.
	||
	Variables:
	END FUSEDOC --->
	<cfswitch expression="#attributes.fuseaction#">
	</cfswitch>
</cf_bodycontent>
<include template="../common_files/app_layout.cfm">

