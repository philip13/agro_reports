module CollaboratorsHelper
  def invitation_status(active)
    base_classes = "inline-flex px-2 text-xs font-semibold leading-5 rounded-full"
    status_classes = {"text-green-800 bg-green-100": active, "text-red-800 bg-red-100 rounded-full": !active}

    content_tag :span, class: class_names(base_classes, status_classes) do
      active ? t(".active") : t(".inactive")
    end
  end
end
