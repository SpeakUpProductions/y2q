modal = $('#video_modal')

updateVideo = ->
  editForm = $('#video-edit')
  $.ajax({
    url: editForm.attr('action'),
    data: editForm.serialize(),
    type: 'PUT'
  }).complete ->
    modal.foundation('reveal', 'close')
    filterVideos()
    return
  return

cancelVideoUpdate = ->
  modal.foundation('reveal', 'close')
  return

replaceVideos = (newVideos) ->
  $('#videos-area').html(newVideos)
  $('.js-isotope').isotope({ "itemSelector": ".item", "masonry": { "columnWidth": 200, "gutter": 20 } })

$ ->
  $('videos-area').on 'click', '.video-ss', openVideo
  modal.on 'click', '.save-btn', updateVideo
  modal.on 'click', '.cancel-btn', cancelVideoUpdate
  return
