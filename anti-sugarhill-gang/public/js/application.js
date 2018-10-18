$(document).ready(function () {


// UPVOTE

	$(".index_upvote").on("click", function(event) {
		event.preventDefault();

		var upvote_link = $(this);
		// console.log(upvote_link.attr('href'));
		$.ajax({
			url: upvote_link.attr("href"),
			type: "GET"
			// data: $(this).serialize()
		})
		  .done(function(response){
		  	// console.log(response);
		  	upvote_link.siblings('span').text(response);
		  })
	});


// DOWN VOTE

	$(".index_downvote").on("click", function(event) {
		event.preventDefault();

		var downvote_link = $(this);

		$.ajax({
			url: downvote_link.attr("href"),
			type: "GET"
			// data: $(this).serialize()
		})
			.done(function(response){
				downvote_link.siblings('span').text(response);
			})
	})

// Question_comments
	$("#question_comments").on("submit", "form", function(event) {
		event.preventDefault()
		form = $(this)
		$.ajax({
			url: form.attr("action"),
			type: form.attr("method"),
			data: form.serialize()
		})
		.done(function(response){
			$("#question_text ul").last().after(response)
		})
	});

//Answer_comments
	$("#answer_comments").on("submit", "form", function(event) {
		event.preventDefault()
		form = $(this)
		$.ajax({
			url: form.attr("action"),
			type: form.attr("method"),
			data: form.serialize()
		})
		.done(function(response){
			$("#answer_text ul").last().after(response)
		})
	})

	//Answer Add
	$("#answer_add").on("submit", "form", function(event){
		event.preventDefault()
		form = $(this)
		$.ajax({
			url: form.attr("action"),
			type: form.attr("method"),
			data: form.serialize()
		})
		.done(function(response){
			$("#answer_text form").last().append(response)
		})
	})
});
