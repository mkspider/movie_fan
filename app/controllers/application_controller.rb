class ApplicationController < ActionController::Base
  
  def after_admin_sign_in_path_for(resource_or_scope)　#複数のdeviceがある場合この記述をする
    if resource.is_a?(Admin)
       admin_orders_path
    else
       root_path
    end
 end
 #ここからuser＝＝＝＝＝＝＝＝＝＝＝＝

  def after_users_sign_in_path_for(resource)
    user_root_path
  end

  def after_users_sign_up_path_for(resource)
    user_path
  end

  def after_users_sign_out_path_for(resource)
    path
  end

end

