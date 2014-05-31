modal = $('#video_modal')
filter_form = $('#filter_form')

updateVideo = ->
  data = $('#video-edit').serialize()
  alert('updating ' +  data)
  return

cancelVideoUpdate = ->
  modal.foundation('reveal', 'close')
  return

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

doHighlights = ($scope) ->
  highlightLiIfChecked = (index) ->
    $this = $(this)
    $this.closest('li').toggleClass('selected', $this.prop('checked'))
  $('input[type="checkbox"]', $scope).each(highlightLiIfChecked)

checkboxChecked = ->
  doHighlights($(@).closest("li"));
  filterVideos()
  return

$ ->
  $('#videos-area').on 'click', '.video-ss', openVideo
  $('.what-lists li input').on 'click', checkboxChecked
  doHighlights($("form#filter_form"))
  modal.on 'click', '.save-btn', updateVideo
  modal.on 'click', '.cancel-btn', cancelVideoUpdate
  return
