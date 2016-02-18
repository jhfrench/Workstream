/*!
 *
 * main.js
 *
*/
var textCounter=function(field, countfield, maxlimit ) {
		"use strict"; //let's avoid tom-foolery in this function
		if ( field.value.length > maxlimit ) {
			field.value = $.trim(field.value).substring( 0, maxlimit );
			$("#"+countfield).addClass('text-error').removeClass('text-warning').html('0');
			alert( $('[for="'+field.id+'"]').text()+' can only be '+maxlimit+' characters in length.' );
			return false;
		}
		else if ( field.value.length > maxlimit*.9 ) {
			$("#"+countfield).addClass('text-warning').removeClass('text-error').html(maxlimit - field.value.length);
			return true;
		}
		else {
			$("#"+countfield).removeClass('text-warning, text-error').html(maxlimit - field.value.length);
			return true;
		}
	},
	apply_textCounter=function() {
		"use strict"; //let's avoid tom-foolery in this function
		//inject counter field then attach an event-listener that updates the counter field with changes to the driving field (ie: the textarea)
		$('.textCounter[maxlength]').not('.processed_textCounter').each(
			function() {
				"use strict"; //let's avoid tom-foolery in this function
				var $this=$(this),
					maxlimit=$this.attr('maxlength'),
					display_id=$this.prop('id')+'_counter';
				$this.parent().append('<span class="help-block">Characters Remaining: <span id="'+display_id+'" class="counter_display">'+maxlimit+'</span></span>');
				$this.on('input propertychange', function() {
					"use strict"; //let's avoid tom-foolery in this function
					textCounter(this, display_id, maxlimit);
				});
			}
		).addClass('processed_textCounter');
	},

	trimInput=function() {
		//let's kill the leading and trailing spaces from any form inputs that are classed as `.trimInput`
		"use strict"; //let's avoid tom-foolery in this function
		$(':input.trimInput').val(function( index, value) {return $.trim(value)});
		return true;
	},
	
	months=['JAN', 'FEB', 'MAR', 'APR', 'MAY', 'JUN', 'JUL', 'AUG', 'SEP', 'OCT', 'NOV', 'DEC'],
	months_full=['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'],
	now=function(){
		"use strict"; //let's avoid tom-foolery in this function
		currentdate=new Date();
		return ("0" + currentdate.getDate()).slice(-2) + '-' + months[currentdate.getMonth()] + '-' + currentdate.getFullYear() + ' ' + ("0" + currentdate.getHours()).slice(-2) + ":" + ("0" + currentdate.getMinutes()).slice(-2);
	},
	apply_month_abbr=function(){
		"use strict"; //let's avoid tom-foolery in this function
		$('.date').each(function(){
			var date_string=$(this).html();
			//if the date is in the expected format
			if(date_string.length===11 && date_string.indexOf('-')===2 && date_string.lastIndexOf('-')===6) {
				//wrap the month abbreviation with the `abbr` tag
				$(this).html( date_string.substring(0,3)+'<abbr title="'+months_full[jQuery.inArray(date_string.substring(3,6), months)]+'">'+date_string.substring(3,6)+'</abbr>'+date_string.substring(6,11) );
			};
		});
		console.log('applied month abbreviations');
	},
	
	apply_disabled_action=function() {
		$('a, button').filter('.disabled').each(function(){
			"use strict"; //let's avoid tom-foolery in this function
			var title_text=$(this).attr('title');
			$(this).click(function(event) {
				if( title_text.length ){
					alert(title_text);
				};
				event.preventDefault(); //since the link is disabled, don't let it perform its normal duties
			});	
		});
	},
	
	apply_drillown=function() {
		$('a.drilldown').click(function(event) {
			event.preventDefault(); //don't use the regular link behavior
			// make the browser run the javascript snippet embedded within data-drilldown
			eval( $(this).attr('data-drilldown') );
		});
	},
	
	apply_hidden=function(){
		//hide anything that's marked as hidden to screen-readers
		$('[aria-hidden="true"]').hide().removeClass('hidden');
	},
	
	apply_dataTables=function(){
		//the dataTables plugin is defined within jquery.dataTables.CCD.js
		"use strict"; //let's avoid tom-foolery in this function
		console.log('applying datatables');
		$('table.dataTables').not('.dataTable').filter(function(){ return $(this).prop('rows').length > 3 })
			.dataTable(
				{
					"initComplete": function(settings, json) {
						//for IE Old, need to apply the placeholder shim (do it now, if it's already available; otherwise the shim will get applied by Modernizr)
						if( typeof jQuery.fn.placeholder!=='undefined' ){
							apply_placeholder();
						};
					}
				}
			)
			.filter('.detach_caption').parents('.dataTables_wrapper').each( function(){
				var caption=$(this).find('table').find('caption').detach().html();
				$(this).prepend( $(caption).addClass('text-center') );
			});
	},
	
	faq_form_action,
	submit_faq,
	
	help_search_form_action,
	submit_search,

	$data_target=[],
	modal_title='',
	modal_click_counter=0;

