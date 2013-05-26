
<!--Timekeeping/act_table_sorting.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I load and execute the JavaScript necessary to sort tables client-side.
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 ||
 --->
<cfscript>
	if (NOT isdefined("attributes.tabletools_ind")) {
		attributes.tabletools_ind=0;
	};
	if (NOT isdefined("attributes.bFilter")) {
		attributes.bFilter=0;
	};
	if (NOT isdefined("attributes.bPaginate")) {
		attributes.bPaginate=0;
	};
</cfscript>
</cfsilent>
<cfoutput>
<script type="text/javascript">
//if Modernizr determines they can be supported, load the following CSS and JavaScript resources
Modernizr.load([
	{
		load: [
			'../external/DataTables/DataTables/media/js/jquery.dataTables.js'<cfif attributes.bPaginate>,
			'../external/DataTables/Plugins/pagination/bootstrap.js'</cfif><cfif attributes.tabletools_ind>,
			'../external/DataTables/TableTools/media/js/TableTools.js',
			'../external/DataTables/TableTools/media/js/ZeroClipboard.js'</cfif>
		],
		complete: function() {
			//power ACRQ detail table sorting
			$(document).ready(function () {
				$('table.tablesorter').each( function() {
	                if ($(this).prop('rows').length > 2) {
						$(this).dataTable({
							"bAutoWidth": false,
							"bFilter": #attributes.bFilter#,
							"bLengthChange": false,
							"bPaginate": #attributes.bPaginate#,
							"iDisplayLength": 50,
							"sDom": "<cfif attributes.tabletools_ind><'row-fluid'<'span6'f><'span6'<'pull-right'T>>r></cfif>t<cfif attributes.bPaginate><'row-fluid'<'span6'i><'span6'<'pull-right'p>>></cfif>"<cfif attributes.bPaginate>,
							"sPaginationType": "bootstrap"</cfif><cfif attributes.tabletools_ind>,
							"oTableTools": {
								"aButtons": [ "copy", "xls", "pdf" ],
								"sSwfPath": "../external/DataTables/TableTools/media/swf/copy_csv_xls_pdf.swf"
							}</cfif>
						});
	                };
				});
				//apply relevant Bootstrap styling
				<cfif attributes.bFilter>
				$('.dataTables_filter input').addClass('span9 search-query').attr('placeholder','search this table');</cfif><cfif attributes.tabletools_ind>
				$('.DTTT_container').addClass('btn-group').find('a').addClass('btn btn-small');
				$('.dataTables_length select').addClass('span3');</cfif>
			});
		}
	}
]);
</script>
</cfoutput>