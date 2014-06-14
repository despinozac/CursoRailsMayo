class UsersController < ApplicationController
  def index
    @users = User.ordenado_por_nombre
  end

  def new
    @user = User.new
    @user.build_profile
  end

  def create
    @user = User.new(permit_params)
    if @user.save
      flash[:notice] = "Usuario Creado con Exito"
      redirect_to users_path
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(permit_params)
      flash[:notice] = "Usuario Actualizado con Exito"
      redirect_to users_path
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:notice] = "El usuario fue eliminado correctamente"
      redirect_to users_path
    end
  end

  def profile
    @profile = User.find(params[:id]).profile
  end

  private

  def permit_params
    params.require(:user).permit!
  end
end
