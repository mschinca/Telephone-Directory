module ApplicationHelper
  def format_errors(errors)
    errors.join("<br />").html_safe
  end
end
