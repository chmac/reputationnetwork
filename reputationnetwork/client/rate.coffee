
# This doesn't work for some reason, don't know why, scope?
#Template.rate.References = ->
#  @References

Template.rate.rendered = ->
  jQuery('input[name=comment]').parent().after('<div class="form-group"><label class="control-label" for="siginput">Sign this text:</label><input id="siginput" class="form-control" readonly></input></div>');

Template.rate.events
  'change input': (e)->
    all = []
    jQuery('input').each (i) ->
      if this.id isnt 'siginput' and jQuery(this).attr('name') isnt 'signature'
        all.push jQuery(this).val()
    jQuery('#siginput').val(all.join(';'))
  'click #siginput': (e)->
    e.target.select()