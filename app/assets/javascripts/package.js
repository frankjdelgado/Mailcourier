// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready(function() {
	$("#math").click(function() {
		console.log('click');
		var height = $("#package_height").val();
		var weight = $("#package_weight").val();
		var depth = $("#package_depth").val();
		var width = $("#package_width").val();
		var value = $("#package_value").val();

		var pack = { 'height': height, 'weight': weight, 'depth': depth, 'width': width, 'value': value};
		console.log(pack);
		$.ajax({
			type: "GET",
			url: '../rate/calculate',
			data: pack,
			success: function (value) {
				console.log('success');
				console.log(value);
				console.log($('#shipping_cost'));
				$('#package_shipping_cost').val(value.message);
			}
		});
	});
});
