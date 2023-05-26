class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i.match?(value)
      record.errors.add attribute, (options[:message] || I18n.t("validators.email_validator.format_error"))
    end
  end
end
