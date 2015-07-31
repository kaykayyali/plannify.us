
	$(function(){

	

		$('a[data-remote]').on("ajax:success", function(event, data, status, xhr) {
				$("#" + String(data.response)).remove()
		})


		$('.addProviderButton').on('click', function(event){
			console.log(event)
			var eventName = {
				name: event.target.id,
				service: $(event.target).attr('data-hook'),
				eventid: $('[data-hook~=eventIDholder').prop('id')
			}
			console.log(eventName)
			var request = $.post('/api/events/addservice',eventName)

			request.done(function(data){
				console.log(data);
			})
		})
		
											
		$(".vendorShow").on("click", function(event){
			var request = $.get("/api/vendors/vendorinfo/" + event.target.id, handleVendorModal )
			$("#vendorServicesList").empty();
			var current_service = $(event.target).attr('data-hook')
			$('.addProviderButton').attr('data-hook', current_service)
			$("#vendorServicesList").append("<li><span class='highlight'>" + $(event.target).attr('data-hook') + "</span></li>") 


				function handleVendorModal(data){
					console.log(data)

					

					$("#vendorModalLabel").text(data.title);
					$(".addProviderButton").prop('id', data.title);
					$("#vendorOwnerLabel").text(data.owner);
					$("#vendorEmailLabel").text(data.email);
					





				$("#viewVendorModal").modal();

				}
		})

										



											
	});

