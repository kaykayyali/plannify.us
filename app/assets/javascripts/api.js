// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

	function handleConfirm(event) {
		$.post("/api/event/confirm/"+event.target.id)
	}