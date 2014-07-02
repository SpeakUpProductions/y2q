modal = $('#video_modal')
filter_form = $('#filter_form')

openVideo = ->
  id = $(@).data('id')
  url = '/videos/'+id
  $.ajax({
    url: url,
    type: 'GET'
  }).success (data) ->
      modal.html(data)
      modal.foundation('reveal', 'open')

replaceVideos = (newVideos) ->
  $('#videos-area').html(newVideos)
  $('.js-isotope').isotope({ "itemSelector": ".item", "masonry": { "columnWidth": 200, "gutter": 20 } })

filterVideos = ->
  $.ajax({
    url: filter_form.attr('action')
    data: filter_form.serialize()
    type: 'GET'
  }).success (data) ->
    replaceVideos(data)

  return

checkboxChecked = ->
  $(@).closest("li").toggleClass('selected')
  filterVideos()
  return

$ ->
  $('#videos-area').on 'click', '.video-ss', openVideo
  $('.what-lists li input').on 'click', checkboxChecked
  return
