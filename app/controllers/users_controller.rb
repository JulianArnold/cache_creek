class UsersController < ApplicationController
  before_action :admin_access_required, except: %i[show edit update]
  before_action :get_user, except: :index
  before_action :add_breadcrumbs

  def index
    @users = User.all
  end

  def show; end

  def edit; end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: I18n.t('controllers.users.update.success') }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    if @user.destroy
      flash[:success] = I18n.t('controllers.users.destroy.success')
    else
      flash[:error] = I18n.t('controllers.users.destroy.error')
    end
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { render json: {}, status: :ok }
    end
  end

  protected

  def get_user
    @user = if current_user&.admin? && params[:id].present?
              User.find(params[:id])
            else
              current_user
            end
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :mobile_number)
  end

  def add_breadcrumbs
    @breadcrumbs << { label: I18n.t('activerecord.models.users.other'), path: users_path }
    @breadcrumbs << { label: @user.full_name, path: @user } if defined?(@user)
    @breadcrumbs << { label: I18n.t('views.general.edit'), path: edit_user_path(@user) } if %w[edit update].include?(action_name)
  end
end
