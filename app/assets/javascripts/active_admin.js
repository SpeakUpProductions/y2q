//= require active_admin/base
//= require jquery

$(function() {
  $('a:contains("Disapprove")').click(function(e) {
    e.preventDefault()

    reason = prompt("Please enter a reason for disapproving this video:")

    if (reason !== null) {
      var form = $(this).parent('form');
      form.find('#disapproval_reason').val(reason)
      form.submit()
    }
  })
});
