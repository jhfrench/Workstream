/* Author: Jeromy French
	JavaScript that executes with each page-load
	NOTE: jQuery plugins should go in common_files\js\plugins.js
*/	
$(document).ready(
function() {
	$('[aria-hidden="true"]').hide(); //hide anything that's marked as hidden to screen-readers
	
	if ( $('#help_area').length ) {
		//console.log( $('#help_area') );
		
		// bind help area reveal/conceal to relevant elements
		$('#nav_help_button').on('click', function() {
			"use strict"; //let's avoid tom-foolery in this function
			//adjust spans of main block and help area, set aria-hidden attribute on help blockto help screen-readers
			if ( $('#help_area').attr('aria-hidden')==='true' ) {
				$('#content_container.span12').switchClass('span12', 'span9', 300);
				$('#help_area').delay(300).slideToggle(300).attr('aria-hidden', 'false');
			}
			else {
				$('#help_area').slideToggle(300).attr('aria-hidden', 'true');
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
				var errorMessage='';
				var fieldFocus='';
				var emailFilter = /^[\-a-z0-9~!$%\^&*_=+}{\'?]+(\.[\-a-z0-9~!$%\^&*_=+}{\'?]+)*@([a-z0-9_][\-a-z0-9_]*(\.[\-a-z0-9_]+)*\.(aero|arpa|biz|com|coop|edu|gov|info|int|mil|museum|name|net|org|pro|travel|mobi|[a-z][a-z])|([0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}))(:[0-9]{1,5})?$/i;
				
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
		var elapsed_time_running;
		var elapsed_time=0.25;
		
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
		$('#task_details_resolution_entry_hours').append( '<!-- following clock image and related HTML are injected from plugins.js --><a href="#" id="task_open_link" title="Update hours field to 0.25 hours."><i class="icon-time"></i> <span id="task_open_clock">0.25</span> hours</a>' );
		$('#task_open_link').on('click', function(){
			 $('#hours').val( elapsed_time );
		});

		// add a quarter hour every 15 minutes
		elapsed_time_running=setInterval(function() {update_elapsed_time()}, 900000);
	};
	
	/*the followin 29 lines of code are not ready for production
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
		$('#content_container').append('<div id="utility" class="modal hide fade in" tabindex="-1" role="dialog" aria-labelledby="utility-label" aria-hidden="true" style="display: none;" data-common-name="utility"><div class="modal-header"><button type="button" class="close btn" data-dismiss="modal" aria-hidden="false">x</button><h3 id="utility-label">Modal Heading</h3></div><div class="modal-body" id="utility_body">placeholder</div><div class="modal-footer"></div></div>' );
		// point link at _utility version of fuseaction so header/footer are not generated into modal
		$('a[data-toggle="modal"]').each(function() {
			$(this).attr('href',$(this).attr('href')+'_utility');
		});
		$('a[data-toggle="modal"]').on('click', function(){
			$('#utility-label').html( $(this).html() );
		});
	};
}
);
