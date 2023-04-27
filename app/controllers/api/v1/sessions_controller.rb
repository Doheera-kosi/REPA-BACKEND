# app/controllers/api/v1/sessions_controller.rb

class Api::V1::SessionsController < ApplicationController
    def create
      @user = User.authenticate(params[:email], params[:password])
  
      render json: { message: 'Login successful', user: @user }
    rescue StandardError => e
      render json: { error: e.message }, status: :unauthorized
    end
end
  