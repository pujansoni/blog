// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require_tree .
$(document).on('turbolinks:load', function(){
	var arr = [];
	$("#category_id").click(function(){
		var selectedId = $(this).val();
		$('.all_categories').each(function() {
			if ($(this).attr('data-category-id') == selectedId) {
				$(this).removeClass("hide");
			} else {
				$(this).addClass("hide");
			}
		});
	});
	$(".checkbox_acc").change(function(){
		if($(this).is(':checked')){
			arr.push($(this).next().text());
		} else {
			arr.splice(arr.indexOf($(this).next().text(), 1));
		}
		document.getElementById("demo").innerHTML = "Selected Subcategories:- " + arr.join(", ");
	});
	$("#new_user").validate({
		debug: false,
		rules: {
			"user[user_name]": {minlength: 6, required: true},
			"user[contact_number]": {phoneUS: true, required: true},
			"user[email]": {email: true, required: true, remote:"/users/check_email"},
			"user[password]": {minlength: 6, required: true},
			"user[password_confirmation]": {equalTo: "#user_password", required: true}
		},
		messages: {
			"user[password_confirmation]": {equalTo: "Please enter the same password as above"},
			"user[email]": {remote: "Email already taken"}
		},
		highlight: function(element) {
            $(element).addClass('error');
        }, 
        unhighlight: function(element) {
            $(element).removeClass('error');
        }
	});
	$('.like-btn').click(function(){
		var likeable_id = $(this).attr('data-likeable-id');
		var likeable_type = $(this).attr('data-likeable-type');
		var user_id = $(this).attr('data-user-id');
		var like_id = $(this).attr('data-like-id');
		if ($(this).html() == "Like") {
	        $.ajax({
				type: "POST",
				url: "/users/" + user_id + "/likes", 
				dataType: 'script',
				data: {
					'likeable_id': likeable_id,
					'likeable_type': likeable_type
				}
			});
			$(this).text("Unlike")
			$(this).attr('disabled', 'disabled')
	    }
	    else {
			$.ajax({
				type: "DELETE",
				url: "/users/" + user_id + "/likes/" + like_id, 
				dataType: 'script',
				data: {
					'likeable_id': likeable_id,
					'likeable_type': likeable_type
				}
			});
			$(this).text("Like")
	    }
	    return false;
	});
	$('.comment-like-btn').click(function(){
		var likeable_id = $(this).attr('data-likeable-id');
		var likeable_type = $(this).attr('data-likeable-type');
		var user_id = $(this).attr('data-user-id');
		var like_id = $(this).attr('data-like-id');
		if ($(this).html() == "Like") {
	        $.ajax({
				type: "POST",
				url: "/users/" + user_id + "/likes", 
				dataType: 'script',
				data: {
					'likeable_id': likeable_id,
					'likeable_type': likeable_type
				}
			});
			$(this).text("Unlike")
			$(this).attr('disabled', 'disabled')
	    }
	    else {
			$.ajax({
				type: "DELETE",
				url: "/users/" + user_id + "/likes/" + like_id, 
				dataType: 'script',
				data: {
					'likeable_id': likeable_id,
					'likeable_type': likeable_type
				}
			});
			$(this).text("Like")
	    }
	    return false; 
	});
});