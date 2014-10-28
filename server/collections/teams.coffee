# /*
#  * Add query methods like this:
#  *  Teams.findPublic = function () {
#  *    return Teams.find({is_public: true});
#  *  }
#  */


Teams.allow
  insert: (userId, doc) -> true

  update: (userId, doc, fieldNames, modifier) -> true

  remove: (userId, doc) -> true

Meteor.startup ->
  Teams.remove({})
  for k, v of data
    Teams.insert(_.extend({_id: k}, v))

Meteor.publish 'teams', (id) ->
  team = Teams.findOne({_id: id})
  [Teams.find({_id: id}), Companies.find({_id: team.companyId})]