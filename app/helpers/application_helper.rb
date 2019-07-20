module ApplicationHelper

  def inline_errors(model, attribute)
    result = ""
    if model.errors[attribute].any?
      model.errors[attribute].each do |message|
        result += "<li>#{message}</li>".html_safe
      end
    end
    "<ul>#{result}</ul>".html_safe
  end

end
