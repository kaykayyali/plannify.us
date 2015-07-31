
	$(function(){

	

		$('a[data-remote]').on("ajax:success", function(event, data, status, xhr) {
			
				$("#" + String(data.response)).remove()
				$("[data-hook~='service:"+ String(data.response)+"']").remove()
		})
		


		$('.addProviderButton').on('click', function(event){
			console.log(event)
			var eventName = {
				name: event.target.id,
				service: $(event.target).attr('data-hook'),
				eventid: $('[data-hook~=eventIDholder').prop('id')
			}
			var confirmation = confirm("Are you sure you want to schedule " + event.target.id)
			if (confirmation === true){
				console.log(eventName)
				var request = $.post('/api/events/addservice',eventName)

				request.done(function(data){
					console.log(data);
					$("#viewVendorModal").modal('hide')
					$('.confirmedServicesList').append("<li data-hook='service:"+data.confirmed_service+"'><p><span class='highlight'>"+data.vendor_name+"</span> " +data.service_name +"</p></li>");
				})
			}
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

