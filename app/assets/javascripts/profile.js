(function() {
  $(function(){
    $('#profile_issue_tokens').selectize({
    plugins: ['remove_button'],
    delimiter: ',',
    persist: false,
    highlight: false,
    create: function(input) {
        return {
            value: input,
            text: input
        }
      }
    });
  })

}())
