`import Ember from 'ember'`

ContactListComponent = Ember.Component.extend
  selectedContact: null

  actions:
    addContact: ->
      selectedContact = @get('selectedContact')
      if selectedContact
        @sendAction('onAddContact', selectedContact)
        Ember.$('#add-contact-modal').modal('hide')

`export default ContactListComponent`
