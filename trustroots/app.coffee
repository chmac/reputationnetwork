@References = new Meteor.Collection 'references'

References.allow
  insert: (userId, doc) ->
    if not userId?
      throw new Meteor.Error 400, "Cannot insert unless logged in."
    _.extend doc, userId: userId
  update: (userId, doc, fieldNames, modifier) ->
    if doc.userId isnt userId
      throw new Meteor.Error 400, "Naughty, naughty. You can only update your own items."
    true
  remove: (userId, doc) ->
    if doc.userId isnt userId
      throw new Meteor.Error 400, "Naughty, naughty. You can only delete your own items."
    true

