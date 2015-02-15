class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :load_navigation_config

  def load_navigation_config
    @navigation_bar = Dir[Rails.root.to_s + "/app/views/foobar/*.html.haml"].collect {|x| x.split("/").last.split(".").first}
  end
end
