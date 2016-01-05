`import DS from 'ember-data'`
`import Topic from 'relationship/models/topic'`

Offer = Topic.extend
  name: DS.attr 'string'
  status: DS.attr 'string'
  price: DS.attr 'number'
  validUntil: DS.attr 'date'

  contacts: DS.hasMany 'contact'
  tasks: DS.hasMany 'task'
  project: DS.belongsTo 'project'
  notes: DS.hasMany 'note'

  shortCode: (->
    initials = @getWithDefault('name', '').match(/\b(\w)/g)
    initials.join('').toUpperCase() if initials
  ).property('name')

`export default Offer`
