#/*****************************************************************************/
#/* Client and Server Routes */
#/*****************************************************************************/
Router.configure
  layoutTemplate: 'MasterLayout'
  loadingTemplate: 'Loading'
  notFoundTemplate: 'NotFound'
  templateNameConverter: 'upperCamelCase'
  routeControllerNameConverter: 'upperCamelCase'
  trackPageView: true

Router.map ->
  @route 'home', path: '/', onAfterAction: -> @redirect('http://www.gormim.com/')
  @route 'team.index',
    path: '/team/:_id'
    data: -> Teams.findOne({_id: @params._id})
    waitOn: -> Meteor.subscribe('teams', @params._id)
    fastRender: true
