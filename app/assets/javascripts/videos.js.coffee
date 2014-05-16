video_template = $('#video_template')
modal = $('#video_modal')

cloneNewFlex = ->
  video_template.children('.flex-video').clone()

setSrc = (flex, src) ->
  flex.find('iframe').attr('src', src)


openVideo = ->
  src = $(@).data('src')
  flex = cloneNewFlex()
  setSrc(flex, src)

  modal.html(flex)
  modal.foundation('reveal', 'open')

replaceVideos = (newVideos) ->
  $('#videos-area').html(newVideos)
  $('.js-isotope').isotope({ "itemSelector": ".item", "masonry": { "columnWidth": 200, "gutter": 20 } })

filteredUrl = (heartbreaks, inspirations) ->
  "videos/filtered?heartbreaks=[#{ heartbreaks.join(',') }]&inspirations=[#{ inspirations.join(',') }]"

filterVideos = ->
  $.ajax({
    url: $(@).attr('action')
    data: $(@).serialize()
    type: 'GET'
  }).success (data) ->
    replaceVideos(data)

  return false # prevent normal behavior

checkboxChecked = ->
  $(@).parent().parent().toggleClass('selected')




$ ->
  $('#videos-area').on 'click', '.video-ss', openVideo
  # $('.what-lists li input').on 'click', checkboxChecked
  $('#filter_form').on 'submit', filterVideos
  return
