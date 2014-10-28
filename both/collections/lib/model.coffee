class @Model
  constructor: (@data) ->
    # load in all the passed attrs
    for name, value of @data
      if name.match(/_id$/) and (value instanceof Meteor.Collection.ObjectID)
        @[name] = value._str
      else
        @[name] = value