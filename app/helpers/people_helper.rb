module PeopleHelper
  def labels_for_status(status)
    the_class = Person::LABELS_FOR_STATUSES[status.downcase.gsub(' ', '_').to_sym]
    content_tag(:spam, status, class: "label label-#{the_class}")
  end
end
