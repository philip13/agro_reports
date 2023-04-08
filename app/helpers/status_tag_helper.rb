module StatusTagHelper
  def status_tag(active)
    if active
      "<span class='inline-flex px-2 text-xs font-semibold leading-5 text-green-800 bg-green-100 rounded-full'>
        #{t('yesno.yes')}
      </span>".html_safe
    else
      "<span class='inline-flex px-2 text-xs font-semibold leading-5 text-red-800 bg-red-100 rounded-full'>
        #{t('yesno.no')}
      </span>".html_safe
    end
  end
end
