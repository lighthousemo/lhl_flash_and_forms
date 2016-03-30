class SessionsController < ApplicationController
  def new
  end

  def create
    if params[:should_login_successfully]
      redirect_to books_path
    else
      render :new
    end
  end
end
