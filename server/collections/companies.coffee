# /*
#  * Add query methods like this:
#  *  Companies.findPublic = function () {
#  *    return Companies.find({is_public: true});
#  *  }
#  */

Companies.allow
  insert: (userId, doc) -> false
  update: (userId, doc, fieldNames, modifier) -> false
  remove: (userId, doc) -> false

Meteor.startup ->
  Companies.remove({})
  for k, v of companies
    Companies.insert(_.extend({_id: k}, v))
