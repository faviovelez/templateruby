class PagesController < ApplicationController
  def index
    @user = current_user || User.new
  end

  def upload_file
    @user = current_user
    @user.file = params[:user][:file]
    if @user.save
      redirect_to root_path, alert: 'Se ha guardado con éxito la imagen'
    else
      redirect_to root_path, alert: 'Por favor intente de nuevo'
    end
  end

end
