module NavigationHelper
  def link_class(link_path)
    if current_page?(link_path)
      "a-active a-exact-active flex items-center px-6 py-2 mt-4 duration-200 border-l-4 bg-gray-600 bg-opacity-25 text-gray-100 border-gray-100"
    else
      "flex items-center px-6 py-2 mt-4 duration-200 border-l-4 border-gray-900 text-gray-500 hover:bg-gray-600 hover:bg-opacity-25 hover:text-gray-100"
    end
  end

  def workspace_link account
    active = Current.account == account

    base_classes = "block px-4 py-2 text-sm text-gray-700"
    status_classes = {"bg-indigo-600 text-white": active, "hover:bg-indigo-600 hover:text-white": !active}
    link_to account.short_name, account_path(account), class: class_names(base_classes, status_classes)
  end
end
