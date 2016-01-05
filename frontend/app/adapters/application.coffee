`import DS from 'ember-data'`
`import ENV from 'relationship/config/environment'`
`import DataAdapterMixin from 'ember-simple-auth/mixins/data-adapter-mixin'`

ApplicationAdapter = DS.JSONAPIAdapter.extend DataAdapterMixin,
  host: ENV.apiHost
  authorizer: 'authorizer:oauth2'

`export default ApplicationAdapter`
