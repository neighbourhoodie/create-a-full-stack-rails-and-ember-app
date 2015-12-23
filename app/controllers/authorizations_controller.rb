class AuthorizationsController < ApplicationController
  skip_before_action :authorize_request

  def create
    client = Google::APIClient::ClientSecrets.new(
      client_id: ENV['GOOGLE_CLIENT_ID'], client_secret: ENV['GOOGLE_CLIENT_SECRET']
    ).to_authorization
    client.code = params['authorization_code']
    token = client.fetch_access_token!

    oauth_client = Google::Apis::Oauth2V2::Oauth2Service.new
    oauth_client.authorization = client
    user_info = oauth_client.get_userinfo

    AuthToken.where(email: user_info[:email]).first_or_create do |record|
      record.token = token
    end

    render json: {
      email: user_info[:email],
      token: token
    }
  end
end
