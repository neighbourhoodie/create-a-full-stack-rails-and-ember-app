`import ApplicationAdapter from 'relationship/adapters/application'`

NoteAdapter = ApplicationAdapter.extend
  pathForType: (type) -> 'notes'

`export default NoteAdapter`
