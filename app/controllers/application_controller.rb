class ApplicationController < ActionController::Base
  respond_to :html
  def after_sign_in_path_for(resource_or_scope)
    root_path
  end
end
