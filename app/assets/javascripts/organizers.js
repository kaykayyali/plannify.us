
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
			
				
				var request = $.post('/api/events/addservice',eventName)

				request.done(function(data){
					$("#viewVendorModal").modal('hide')
					$('.confirmedServicesList').append("<li data-hook='service:"+data.confirmed_service+"'><p><span class='highlight'>"+data.vendor_name+"</span> " +data.service_name +"</p></li>");
					$("li[data-hook~='service:"+data.confirmed_service+"']").prepend("<a data-confirm='Are you sure?'' data-method='delete' class='btn btn-sm btn-danger pull-right' data-remote='true' href='/api/event/"+data.event+"/deleteconfirmedservice/"+data.confirmed_service+"'>X</button")
					console.log("LOOK AT THISE" + data.vendor_name)
					var message = {
						vendor_name: data.vendor_name,
						event_id: data.event,

					}
					$.post('/api/message/send_confirmation', message, function(data){console.log(data.response)})
					$('a[data-remote]').on("ajax:success", function(event, data, status, xhr) {
			
							$("#" + String(data.response)).remove()
							$("[data-hook~='service:"+ String(data.response)+"']").remove()
					})
				})
			
		})
		
											
		$(".vendorShow").on("click", function(event){
			var vendor_id = event.target.id
			vendor_id = vendor_id.replace('provider:','');
			var request = $.get("/api/vendors/vendorinfo/" + vendor_id, handleVendorModal )
			$("#vendorServicesList").empty();
			var current_service = $(event.target).attr('data-hook')
			$('.addProviderButton').attr('data-hook', current_service)
			$("#vendorServicesList").append("<li><span class='highlight'>" + $(event.target).attr('data-hook') + "</span></li>") 


				function handleVendorModal(data){
					console.log(data)

					

					$("#vendorModalLabel").text(data.title);
					$(".addProviderButton").prop('id', data.title);
					$("#vendorOwnerLabel").text(data.owner);
					$("#vendorEmailLabel").html("<a href='mailto:" + data.email + "'> " + data.email + "</a>");
					





				$("#viewVendorModal").modal();

				}
		})

										



											
	});

