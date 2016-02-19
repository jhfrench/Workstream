/* dataTables.bootstrap.js */

/*! DataTables Bootstrap 2 integration
 * ©2011-2014 SpryMedia Ltd - datatables.net/license
 */

/**
 * DataTables integration for Bootstrap 2. This requires Bootstrap 2 and
 * DataTables 1.10 or newer.
 *
 * This file sets the defaults and adds options to DataTables to style its
 * controls using Bootstrap. See http://datatables.net/manual/styling/bootstrap
 * for further information.
 */
(function(window, document, $, DataTable, undefined){

var vFormatCopyButtons="<'pull-right'T>";
    
$.extend( true, DataTable.defaults, {
	"dom":
		"<'row-fluid'f<'span6'"+vFormatCopyButtons+">r>" +
		"<'row-fluid'<'span12't>>" +
		"<'row-fluid'lip>",
	renderer: 'bootstrap',
	"oLanguage": {
		"sLengthMenu": "_MENU_ records per page",
		"sSearch": "_INPUT_",
		"sSearchPlaceholder": "Filter this table"
	}
} );


/* Default class modification */
$.extend( DataTable.ext.classes, {
	sWrapper: "dataTables_wrapper dt-bootstrap",
	sInfo: "span2 text-center dataTables_info",
	sFilter: "span6 dataTables_filter",
	sFilterInput: "span10 search-query",
	sPaging: "span5 text-right dataTables_paginate paging_", /* Note that the type is postfixed */
	sLength: "span5 dataTables_length",
	sLengthSelect: "span3"
} );


/* Bootstrap paging button renderer */
DataTable.ext.renderer.pageButton.bootstrap = function ( settings, host, idx, buttons, page, pages ) {
	var api     = new DataTable.Api( settings );
	var classes = settings.oClasses;
	var lang    = settings.oLanguage.oPaginate;
	var btnDisplay, btnClass;

	var attach = function( container, buttons ) {
		var i, ien, node, button;
		var clickHandler = function ( e ) {
			e.preventDefault();
			if ( !$(e.currentTarget).hasClass('disabled') ) {
				api.page( e.data.action ).draw( false );
			}
		};

		for ( i=0, ien=buttons.length ; i<ien ; i++ ) {
			button = buttons[i];

			if ( $.isArray( button ) ) {
				attach( container, button );
			}
			else {
				btnDisplay = '';
				btnClass = '';

				switch ( button ) {
					case 'ellipsis':
						btnDisplay = '&hellip;';
						btnClass = 'disabled';
						break;

					case 'first':
						btnDisplay = lang.sFirst;
						btnClass = button + (page > 0 ?
							'' : ' disabled');
						break;

					case 'previous':
						btnDisplay = lang.sPrevious;
						btnClass = button + (page > 0 ?
							'' : ' disabled');
						break;

					case 'next':
						btnDisplay = lang.sNext;
						btnClass = button + (page < pages-1 ?
							'' : ' disabled');
						break;

					case 'last':
						btnDisplay = lang.sLast;
						btnClass = button + (page < pages-1 ?
							'' : ' disabled');
						break;

					default:
						btnDisplay = button + 1;
						btnClass = page === button ?
							'active' : '';
						break;
				}

				if ( btnDisplay ) {
					node = $('<li>', {
							'class': classes.sPageButton+' '+btnClass,
							'aria-controls': settings.sTableId,
							'tabindex': settings.iTabIndex,
							'id': idx === 0 && typeof button === 'string' ?
								settings.sTableId +'_'+ button :
								null
						} )
						.append( $('<a>', {
								'href': '#'
							} )
							.html( btnDisplay )
						)
						.appendTo( container );

					settings.oApi._fnBindAction(
						node, {action: button}, clickHandler
					);
				}
			}
		}
	};

	attach(
		$(host).empty().html('<div class="pagination"><ul/></div>').find('ul'),
		buttons
	);
};




})(window, document, jQuery, jQuery.fn.dataTable);