
	$(function(){

	

		$('a[data-remote]').on("ajax:success", function(event, data, status, xhr) {
				
				$("#" + String(data.response)).remove()
				
				$("[data-hook~='service:"+ String(data.response)+"']").remove()
		})
		


		$('.addProviderButton').on('click', function(event){
			
			var eventName = {
				name: event.target.id,
				service: $(event.target).attr('data-hook'),
				eventid: $('[data-hook~=eventIDholder').prop('id')
			}
			
			
			
				
				var request = $.post('/api/events/addservice',eventName)
				request.error(function(data){console.log(data)})
				request.done(function(data){
					$("#viewVendorModal").modal('hide')
					$('.confirmedServicesList').append("<li class='fancify'data-hook='service:"+data.confirmed_service+"'><p><h3><span class='highlight'>"+data.vendor_name+"</span> " +data.service_name +"</h3></p></li>");
					$("li[data-hook~='service:"+data.confirmed_service+"']").prepend("<a data-confirm='Are you sure?'' data-method='delete' class='btn btn-sm btn-danger pull-right btn-edit trig' id='"+data.vendor_name+"' data-remote='true' href='/api/event/"+data.event+"/deleteconfirmedservice/"+data.confirmed_service+"'>X</button")
					console.log("LOOK AT THISE" + data.vendor_name)
					assignColor();
					var message = {
						vendor_name: data.vendor_name,
						event_id: data.event,

					}
					console.log(data.event)
					$("[id~='provider:" + data.vendor_id +"']").addClass("disabled")
					$("[id~='provider:" + data.vendor_id +"']").addClass("btn-success")
					$("[id~='provider:" + data.vendor_id +"']").removeClass("btn-default")

					
					$('a[data-remote]').on("ajax:success", function(event, data, status, xhr) {
							if ($(event.target).hasClass("trig")) {

								$("button:contains("+event.target.id+")").removeClass("disabled");
								$("button:contains("+event.target.id+")").removeClass("btn-success");
								$("button:contains("+event.target.id+")").addClass("btn-default");
							}
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

