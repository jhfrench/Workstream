/*!
 *
 * script.js
 * Author: Jeromy French
 	JavaScript that executes with each page-load
 *
*/

// usage: log('inside coolFunc', this, arguments);
// paulirish.com/2009/log-a-lightweight-wrapper-for-consolelog/
window.log = function f(){ log.history = log.history || []; log.history.push(arguments); if(this.console) { var args = arguments, newarr; args.callee = args.callee.caller; newarr = [].slice.call(args); if (typeof console.log === 'object') log.apply.call(console.log, console, newarr); else console.log.apply(console, newarr);}};

// make it safe to use console.log always
(function(a){function b(){}for(var c='assert,count,debug,dir,dirxml,error,exception,group,groupCollapsed,groupEnd,info,log,markTimeline,profile,profileEnd,time,timeEnd,trace,warn'.split(','),d;!!(d=c.pop());){a[d]=a[d]||b;}})
(function(){try{console.log();return window.console;}catch(a){return (window.console={});}}());

if (!('console' in this)) console={}; 'log info warn error dir clear'.replace(/\w+/g,function(f) {   if (!(f in console)) console[f]=console.log||new Function; }); 


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

$(document).ready(function() {
	console.log('starting script.js document ready');
	
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
        //progressively-enhance help area to 1) make it hidden, 2) change it to span3, and 3) class it as `.docked`, 4) unwrap its parent `.row-fluid` and 5) append it to content container
        $help_area.attr('aria-hidden', 'true').hide().switchClass('span12', 'span3').addClass('docked').unwrap().insertAfter('#content_container');

		//console.log( $help_area );
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
				$help_area.delay(300).slideToggle(300, function() { jump_manager('help_area'); }).attr('aria-hidden', 'false');	
			}
			else {
				$help_area.slideToggle(300, function() { jump_manager(''); }).attr('aria-hidden', 'true');
				$('#content_container.span9').delay(300).switchClass('span9', 'span12', 300);
			}
		});
		
		// when called, getHelp loads relevant help area with content from jQuery's AJAX call
		var getHelp = function (helpType, helpID) {
			"use strict"; //let's avoid tom-foolery in this function
			
			if( typeof helpID!=='undefined' ){
//				console.log('$(\'#help_main_'+helpType+'\').load(\'index.cfm?fuseaction=Help.view_help_'+helpType+'&help_'+helpType+'_id='+helpID+' dl dd\');');
				$('#help_main_'+helpType).html('<img src="/img/ajax-ca-loader.gif" alt="Your data is loading" class="thumper" /><p class="text-center muted">Retrieving your data</p>').load(
					'index.cfm?fuseaction=Help.view_help_'+helpType+'&help_'+helpType+'_id='+helpID+' dl dd',
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
				}).attr('href', '#help_area').attr('aria-controls', 'help_main_article')
			.end()
				.find('a.edit').click(function(event) {
					"use strict"; //let's avoid tom-foolery in this function
					event.preventDefault(); //don't let a tag try to jump us to #help_area before we reveal it
					edit_help_article( $(this).attr('data-id') );
				}).attr('href', '#help_area');
		}

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
				}).attr('href', '#help_area').attr('aria-controls', 'help_main_faq')
			.end()
				.find('a.edit').click(function(event) {
					"use strict"; //let's avoid tom-foolery in this function
					event.preventDefault(); //don't let a tag try to jump us to #help_area before we reveal it
					edit_help_faq( $(this).attr('data-id') );
				}).attr('href', '#help_area');

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
				//console.log($('#faq_form #asker_email_address').val());
				if( $('#faq_form').find('#asker_email_address').attr('required') === 'required' ) {
					var emailAddressValue=$('#faq_form').find('#asker_email_address').val();
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
				//console.log($('#faq_form').find('#question').val());
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

	//if page includes resolution entry, inject a widget that will track how long the task has been open, adding a quarter hour every 15 minutes
	if( $('#task_details_resolution_entry_hours').length && !$('#task_open_link').length ) {
		var elapsed_time_running,
			elapsed_time=0.25;
		
		function update_elapsed_time() {
			//add quarter hour
			elapsed_time+=0.25;

			//update HTML fields
			$('#task_open_link').attr('title', 'Update hours field to '+elapsed_time+' hours');
			$('#task_open_clock').text(elapsed_time);

			if(elapsed_time==24) {
				clearInterval(elapsed_time_running);
			};
		};

		// inject clock span
		$('#task_details_resolution_entry_hours').append( '<!-- following clock image and related HTML are injected from plugins.js --><button type="button" id="task_open_link" title="Update hours field to 0.25 hours." class="btn btn-mini"><i class="icon-time"></i> <span id="task_open_clock">0.25</span> hours</button>' );
		$('#task_open_link').click(function(event) {
			"use strict"; //let's avoid tom-foolery in this function
			event.preventDefault(); //don't let a tag try to jump us within the page
			$('#hours').val( elapsed_time );
		});

		// add a quarter hour every 15 minutes
		elapsed_time_running=setInterval(function() {update_elapsed_time()}, 900000);
	};
	
	if( $('a[data-toggle="modal"]').length ) {
		$('#content_container').append('<div id="utility" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="utility-label" aria-hidden="true" style="display: none;" data-common-name="utility"><div class="modal-header"><button type="button" class="close btn" data-dismiss="modal" aria-hidden="false">x</button><h3 id="utility-label">Modal Heading</h3></div><div class="modal-body" id="utility_body">placeholder</div><div class="modal-footer"></div></div>' );
		$('a[data-toggle="modal"]').on('click', function(){
			// update modal header with contents of button that invoked the modal
			$('#utility-label').html( $(this).html() );
			var utility_target=$(this).attr('href')+' #content_container';
			//fixes a bootstrap bug that prevents a modal from being reused
			console.log('target: '+utility_target);
			$('#utility_body').load(
				utility_target,
				function(response, status, xhr) {
					if (status === 'error') {
						//console.log('got here');
						$('#utility_body').html('<h2>Oh boy</h2><p>Sorry, but there was an error:' + xhr.status + ' ' + xhr.statusText+ '</p>');
					}
					else {
						//converts any forms within #utility_body into using .load() to submit intended data and display the server response within the submitting modal
						$('#utility_body form').submit(function(e){
							e.preventDefault(); // stops browser from doing default submit process
							$('#utility_body').load(
								$(this).attr('action')+' #content_container',
								$(this).serialize(),
								function(response, status, xhr) {
									if (status === 'error') {
										//console.log('got here');
										$('#utility_body').html('<h2>Oh boy</h2><p>Sorry, but there was an error:' + xhr.status + ' ' + xhr.statusText+ '</p>');
									}
									return this;
								}
							);
						});
					};
					
					return this;
				}
			);
		});
	};

	if( $('.tree').length ) {
		// .tree widget
		var $tree=$('.tree');
		$tree.children('ul').attr('role', 'tree').find('ul').attr('role', 'group');
		$tree.find('li:has(ul)').addClass('parent_li').attr('role', 'treeitem').find(' > span').attr('title', 'Collapse this branch').on('click', function (e) {
			var $children = $(this).parent('li.parent_li').find(' > ul > li');
			if ($children.is(':visible')) {
				$children.hide('fast');
				$(this).attr('title', 'Expand this branch').find(' > i').addClass('icon-plus-sign').removeClass('icon-minus-sign');
			}
			else {
				$children.show('fast');
				$(this).attr('title', 'Collapse this branch').find(' > i').addClass('icon-minus-sign').removeClass('icon-plus-sign');
			}
			e.stopPropagation();
		});
	};
});

console.log('executed script.js');