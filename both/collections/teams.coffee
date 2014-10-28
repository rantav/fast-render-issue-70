@Teams = new Mongo.Collection('teams', transform: (data) -> new Team(data))

class @Team extends Model
  constructor: (@data) ->
    super(@data)
    @company = -> Companies.findOne({_id: @companyId})

  startEdit: ->
    return unless @canEdit()
    @data.draft = undefined
    Teams.update({_id: @_id}, {$set: {draft: _.omit(@data, '_id')}})

  canEdit: -> true

  isEditing: ->
    not not @data.draft

  cancelEdit: ->
    return unless @canEdit()
    Teams.update({_id: @_id}, {$unset: {draft: ''}})

  save: ->
    return unless @canEdit()
    Teams.update({_id: @_id}, {$unset: {draft: ''}, $set: @data.draft})
