# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]
  before_action :check_guest, only: :destroy

  # GET /resource/sign_up
  def new
    @user = User.new
    @user.addresses.build
  end

  # POST /resource
  # def create
  #   @user = User.new(sign_up_params)
  #   if @user.save
  #     set_flash_message! :notice, :signed_up
  #      sign_up(resource_name, resource)
  #      respond_with resource, location: after_sign_up_path_for(resource)
  #    else
  #      render :new
  #    end
  # end

  # GET /resource/edit
  def edit
    @address = current_user.addresses.build
  end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  def check_guest
    if resource.email == 'guest@example.com'
      redirect_to root_path, alert: 'ゲストユーザーは削除できません。'
    end
  end
  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(
      :sign_up,
      keys: [
        addresses_attributes: [
          :name,
          :zip,
          :prefecture_id,
          :city,
          :town,
          :building
        ]
      ]
    )
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(
      :account_update,
      keys: [
        addresses_attributes: [
          :name,
          :zip,
          :prefecture_id,
          :city,
          :town,
          :building,
          :_destroy,
          :id
        ]
      ]
    )
  end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
