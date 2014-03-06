Template.home.events
  'submit #search-form': (e)->
    e.preventDefault()
    jQuery('#results').delay(500).show();