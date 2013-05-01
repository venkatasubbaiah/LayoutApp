class HomeController < ApplicationController
  def index
    flash[:notice] = 'notice'
    flash[:error]  = 'error'
    flash[:success] = 'success'
    flash[:info] = 'info'
    flash[:xxx]  = 'xxx'
    flash[:my_flash] = 'my_flash'
    flash[:thisismine] = 'this is mine'
    flash[:another_custom_type]="custom message"
    flash[:venkat] ="this is another custom flash"
  end
  def aboutus
  end
  def contactus
  end
  def main
  end
  def products

  end
end