$(document).ready(function(){
	console.log('starting main.js document ready');
	
	if ( $('html.lt-ie9').length ) {
		jQuery.fx.off=true; //IEOld just can't hang with jQuery easings, so turn them off
	};
	
	apply_hidden(); 
	apply_disabled_action();

	if ( $('#navbar-search-full').length ) {
		//when it receives focus, grow the search input from span5 to span9
		$('#header_search_criteria').focus( function() {
			"use strict"; //let's avoid tom-foolery in this function
			$(this).switchClass('span4', 'span9', 200);
		}).blur( function() {
			"use strict"; //let's avoid tom-foolery in this function
			$(this).delay(200).switchClass('span9', 'span4', 200);
		});
		
		// change full search link to first change form target, then submit that form; change link's href to be an internal link; update link's title
		$('#navbar-search-full').click( function(event) {
			"use strict"; //let's avoid tom-foolery in this function
			event.preventDefault(); //don't let the link open a new page
			$('#form-navbar-search').attr('action',  $(this).attr('href')).submit(); //instead, change the search form action, then submit it
		}).attr('title', $('#navbar-search-full').attr('title')+' with entered criteria');
	}

	$help_area=$('#help_area');
	if ( $help_area.length ) {
		//console.log( $help_area );
		
		//progressively-enhance help area to 1) make it hidden, 2) change it to span3, and 3) class it as `.docked`, 4) unwrap its parent `.row-fluid` and 5) append it to #content_container
		$help_area.attr('aria-hidden', 'true').hide().switchClass('span12', 'span3').addClass('docked').unwrap().insertAfter('#content_container');
		
		var jump_manager=function(target) {
			"use strict"; //let's avoid tom-foolery in this function
			// only jump to the revealed help area if its position is static (as opposed to "fixed")
			if ( $help_area.css('position')==='static' ) {
				window.location.hash = target;
			}
		};
		
		// bind help area reveal/conceal to relevant elements
		$('#nav_help_button').click(function(event) {
			"use strict"; //let's avoid tom-foolery in this function
			event.preventDefault(); //don't let a tag try to jump us to #help_area before we reveal it
			//adjust spans of main block and help area, set aria-hidden attribute on help block to help screen-readers
			if ( $help_area.attr('aria-hidden')==='true' ) {
				$('#content_container.span12').switchClass('span12', 'span9', 300);
				$help_area.delay(250).slideToggle(300, function() { jump_manager('help_area'); }).attr('aria-hidden', 'false');	
			}
			else {
				$help_area.slideToggle(300, function() { jump_manager(''); }).attr('aria-hidden', 'true');
				$('#content_container.span9').delay(250).switchClass('span9', 'span12', 300);
			}
		});
		
		// when called, getHelp loads relevant help area with content from jQuery's AJAX call
		var getHelp = function(helpType, helpID) {
			"use strict"; //let's avoid tom-foolery in this function
			
			if( typeof helpID!=='undefined' ){
//				console.log('$(\'#help_main_'+helpType+'\').load(\'index.cfm?fuseaction=Help.view_help_'+helpType+'&help_'+helpType+'_id='+helpID+' dl dd\');');
				$('#help_main_'+helpType).html('<img src="/img/ajax-ca-loader.gif" alt="Your data is loading" class="thumper" /><p class="text-center muted">Retrieving your data</p>').load(
					'../TASK_CENTRIC_HELP/pag_view_help_'+helpType+'.php?help_'+helpType+'_uid='+helpID+' #content_container>dl>dd',
					function(response, status, xhr) {
						if (status === 'error') {
							//console.log('got here');
							$('#help_main_'+helpType).html('<h2>Oh boy</h2><p>Sorry, but there was an error:' + xhr.status + ' ' + xhr.statusText+ '</p>');
						}
						return this;
					}
				);
			}
			else {
				console.log('No id defined for '+helpType);
			};
			
		};
		
		if ( $('#help_content_article').length ) {
			//console.log('help articles active2');
			
			//load article div with default content
			setTimeout( function() { getHelp('article', $('#help_top_article').find('a.article:first').attr('data-id') ); }, 200 );
			
			//assign onclick event to help article anchor tags to make use of AJAX calls instead of native HTML link functionality
			$('#help_top_article')
				.find('a.article').click(function(event) {
					"use strict"; //let's avoid tom-foolery in this function
					event.preventDefault(); //don't let a tag try to jump us to #help_area before we reveal it
					getHelp( 'article', $(this).attr('data-id') );
				}).attr('aria-controls', 'help_main_article')
			.end()
				.find('a.edit').click(function(event) {
					"use strict"; //let's avoid tom-foolery in this function
					event.preventDefault(); //don't let a tag try to jump us to #help_area before we reveal it
					edit_help_article( $(this).attr('data-id') );
				});
		};

		if ( $('#help_content_faq').length ) {
			// console.log('help faq active');
			
			//load faq div with default content
			setTimeout( function() { getHelp('faq', $('#help_top_faq').find('a.question:first').attr('data-id') ); }, 200 );
			
			//assign onclick event to help FAQ anchor tags to make use of AJAX calls instead of native HTML link functionality
			$('#help_top_faq')
				.find('a.question').click(function(event) {
					"use strict"; //let's avoid tom-foolery in this function
					event.preventDefault(); //don't let a tag try to jump us to #help_area before we reveal it
					getHelp( 'faq', $(this).attr('data-id') );
				}).attr('aria-controls', 'help_main_faq')
			.end()
				.find('a.edit').click(function(event) {
					"use strict"; //let's avoid tom-foolery in this function
					event.preventDefault(); //don't let a tag try to jump us to #help_area before we reveal it
					edit_help_faq( $(this).attr('data-id') );
				});

			//grab form actions from baseline HTML then replace with javascript that will call Ajax functions
			faq_form_action=$('#faq_form').attr('action');
			$('#faq_form').attr('action', 'javascript:submit_faq();');
			
			// if user requests an email response to their FAQ, require that they specify an email address
			$('#email_requested_ind').on('change', function(){
				"use strict"; //let's avoid tom-foolery in this function
				if($(this).is(':checked')){
					$('#asker_email_address').attr('required','required');
				}
				else {
					$('#asker_email_address').removeAttr('required');
				}
			});
			
			// handles the submission of a user's question
			submit_faq = function() {
				"use strict"; //let's avoid tom-foolery in this function
				var errorMessage='',
					fieldFocus='',
					emailFilter = /^[\-a-z0-9~!$%\^&*_=+}{\'?]+(\.[\-a-z0-9~!$%\^&*_=+}{\'?]+)*@([a-z0-9_][\-a-z0-9_]*(\.[\-a-z0-9_]+)*\.(aero|arpa|biz|com|coop|edu|gov|info|int|mil|museum|name|net|org|pro|travel|mobi|[a-z][a-z])|([0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}))(:[0-9]{1,5})?$/i;
					
				$('#faq_form').find(':input[data-loading-text]').button('validating').prop('disabled',true);
				
				//if user requests an email response to their FAQ, require that they specify a (valid) email address
//				console.log($('#faq_form').find('#asker_email_address').val());
				if( $('#faq_form').find('#asker_email_address').attr('required') === 'required' ) {
					var emailAddressValue=$('#faq_form #asker_email_address').val();
					if( !emailAddressValue.length ) {
						errorMessage+='Please enter your email address so we can send the response to you (as you requested).';
						fieldFocus='#asker_email_address';
					}
					else if( !emailFilter.test(emailAddressValue) ) {
						errorMessage+='This email address doesn\'t look right.';
						fieldFocus='#asker_email_address';
					}
				}
				
				//require a question
// console.log($('#faq_form #question').val());
				if($('#faq_form').find('#question').val() === '') {
					errorMessage='Please enter your question.\n'+errorMessage;
					fieldFocus='#question';
				}
				
				if( errorMessage.length!==0) {
					//something didn't validate; let the user know, attempt to give focus to the offending element, and don't submit the form
					$('#faq_form').find(':input[data-loading-text]').button('reset').prop('disabled', false);
					alert(errorMessage);
					$(fieldFocus).focus();
				}
				else {
					//we're good, let the submit happen!
					$('#faq_form').find(':input[data-loading-text]').button('loading');
					$('#help_main_faq').load(
						faq_form_action+' #faq_result',
						$('#faq_form').serialize(),
						function(response, status, xhr) {
							$('#faq_form').find(':input[data-loading-text]').button('reset').prop('disabled', false);
							if (status === 'error') {
//								console.log('submit failed');
								$('#help_main_faq').html('<h2>Oh boy</h2><p>Sorry, but there was an error:' + xhr.status + ' ' + xhr.statusText+ '</p>');
							}
							else {
//								console.log('submitted FAQ');
								$('#faq_question').val('');
								$('#email_requested_ind').prop('checked', false).change();
								$('#faq_form_legend').text('Want to ask something else?');
								$('#question_label').text('Ask another question');
							};
							return this;
						}
					).focus();
					setTimeout(function(){ $('#faq_form').find(':input[data-loading-text]').button('reset').prop('disabled', false); console.log('set buttons to reset'); }, 15000); //after 15 seconds, re-enable the submit button; in case the user cancels the form submission and wants to tinker with their criteria, we don't want to leave the form in a useless state
				}
			};
			console.log('redefined submit_faq()');
		}

		if ( $('#help_content_search').length ) {
			//grab form actions from baseline HTML then replace with javascript that will call Ajax functions
			help_search_form_action=$('#help_search_form').attr('action');
			$('#help_search_form').attr('action', 'javascript:submit_search();');
			
			submit_search = function() {
				"use strict"; //let's avoid tom-foolery in this function
				$('#help_main_search').load(
					help_search_form_action+' #search_result',
					$('#help_search_form').serialize(),
					function(response, status, xhr) {
						if (status === 'error') {
							$('#help_main_faq').html('<h2>Oh boy</h2><p>Sorry, but there was an error:' + xhr.status + ' ' + xhr.statusText+ '</p>');
						}
						return this;
					}
				).focus();
			};
		}
	};
	
	apply_textCounter();
	apply_drillown();
	apply_dataTables();
	
	setTimeout(function(){ apply_month_abbr(); }, 500);
	
	/*
	//make each of the links a targetable area
	var acronym_anchor='<a class="acronym_anchor"><i class="icon-question-sign"></i></a>'
	$('.acronym').each( function(){ $(this).attr('id', 'help_acronym_'+$(this).text()); } );
	$('#content_container abbr').each( function() {
		var target_id='#help_acronym_'+$(this).text();
		if ( $(target_id).length ) {
			$(this).after(acronym_anchor).next().attr('href', target_id);
			$(this).click( function() {
				if ( $('#help_area').attr('aria-hidden')==='true' ) {
					$('#content_container.span12').switchClass('span12', 'span9', 300);
					$('#help_area').delay(300).slideToggle(300).attr('aria-hidden', 'false');
				}
			} );
		}
	} );
	*/
		
});
console.log('executed main.js');