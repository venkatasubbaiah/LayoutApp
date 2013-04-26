class ProfilesController < ApplicationController
  def new
    @profile  = Profile.new
  end
  def create
    @profile = Profile.new(params[:profile])
    if @profile.save
      flash[:notice]= 'Profile Successfully Created'
      redirect_to root_path
    else
      flash[:error] = 'wrong details'
      render :new
    end
  end
end
