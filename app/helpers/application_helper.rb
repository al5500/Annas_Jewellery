module ApplicationHelper
  def smart_nav
    nav = ''

    if @current_user.present? && @current_user.admin?
      nav += '<li>' + link_to('Home', categories_path) + '</li>'
      nav += '<li>' + link_to('Show Users', users_path) + '</li>'
      nav += '<li>' + link_to('All Products', products_path) + '</li>'
    end

    if @current_user.present? && session[:user_id]
      nav += '<li>' + link_to("Log out #{@current_user.email}", login_path, :method => :delete ) + '</li>'
      nav += '<li>' + link_to('Users Page', edit_user_path(@current_user) )
    else
      nav += '<li>' +link_to('Sign up', new_user_path) + '</li>'
      nav += '<li>' + link_to('Log in', login_path) + '</li>'
    end

    nav
  end
end
