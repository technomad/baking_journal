// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

//document ready
$(function(){
	
	//Select All or None	
	$('#checkHead').on('click', function (){
		if(this.checked == true) {
			$('.checkTbl').prop('checked', true);
		} else {
			$('.checkTbl').prop('checked', false);
		}
	});

	//Count Checked
	function countChecked(){
		var length = $('.checkTbl:checked').length;
		return length;
	};
	
	//Delete Confirmation
	$('.delete').on('click', function(){
		checked = countChecked();
		if (checked > 1) {
			return confirm('Are you sure you want to delete these ' + checked + ' entries?');
		} else if (checked === 1) {
			return confirm('Are you sure you want to delete this entry?');
		} else {
			return false;
		};
	});
	
	//Remove a list item form field
	$('form').on('click', '.remove_fields', function(){
		//only remove the element if there are more than 1
		if ($(this).closest('div').find('li').filter(":visible").length > 1) {
			//set hidden value to destroy
			$(this).prev('input[type=hidden]').val('1');
			//hide the field so it looks like it was destroyed (submit will destroy it)
			$(this).closest('li').hide();
			event.preventDefault();
		} else {
			return false;
		}
	});
	
	//Add Ingredient to form
	$('form').on('click', '#add_ingredient', function(){
		count = $('#ingredient_list li').length;
		field = $('#ingredient_list li').first()
			.clone() 									//clone the first element in the list
				.show()									//make sure its not hidden
					.find('input') 						//find all its inputs
						.val('')  						//set all input values to blank
							.end()						//return the ingredient_list li
								.find('.ingredient_field')
									.prop({id: 'entry_entry_ingredients_attributes_' + count + '_ingredient_attribute_name', name: 'entry[entry_ingredients_attributes][' + count + '][ingredient_attributes][name]'  })
										.end()
											.find('.delete_ingredient')
												.prop({id: 'entry_entry_ingredients_attributes_' + count + '__destroy', name: 'entry[entry_ingredients_attributes][' + count + '][_destroy]', value: 'false'  })
													.end()
														.find('.ingredient_quantity')
															.prop({id: 'entry_entry_ingredients_attributes_' + count + '_quantity', name: 'entry[entry_ingredients_attributes][' + count + '][quantity]'})
																.end()
																	.find('.ingredient_unit')
																		.prop({id: 'entry_entry_ingredients_attributes_' + count + '_unit', name: 'entry[entry_ingredients_attributes][' + count + '][unit]'})
																			.end();
		$('#ingredient_list').append(field);
	})
	
	//Add Step to form
	$('form').on('click', '#add_step', function(){
		count = $('#step_list li').length;
		field = $('#step_list li').first()
			.clone() 									//clone the first element in the list
				.show()									//make sure its not hidden
					.find('textarea') 					//find its textarea
						.val('')  						//set all input values to blank
							.end()						//return the ingredient_list li
								.find('.step_field')
									.prop({id: 'entry_steps_attributes_' + count + '_description', name: 'entry[steps_attributes][' + count + '][description]'  })
										.end()
											.find('.delete_step')
												.prop({id: 'entry_steps_attributes_' + count + '__destroy', name: 'entry[steps_attributes][' + count + '][_destroy]', value: 'false'  })
													.end()
		$('#step_list').append(field);
	})
		
});

