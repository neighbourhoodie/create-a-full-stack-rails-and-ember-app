`import Ember from 'ember'`
`import AuthenticatedRouteMixin from 'ember-simple-auth/mixins/authenticated-route-mixin'`

TasksRoute = Ember.Route.extend AuthenticatedRouteMixin,
  actions:
    addTask: ->
      @store.createRecord('task', isEditing: true)

`export default TasksRoute`
