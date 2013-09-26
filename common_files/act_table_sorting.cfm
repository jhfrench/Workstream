
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
var dataTableExecute=function() {
	//power table sorting
	$(document).ready(function () {
		$('table.tablesorter').each( function() {
               if ($(this).prop('rows').length > 2) {
				$(this).dataTable({
					"aaSorting": [ ],
					"bAutoWidth": false,
					"bFilter": #attributes.bFilter#,
					"bLengthChange": false,
					"bPaginate": #attributes.bPaginate#,
					"iDisplayLength": 50,
					"sDom": "<cfif attributes.tabletools_ind><'row-fluid'<'span6'f><'span6'<'pull-right'T>>r></cfif>t<cfif attributes.bPaginate><'row-fluid'<'span6'i><'span6'<'pull-right'p>>></cfif>"<cfif attributes.bPaginate>,
					"sPaginationType": "bootstrap"</cfif><cfif attributes.tabletools_ind>,
					"oTableTools": {
						"aButtons": [ "copy", "xls", "pdf" ],
						"sSwfPath": "//s3.amazonaws.com/external-projects/DataTables/TableTools/media/swf/copy_csv_xls_pdf.swf"
					}</cfif>
				});
               };
		});
		<cfif attributes.bFilter>
		var $dataTables_wrapper=$('div.dataTables_wrapper');
		//apply relevant Bootstrap styling
		$dataTables_wrapper.find('.dataTables_filter').find('.input').addClass('span9 search-query').attr('placeholder','search '+$(this).parents('div.dataTables_wrapper').find('caption').text());</cfif><cfif attributes.tabletools_ind>
		$dataTables_wrapper.find('.DTTT_container').addClass('btn-group').find('a').addClass('btn btn-small');
		$dataTables_wrapper.find('.dataTables_length').find('select').addClass('span3');</cfif>
	});
};
<cfif attributes.bPaginate OR attributes.tabletools_ind>
	//load in the dataTables add-ons, then apply dataTables to the DOM
	Modernizr.load([
		{
			load: [<cfif attributes.bPaginate>,
				'//s3.amazonaws.com/external-projects/DataTables/Plugins/pagination/bootstrap.js'</cfif><cfif attributes.tabletools_ind>,
				'//s3.amazonaws.com/external-projects/DataTables/TableTools/media/js/TableTools.js',
				'//s3.amazonaws.com/external-projects/DataTables/TableTools/media/js/ZeroClipboard.js'</cfif>
			],
			complete: function() {
				dataTableExecute();
			}
		}
	]);
<cfelse>
	//apply dataTables to the DOM right away
	dataTableExecute();
</cfif>
</script>
</cfoutput>