`import Ember from 'ember'`

ContactsNewRoute = Ember.Route.extend
  model: ->
    Ember.RSVP.hash
      contact: @store.createRecord('contact')
      companies: @store.findAll('company')

  setupController: (controller, model) ->
    @_super(controller, model)
    controller.set('model', model.contact)
    controller.set('companies', model.companies)

  renderTemplate: -> @render('contacts/form')

  deactivate: -> @get('controller.model').rollbackAttributes()

`export default ContactsNewRoute`
