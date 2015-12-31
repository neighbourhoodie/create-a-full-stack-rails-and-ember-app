`import GoogleOauth2 from 'torii/providers/google-oauth2'`

GoogleWithFetch = GoogleOauth2.extend
  fetch: (data) -> data

`export default GoogleWithFetch`
