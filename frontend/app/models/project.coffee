`import DS from 'ember-data'`
`import Topic from 'relationship/models/topic'`

Project = Topic.extend
  name: DS.attr 'string'
  status: DS.attr 'string'

  contacts: DS.hasMany 'contact'
  tasks: DS.hasMany 'task'
  offers: DS.hasMany 'offers'
  notes: DS.hasMany 'note'

  shortCode: (->
    initials = @getWithDefault('name', '').match(/\b(\w)/g)
    initials.join('').toUpperCase() if initials
  ).property('name')

`export default Project`
