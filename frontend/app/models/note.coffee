`import DS from 'ember-data'`

Note = DS.Model.extend
  title: DS.attr 'string'
  description: DS.attr 'string'
  createdAt: DS.attr 'date'

  topic: DS.belongsTo 'topic', polymorphic: true

`export default Note`
