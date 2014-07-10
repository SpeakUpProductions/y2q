ready = ->
  $('form').on 'click', '.remove_fields', (event) ->
    $(this).siblings('input[type=hidden][id*=_destroy]').val('1')
    $(this).closest('div.organization-fields').hide()
    event.preventDefault()

  $('form').on 'click', '.add_fields', (event) ->
    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')
    $(this).before($(this).data('fields').replace(regexp, time))
    event.preventDefault()

$(document).ready(ready)
