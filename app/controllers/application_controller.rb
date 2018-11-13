class ApplicationController < ActionController::Base
    before_action :basic_auth, if: :production?
    protect_from_forgery with: :exception

    def production?
        Rails.env.production?
    end
  
    private
  
    def basic_auth
      authenticate_or_request_with_http_basic do |username, password|
        username == 'macbook' && password == 'pro'
      end
    end
  end
  