`import DS from 'ember-data'`

Company = DS.Model.extend
  name: DS.attr 'string'
  phone: DS.attr 'string'
  email: DS.attr 'string'
  website: DS.attr 'string'
  address: DS.attr 'string'
  customerId: DS.attr 'string'
  additionalInfo: DS.attr 'string'

  contacts: DS.hasMany 'contact'

  formattedAddress: (->
    return "" unless @get('address')
    new Ember.Handlebars.SafeString @get('address').replace /\n/g, '<br>'
  ).property('address')

`export default Company`
