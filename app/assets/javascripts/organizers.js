$(document).ready(function() {
	$(function(){

	

		$('a[data-remote]').on("ajax:success", function(event, data, status, xhr) {
			console.log(data.response)
			$("#" + String(data.response)).remove()
		})
	});
});
