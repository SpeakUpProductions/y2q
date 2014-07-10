(function() {
  $(function(){
    $("#profile_issue_tokens").tokenInput([], {
      searchingText: '',
      noResultsText: '',
      hintText: '',
      allowFreeTagging: true,
      tokenValue: 'name',
      theme: "facebook"
    });
  })
}())
