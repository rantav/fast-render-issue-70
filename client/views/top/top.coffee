
# Top: Event Handlers and Helpers
Template.Top.events
 "click #edit": (e, tmpl) ->
   @startEdit()
 "click #cancel": (e, tmpl) ->
   @cancelEdit()
 "click #save": (e, tmpl) ->
   @save()

# Top: Lifecycle Hooks
Template.Top.created = ->

Template.Top.rendered = ->

Template.Top.destroyed = ->

