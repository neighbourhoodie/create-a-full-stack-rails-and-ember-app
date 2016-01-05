`import Ember from 'ember'`

OffersEditRoute = Ember.Route.extend
  model: (params) ->
    Ember.RSVP.hash
      offer: @store.findRecord('offer', params.offer_id)
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
        @transitionTo 'offers.show', @get('controller.model')
    cancel: ->
      @transitionTo 'offers.show', @get('controller.model')

`export default OffersEditRoute`
