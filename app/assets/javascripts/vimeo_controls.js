(function() {
  $(function(){
    if($('#home_video').length > 0)
    {
      var iframe = $('#home_video')[0];
      var player = $f(iframe);
      var flexVideo = $('.flex-video.vimeo');

      // When the player is ready, add listeners
      player.addEvent('ready', function() {
          player.addEvent('finish', onFinish);
      });

      function closeVideo() {
        $('.skip-video').remove();
        flexVideo.slideUp(1500, function() {
          flexVideo.remove();
          $.ajax({
            url : 'welcome/played',
            type : 'PUT'
          });
        });
      }

      $('.skip-video').click(closeVideo);

      function onFinish(id) {
        closeVideo();
      }
    }
  })
}())
