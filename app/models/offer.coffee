`import DS from 'ember-data'`

Offer = DS.Model.extend
  name: DS.attr 'string'
  status: DS.attr 'string'
  price: DS.attr 'number'
  validUntil: DS.attr 'date'

  contacts: DS.hasMany 'contact'
  tasks: DS.hasMany 'task'
  project: DS.belongsTo 'project'

  shortCode: (->
    initials = @getWithDefault('name', '').match(/\b(\w)/g)
    initials.join('').toUpperCase() if initials
  ).property('name')

`export default Offer`
