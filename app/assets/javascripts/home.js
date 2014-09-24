//Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready(function() {
	$("#calc").click(function() {

		var height = parseInt($("#height").val());
		var weight = parseInt($("#weight").val());
		var depth = parseInt($("#depth").val());
		var width = parseInt($("#width").val());
		var value = parseInt($("#value").val());

		var pack = { 'height': height, 'weight': weight, 'depth': depth, 'width': width, 'value': value};

		if(!isNaN(height))
			console.log(height);

		if(!isNaN(height) && !isNaN(weight) && !isNaN(width) && !isNaN(depth) && !isNaN(value)){
			console.log("asds");
			$.ajax({
				type: "GET",
				url: '../rate/calculate',
				data: pack,
				success: function (value) {
					$('#price').text(value.message+" Bsf");
				}
			});
		}else{
			console.log(pack);
		}
	});
});
