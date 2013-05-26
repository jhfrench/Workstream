/* Author: Jeromy French
	JavaScript that executes with each page-load
	NOTE: jQuery plugins should go in common_files\js\plugins.js
*/	
$(document).ready(function() {
	$('[aria-hidden="true"]').hide(); //hide anything that's marked as hidden to screen-readers

	if ( $('#navbar-search-full').length ) {
		//when it receives focus, grow the search input from span5 to span9
		$('#header_search_criteria').focus( function() {
				"use strict"; //let's avoid tom-foolery in this function
				$(this).switchClass('span4', 'span9', 200);
			}).blur( function() {
				"use strict"; //let's avoid tom-foolery in this function
				$(this).switchClass('span9', 'span4', 200);
			});
		
		// change full search link to first change form target, then submit that form; change link's href to be an internal link; update link's title
		$('#navbar-search-full').click( function(event) {
			"use strict"; //let's avoid tom-foolery in this function
			event.preventDefault(); //don't let the link open a new page
			$('#form-navbar-search').attr('action',  $(this).attr('href')).submit(); //instead, change the search form action, then submit it
		}).attr('title', $('#navbar-search-full').attr('title')+' with entered criteria');
	}

	if ( $('#help_area').length ) {
		//console.log( $('#help_area') );
		
		// bind help area reveal/conceal to relevant elements
		$('#nav_help_button').click(function(event) {
			"use strict"; //let's avoid tom-foolery in this function
			event.preventDefault(); //don't let a tag try to jump us to #help_area before we reveal it
			//adjust spans of main block and help area, set aria-hidden attribute on help block to help screen-readers
			if ( $('#help_area').attr('aria-hidden')==='true' ) {
				$('#content_container.span12').switchClass('span12', 'span9', 300);
				$('#help_area').delay(300).slideToggle(300, function() { window.location.hash = "help_area"; }).attr('aria-hidden', 'false');	
			}
			else {
				$('#help_area').slideToggle(300, function() { window.location.hash = ""; }).attr('aria-hidden', 'true');
				$('#content_container.span9').delay(300).switchClass('span9', 'span12', 300);
			}
		});
		
		// when called, getHelp loads relevant help area with content from jQuery's AJAX call
		var getHelp = function (helpType, helpID) {
			"use strict"; //let's avoid tom-foolery in this function
			//console.log('$(\'div #help_main_'+helpType+'\').load(\'index.cfm?fuseaction=Help.view_help_'+helpType+'&help_'+helpType+'_id='+helpID+' dl dd\');');
			//console.log('index.cfm?fuseaction=Help.view_help_'+helpType+'&help_'+helpType+'_id='+helpID+' dl dd');
			//console.log( $('div #help_main_'+helpType) );
			$('div #help_main_'+helpType).load(
				'index.cfm?fuseaction=Help.view_help_'+helpType+'&help_'+helpType+'_id='+helpID+' dl dd',
				function(response, status, xhr) {
					if (status === 'error') {
						//console.log('got here');
						$('div #help_main_'+helpType).html('<h2>Oh boy</h2><p>Sorry, but there was an error:' + xhr.status + ' ' + xhr.statusText+ '</p>');
					}
					return this;
				}
			);
		};
		
		if ( $('#help_content_article').length ) {
			//console.log('help articles active2');
			
			//load article div with default content
			//getHelp('article', default_help);
			
			//assign onclick event to help article anchor tags to make use of AJAX calls instead of native HTML link functionality
			$('#help_top_article a.article').on('click', function(){
				"use strict"; //let's avoid tom-foolery in this function
				getHelp( 'article', $(this).attr('data-id') );
			}).attr('href', '#help_area').attr('aria-controls', 'help_main_article');
			$('#help_top_article a.edit').on('click', function(){
				"use strict"; //let's avoid tom-foolery in this function
				edit_help_article( $(this).attr('data-id') );
			}).attr('href', '#help_area');
		}

		if ( $('#help_content_faq').length ) {
			// console.log('help faq active');
			
			//load faq div with default content
			getHelp('faq', default_faq);
			
			//assign onclick event to help FAQ anchor tags to make use of AJAX calls instead of native HTML link functionality
			$('#help_top_faq a.question').on('click', function(){
				"use strict"; //let's avoid tom-foolery in this function
				getHelp( 'faq', $(this).attr('data-id') );
			}).attr('href', '#help_area').attr('aria-controls', 'help_main_faq');
			$('#help_top_faq a.edit').on('click', function(){
				"use strict"; //let's avoid tom-foolery in this function
				edit_help_faq( $(this).attr('data-id') );
			}).attr('href', '#help_area');

			//grab form actions from baseline HTML then replace with javascript that will call Ajax functions
			var faq_form_action=$('#faq_form').attr('action');
			$('#faq_form').attr('action', 'javascript:submit_faq();');
			
			// if user requests an email response to their FAQ, require that they specify an email address
			$('#email_requested_ind').on('change', function(){
				"use strict"; //let's avoid tom-foolery in this function
				if($(this).is(':checked')){
					$('#asker_email_address').attr('required','required');
				}
				else {
					$('#asker_email_address').removeAttr('required','required');
				}
			});
			
			// handles the submission of a user's question
			var submit_faq = function() {
				"use strict"; //let's avoid tom-foolery in this function
				var errorMessage='',
					fieldFocus='',
					emailFilter = /^[\-a-z0-9~!$%\^&*_=+}{\'?]+(\.[\-a-z0-9~!$%\^&*_=+}{\'?]+)*@([a-z0-9_][\-a-z0-9_]*(\.[\-a-z0-9_]+)*\.(aero|arpa|biz|com|coop|edu|gov|info|int|mil|museum|name|net|org|pro|travel|mobi|[a-z][a-z])|([0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}))(:[0-9]{1,5})?$/i;
				
				//if user requests an email response to their FAQ, require that they specify a (valid) email address
				//console.log($('#faq_form #asker_email_address').val());
				if( $('#faq_form #asker_email_address').attr('required') === 'required' ) {
					var emailAddressValue=$('#faq_form #asker_email_address').val();
					if( !emailAddressValue.length ) {
						errorMessage+='Please enter your email address so we can send the response to you as (you requested).';
						fieldFocus='#asker_email_address';
					}
					else if( !emailFilter.test(emailAddressValue) ) {
						errorMessage+='This email address doesn\'t look right.';
						fieldFocus='#asker_email_address';
					}
				}
				
				//require a question
				//console.log($('#faq_form #question').val());
				if($('#faq_form #question').val() === '') {
					errorMessage='Please enter your question.\n'+errorMessage;
					fieldFocus='#question';
				}
				
				if( errorMessage !== '') {
					alert(errorMessage);
					$(fieldFocus).focus();
				}
				else {
					$('div #help_main_faq').load(
						faq_form_action+' #faq_result',
						$('#faq_form').serialize(),
						function(response, status, xhr) {
							if (status === 'error') {
								$('div #help_main_faq').html('<h2>Oh boy</h2><p>Sorry, but there was an error:' + xhr.status + ' ' + xhr.statusText+ '</p>');
							}
							else {
								$('#question').val('');
								$('#faq_form_legend').text('Want to ask something else?');
								$('#question_label').text('Ask another question');
							}
							return this;
						}
					);
				}
			};
		}

		if ( $('#help_content_search').length ) {
			//grab form actions from baseline HTML then replace with javascript that will call Ajax functions
			var help_search_form_action=$('#help_search_form').attr('action');
			$('#help_search_form').attr('action', 'javascript:submit_search();');
			
			var submit_search = function() {
				"use strict"; //let's avoid tom-foolery in this function
				$('div #help_main_search').load(
					help_search_form_action+' #search_result',
					$('#help_search_form').serialize(),
					function(response, status, xhr) {
						if (status === 'error') {
							$('div #help_main_faq').html('<h2>Oh boy</h2><p>Sorry, but there was an error:' + xhr.status + ' ' + xhr.statusText+ '</p>');
						}
						return this;
					}
				);
				$('div #help_main_search').focus();
			};
		}
	}

	//if page includes resolution entry, inject a widget that will track how long the task has been open, adding a quarter hour every 15 minutes
	if( $('#task_details_resolution_entry_hours').length ) {
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
		$('#task_open_link').on('click', function(){
			 $('#hours').val( elapsed_time );
		});

		// add a quarter hour every 15 minutes
		elapsed_time_running=setInterval(function() {update_elapsed_time()}, 900000);
	};
	
	/*the following 29 lines of code are not ready for production
	if (!(Modernizr.input.required)) {
	}
	else {
		//everything in here actually goes above, and this else block gets deleted.
		//bind client-side validation to required input elements
		$('form input:required').parents('form').submit( function() {
			// console.log('Handler for submit called');
			$('form input:required').each( function () {
				if (!$(this).val().length) {
					alert('Please enter a value for '+$(this).prev('label').html());
					return false;
				}
				switch($(this).attr('type'))
				{
					//deal with dates
					case 'date':
						console.log('date');
						break;
					//deal with numbers
					case 'number':
						console.log('number');
						break;
					//deal with text
					case 'text':
						console.log('text');
						break;
				}
			})
		})
	};
	*/
	
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
						$('#utility_body form').submit(function(){
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
							return false; // stops browser from doing default submit process
						});
					};
					
					return this;
				}
			);
		});
	};
});