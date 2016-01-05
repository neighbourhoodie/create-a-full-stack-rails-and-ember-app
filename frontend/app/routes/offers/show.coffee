`import Ember from 'ember'`

OffersShowRoute = Ember.Route.extend
  model: (params) -> @store.findRecord('offer', params.offer_id)

  setupController: (controller, model) ->
    @_super(controller, model)
    controller.set('contacts', @store.findAll('contact'))

  actions:
    addContact: (contact) ->
      model = @get('controller.model')
      model.get('contacts').pushObject(contact)
      model.save()
    addTask: ->
      @store.createRecord('task', offer: @get('controller.model'), isEditing: true)

`export default OffersShowRoute`
