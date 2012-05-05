RSpec::Matchers.define :have_error do |error|

  def error_message(record, attribute, error)
    I18n.translate("activerecord.errors.models.#{record.class.to_s.underscore}.attributes.#{attribute}.#{error}")
  end

  chain :on do |attribute|
    @attribute = attribute
  end

  match do |record|
    unless @attribute
      raise "It should specify an attribute"
    end

    record.valid?
    message = error_message(record, @attribute, error.to_s)
    record.errors[@attribute].to_a.detect { |e| e == message }
  end

  failure_message_for_should do |record|
    if @attribute
      %{It expected that [#{record.errors[@attribute].collect{|e| "\"#{e}\"" }.join(', ')}] included "#{error_message(record, @attribute, error.to_s)}"}
    end
  end

  failure_message_for_should_not do |record|
    if @attribute
      %{It expected that [#{record.errors[@attribute].collect{|e| "\"#{e}\"" }.join(', ')}] didn't include "#{error_message(record, @attribute, error.to_s)}"}
    end
  end

  description do
    "it should include error '#{error.to_s}'"
  end
end

