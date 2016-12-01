class LoggedController < ApplicationController

  def download
    authenticate_user!
  end

  def features
    authenticate_user!
  end

  def contact
    authenticate_user!
  end
end
