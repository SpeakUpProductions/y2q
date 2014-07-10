(function() {
  $(function(){
    $('#profile_issue_tokens').selectize({
    plugins: ['remove_button'],
    delimiter: ',',
    persist: false,
    highlight: false,
    openOnFocus: false,
    create: function(input) {
        return {
            value: input,
            text: input
        }
      }
    });
    $('#profile_talent_tokens').selectize({
    plugins: ['remove_button'],
    delimiter: ',',
    persist: false,
    highlight: false,
    openOnFocus: false,
    create: function(input) {
        return {
            value: input,
            text: input
        }
      }
    });
  })

}())
