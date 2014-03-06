
# This doesn't work for some reason, don't know why, scope?
#Template.rate.References = ->
#  @References

Template.rate.rendered = ->
  jQuery('input[name=comment]').parent().after('<div id="siginput-wrapper">Sign this text:<br><input id="siginput" readonly></input></div>');

Template.rate.events
  'change input': (e)->
    all = []
    jQuery('input').each (i) ->
      all.push jQuery(this).val()
    jQuery('#siginput').val(all.join(';'))
  'click #siginput': (e)->
    e.target.select()