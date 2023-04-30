module CurrentAccountHelper
  def display_current_account
    session[:current_account].name.truncate(15, separator: ' ')
  end
end
