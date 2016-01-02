`import DS from 'ember-data'`

Project = DS.Model.extend
  name: DS.attr 'string'
  status: DS.attr 'string'

  contacts: DS.hasMany 'contact'
  tasks: DS.hasMany 'task'
  offers: DS.hasMany 'offers'

  shortCode: (->
    initials = @getWithDefault('name', '').match(/\b(\w)/g)
    initials.join('').toUpperCase() if initials
  ).property('name')

`export default Project`
