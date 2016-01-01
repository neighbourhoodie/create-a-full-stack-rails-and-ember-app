`import DS from 'ember-data'`

Contact = DS.Model.extend
  familyName: DS.attr 'string'
  givenNames: DS.attr 'string'
  title: DS.attr 'string'
  phone: DS.attr 'string'
  email: DS.attr 'string'
  website: DS.attr 'string'
  address: DS.attr 'string'
  customerId: DS.attr 'string'
  additionalInfo: DS.attr 'string'

  company: DS.belongsTo 'company'

  formattedAddress: (->
    return "" unless @get('address')
    new Ember.Handlebars.SafeString @get('address').replace /\n/g, '<br>'
  ).property('address')

`export default Contact`
