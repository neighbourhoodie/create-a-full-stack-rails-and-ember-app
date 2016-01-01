`import DS from 'ember-data'`

Contact = DS.Model.extend
  family_name: DS.attr 'string'
  given_names: DS.attr 'string'
  title: DS.attr 'string'
  phone: DS.attr 'string'
  email: DS.attr 'string'
  website: DS.attr 'string'
  address: DS.attr 'string'
  customerId: DS.attr 'string'
  additionalInfo: DS.attr 'string'

  company: DS.belongsTo 'company'

`export default Contact`
