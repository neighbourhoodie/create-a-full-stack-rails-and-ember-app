`import Ember from 'ember'`

ProjectsShowRoute = Ember.Route.extend
  model: (params) -> @store.findRecord('project', params.project_id)

  setupController: (controller, model) ->
    @_super(controller, model)
    controller.set('contacts', @store.findAll('contact'))

  actions:
    addContact: (contact) ->
      model = @get('controller.model')
      model.get('contacts').pushObject(contact)
      model.save()

`export default ProjectsShowRoute`
