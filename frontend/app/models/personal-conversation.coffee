`import DS from 'ember-data'`
`import Note from 'relationship/models/note'`

PhoneCall = Note.extend
  contact: DS.belongsTo 'contact'

`export default PhoneCall`
