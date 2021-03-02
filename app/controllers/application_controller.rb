class ApplicationController < ActionController::Base
  before_action :basic_auth     #動作確認中、面倒なので一旦消しておく。下のdef basic_authも消してあるので注意











  private




  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'tech' && password == '32838'
    end
  end
end
