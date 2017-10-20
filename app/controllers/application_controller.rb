require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { head :forbidden, content_type: 'text/html' }
      format.html { redirect_to root_path, notice: 'Access Denied!' }
      format.js   { head :forbidden, content_type: 'text/html' }
    end
  end
  
  protect_from_forgery with: :exception
end
