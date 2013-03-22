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
	
	//Remove an Ingredient from form
	$('form').on('click', '.remove_fields', function(){
		//only remove the element if there are more than 1
		if ($('#ingredient_list li').filter(":visible").length > 1) {
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
				.find('input') 							//find all its inputs
					.val('')  							//set all input values to blank
						.end()							//return the ingredient_list li
							.find('.ingredient_field')
								.prop({id: 'entry_ingredients_attributes_' + count + '_name', name: 'entry[ingredients_attributes][' + count + '][name]'  })
									.end()
										.find('.delete_ingredient')
											.prop({id: 'entry_ingredients_attributes_' + count + '__destroy', name: 'entry[ingredients_attributes][' + count + '][_destroy]', value: 'false'  })
												.end()
													.find('.ingredient_quantity')
														.prop({id: 'entry_ingredients_attributes_' + count + '_entry_ingredients_attributes_' + count + '_quantity', name: 'entry[ingredients_attributes][' + count + '][entry_ingredients_attributes][' + count + '][quantity]'})
															.end()
																.find('.ingredient_unit')
																	.prop({id: 'entry_ingredients_attributes_' + count + '_entry_ingredients_attributes_' + count + '_unit', name: 'entry[ingredients_attributes][' + count + '][entry_ingredients_attributes][' + count + '][unit]'})
																		.end();
		$('#ingredient_list').append(field);
	})
	
});

