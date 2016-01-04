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

  projects: DS.hasMany 'project'
  offers: DS.hasMany 'offer'
  company: DS.belongsTo 'company'

  fullName: (->
    "#{@get('familyName')}, #{@get('givenNames')}"
  ).property('familyName', 'givenNames')

  formattedAddress: (->
    return "" unless @get('address')
    new Ember.Handlebars.SafeString @get('address').replace /\n/g, '<br>'
  ).property('address')

`export default Contact`
