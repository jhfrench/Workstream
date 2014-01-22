
<!--Timekeeping/dsp_express_input.cfm
	Author: Jeromy F -->
<cfsilent>
	<!---FUSEDOC
	||
	Responsibilities: I retrieve the .
	||
	Name: Jeromy French
	||
	Edits:
	$Log$
	 ||
 --->
</cfsilent>
<cfoutput>
<form name="form_time_entry" action="index.cfm?fuseaction=#attributes.fuseaction#" method="POST" class="add_row">
	<h2><em>-Express=</em> Time Entry</h2>
	<span class="template">
		<div class="row-fluid">
			<div class="span2">
				<input type="date" name="date" min="#variables.min_date#" max="#variables.max_date#" value="" maxlength="10" class="span12 date" />
			</div>
			<div class="span1">
				<input type="number" name="hours" step="0.25" min="0" max="24" class="number span12" />
			</div>
			<div class="span4">
				#variables.select_work_item#
			</div>
			<div class="span5">
				<textarea rows="1" cols="25" name="notes_1" id="notes" wrap="soft" class="span12"></textarea>
			</div>
		</div>
	</span>
	<div class="row-fluid">
		<div class="span12">
			<input type="hidden" name="date_locked" value="#get_date_locked.date_locked#" />
			<input type="hidden" name="last_loaded" value="#now()#" />
			<input type="submit" name="Submit" value="Submit Time Entry" class="btn btn-primary" />
		</div>
	</div>
</form>
</cfoutput>


<script language="JavaScript" type="text/javascript">
var enableExpress=function(){
	//$('div.tree>ul').find('ul>li').hide();
	var $template=$('form.add_row').find('span.template');
	$template.find('div.span2:first').prepend('<button type="button" class="btn btn-small btn-danger remove-row"><i class="icon-minus"></i> Delete</button>').end().after('<div class="row-fluid"><div class="span1"><button type="button" name="add_row" id="add_row" class="btn btn-inverse btn-small"><i class="icon-plus icon-white"></i> Add entry</button></div></div>');
	var new_row=$template.html(),
		setNotesName=function(){
			var notesName='notes_'+$template.find('div.row-fluid').length;
			$('form.add_row').find('#notes').prop('id', notesName).attr('name', notesName);
		};
	setNotesName();
	$('#add_row').click(function(){
		$template.append( new_row ).find('button.remove-row').click(function(){
			$(this).closest('div.row-fluid').remove();
		});
		setNotesName();
	});
	$('.remove-row').click(function(){
		$(this).closest('div.row-fluid').remove();
	});
	return true;
};
</script>