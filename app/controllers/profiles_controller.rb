class ProfilesController < ApplicationController
  def new
    @profile = Profile.new
  end

  def create
    @profile = current_user.build_profile(params[:profile])
    if @profile.save
      flash[:notice]= 'Profile Successfully Created'
      redirect_to profile_path(@profile)
    else
      flash[:error] = 'Details are not sufficient'
      render :new
    end
  end

  def show
    @profile = Profile.find(params[:id])
  end

  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    @profile = Profile.find(params[:id])
    if @profile.update_attributes(params[:profile])
      flash[:notice]= "Profile Successfully Updated"
      redirect_to profile_path(@profile)
    else
      flash[:error]= "Details are not sufficient"
      render :edit
    end
  end
end
