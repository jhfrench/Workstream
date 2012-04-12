
<!--Reports/error1.cfm
	Author: Jeromy F  -->
<cfsilent>
	<!--- FUSEDOC
	||
	Responsibilities: I am the page that loads for errors on the reports module.

	||
	Edits:
	$Log$
	||
	END FUSEDOC --->
</cfsilent>
<div align="center" class="HeadText">There has been a problem with the report you requested. <br />
Please verify the date range that you selected and try to rerun your report.<br />
This page will redirect you to the Report page. <br />
If the problem persists please notify The workstream Administrator.<br />
<a href="mailto:jeromy_french@hotmail.com">jeromy_french@hotmail.com</a><br />
Thank You</div>

<meta http-equiv="Refresh"  content="10; url=index.cfm?fuseaction=Reports.home">