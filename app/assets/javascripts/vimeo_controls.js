(function() {
  $(function(){
    var iframe = $('#home_video')[0];
    var player = $f(iframe);
    var flexVideo = $('.flex-video.vimeo');

    // When the player is ready, add listeners
    player.addEvent('ready', function() {
        player.addEvent('finish', onFinish);
    });

    function onFinish(id) {
      flexVideo.slideUp(1500, function() {
        flexVideo.remove();
      });
    }
  })
}())
