`import Ember from 'ember'`
`import ToriiAuthenticator from 'ember-simple-auth/authenticators/torii'`
`import ENV from 'relationship/config/environment'`

GoogleAuthenticator = ToriiAuthenticator.extend
  torii: Ember.inject.service()
  ajax: Ember.inject.service()

  authenticate: (args...) ->
    new Ember.RSVP.Promise (resolve, reject) =>
      @_super(args...).then (data) =>
        @get('ajax').post("#{ENV.apiHost}/authorizations", {
          data: {
            grant_type: 'google_auth_code',
            authorization_code: data.authorizationCode
          }
        }).then (response) =>
          resolve({
            provider: data.provider,
            access_token: response.token,
            email: response.email
          })
        , reject
      , reject

`export default GoogleAuthenticator`
