`import Ember from 'ember'`

OffersNewRoute = Ember.Route.extend
  model: ->
    Ember.RSVP.hash
      offer: @store.createRecord('offer')
      projects: @store.findAll('project')

  setupController: (controller, model) ->
    @_super(controller, model)
    controller.set('model', model.offer)
    controller.set('projects', model.projects)

  renderTemplate: -> @render('offers/form')

  deactivate: -> @get('controller.model').rollbackAttributes()

  actions:
    save: ->
      @get('controller.model').save().then =>
        @transitionTo 'offers.show'

    cancel: ->
      @transitionTo 'offers.index'

`export default OffersNewRoute`
