Gormim app
==========
Just a repro repo for https://github.com/meteorhacks/fast-render/issues/70

Have a look at:
`both/router/routes.coffee` `fastRender: true` (routing)
`both/collections/teams.coffee` (logic)
`server/collections/teams.coffee` (publication)

Note: with each restart the database is being reloaded from fresh (form the file lorem.coffee).
If you want to disable that look into `Meteor.startup` in `server/collections/teams.coffee` and `companies.coffee`


To repro:
`meteor`
browse to http://localhost:3000/team/lorem
Click on Edit. It should change to Cancel/Save (but it does not)

Next comment out `fastRender: true` in routes.coffee, save and reload. Now click Edit. It changes to Cancel/Save, as it should.

Note that with each server restart the data in the teams collection gets reloaded so effectively the edit mode gets reset to not-editing on server restart. You can disable this in the `Meteor.startup` block in `server/collections/teams.coffee`