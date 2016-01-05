`import Ember from 'ember'`

ContactsShowRoute = Ember.Route.extend
  model: (params) ->
    Ember.RSVP.hash
      contact: @store.findRecord('contact', params.contact_id)
      companies: @store.findAll('company')

  setupController: (controller, model) ->
    @_super(controller, model)
    controller.set('model', model.contact)
    controller.set('companies', model.companies)

  renderTemplate: -> @render('contacts/form')

  deactivate: -> @get('controller.model').rollbackAttributes()

`export default ContactsShowRoute`
