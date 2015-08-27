class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :set_tenant
  before_filter :handle_tables
  before_filter :load_navigation_config

  def set_tenant
    @tenant = Tenant.first
  end

  def handle_tables
    [ Team ].each { |klass|
      klass.create_table_for_tenant(@tenant) unless klass.does_table_exist?(@tenant)
      klass.table_name = klass.name.underscore.pluralize + "_" + @tenant.id.to_s
    }
  end

  def load_navigation_config
    @bootstrap_pages = Dir[Rails.root.to_s + "/app/views/bootstrap/*.html.haml"].collect {|x| x.split("/").last.split(".").first}.sort
    @jquery_pages    = Dir[Rails.root.to_s + "/app/views/jquery/*.html.haml"].collect {|x| x.split("/").last.split(".").first}.sort
  end

end
