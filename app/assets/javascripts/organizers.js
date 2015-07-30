
	$(function(){

	

		$('a[data-remote]').on("ajax:success", function(event, data, status, xhr) {
				$("#" + String(data.response)).remove()
		})





		
											
		$(".vendorShow").on("click", function(event){
			console.log(event.target.id)
			var request = $.get("/api/vendors/vendorinfo/" + event.target.id, handleVendorModal )


				function handleVendorModal(data){
					console.log(data)

					$("#vendorServicesList").empty();

					$("#vendorModalLabel").text(data.title);
					$("#vendorOwnerLabel").text(data.owner);
					$("#vendorEmailLabel").text(data.email);
					data.services.forEach(function(service) {
						$("#vendorServicesList").append("<li><span class='highlight'>" + service.name + "</span></li>") 
					});





				$("#viewVendorModal").modal();

				}
		})

										



											
	});

