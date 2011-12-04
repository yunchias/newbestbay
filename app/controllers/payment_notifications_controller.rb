class PaymentNotificationsController < InheritedResources::Base

  protect_from_forgery :except => [:create]
  def create
    PaymentNotification.create!(:params => params)
    render :nothing => true
  end
end
