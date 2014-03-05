@References = new Meteor.Collection 'references',
  schema: new SimpleSchema
    transactionId:
      type: String
      max: 200
      label: 'Transaction ID'

    recipientAddress:
      type: String

    website:
      type: String
      label: 'Vendor website'
      optional: true

    rating:
      type: Number
      label: 'Rating out of 100'
      min: 0
      max: 100

    comment:
      type: String
      optional: true
      max: 200

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
