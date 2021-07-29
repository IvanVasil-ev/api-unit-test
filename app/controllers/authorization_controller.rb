
require 'google/apis/oauth2_v2'
require 'open-uri'  

class AuthorizationController < ApplicationController

 def get_authorization
  oauth_service = Google::Apis::Oauth2V2::Oauth2Service.new
  userinfo = oauth_service.tokeninfo(access_token: params[:access_token]);
  if userinfo.audience === Rails.application.credentials.dig(:google, :google_client_id)
    uri = URI("https://www.googleapis.com/oauth2/v3/tokeninfo?id_token=#{params[:id_token]}")
    res = Net::HTTP.get_response(uri)
    data = ActiveSupport::JSON.decode(res.body)
    user = User.create_user_for_google(data);

    uploader = ImagesUploader.new
    uploader.download! data['picture']
    user.avatar = uploader
    user.save!

    token = Warden::JWTAuth::UserEncoder.new.call(user, :user, nil) 

    render json: [token: token[0], user: user]
  else
    render json: { error: 'Invalid request' }, status: :unprocessable_entity
  end
 end

end