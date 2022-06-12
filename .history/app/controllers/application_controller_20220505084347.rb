class ApplicationController < ActionController::Base
  include ActiveStorage::SetCurrent
  ActiveStorage::Current.host = "https://example.com"
  protect_from_forgery with: :exception
end
