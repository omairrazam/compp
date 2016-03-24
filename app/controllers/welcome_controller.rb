class WelcomeController < ApplicationController
before_action :authenticate_user!
  # GET /welcome
  def index

  end

end
