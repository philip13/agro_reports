# navigation_helper.rb
module NavigationHelper
  def link_class link_path
    if current_page?(link_path)
      "a-active a-exact-active flex items-center px-6 py-2 mt-4 duration-200 border-l-4 bg-gray-600 bg-opacity-25 text-gray-100 border-gray-100"
    else
      "flex items-center px-6 py-2 mt-4 duration-200 border-l-4 border-gray-900 text-gray-500 hover:bg-gray-600 hover:bg-opacity-25 hover:text-gray-100"
    end
  end
end
