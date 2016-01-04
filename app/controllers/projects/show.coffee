`import Ember from 'ember'`

ProjectsShowController = Ember.Controller.extend
  actions:
    addTask: ->
      @store.createRecord('task', project: @model, isEditing: true)

    delete: (model) ->
      model.destroyRecord().then =>
        @transitionToRoute 'companies.index'

`export default ProjectsShowController`
