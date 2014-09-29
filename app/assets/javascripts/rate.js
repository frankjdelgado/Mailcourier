function calculate1(url,button,container,pheight,pweight,pdepth,pwidth,pvalue){
	$(document).on("click", button,function() {

		var height = parseInt($(pheight).val());
		var weight = parseInt($(pweight).val());
		var depth = parseInt($(pdepth).val());
		var width = parseInt($(pwidth).val());
		var value = parseInt($(pvalue).val());

		var pack = { 'height': height, 'weight': weight, 'depth': depth, 'width': width, 'value': value};

		if(!isNaN(height) && !isNaN(weight) && !isNaN(width) && !isNaN(depth) && !isNaN(value)){
			$.ajax({
				type: "GET",
				url: url,
				data: pack,
				success: function (value) {
					$(container).text(value.message);
					$(container).val(value.message);
				},
				error: function (response){
				}
			});
		}
	});
}
