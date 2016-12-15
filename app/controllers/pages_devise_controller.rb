class PagesDeviseController < Devise::RegistrationsController

  def new
    @user = current_user 
  end

  def update
    @user = current_user
  end

end
