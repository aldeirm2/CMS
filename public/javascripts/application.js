// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

// accpets the link tag which is passed in
function remove_fields(link) {
    $(link).prev('input[type=hidden]').val("1");
    $(link).closest(".fields").hide();
}

function add_fields(link, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g");
  $(link).parent().before(content.replace(regexp, new_id));
}



$(function () {
	$('input[id=date]').datepicker();
});


$(function() {
// blah blah

$("#term_link").click(function() {
    console.log('clicked');
  $("#new_key_term_dialog").dialog('open');
})
$("#new_key_term_dialog").dialog({
  modal: true,
  autoOpen: false,
  title: 'Add Key Term'
})

// more blah blah
})