module ApplicationHelper
  def full_title page_title = ""
    base_title = t "base_title"
    page_title.blank? ? base_title : "#{page_title} | #{base_title}"
  end

  def toastr_flash
    flash.each_with_object([]) do |(type, message),
                                   flash_message|
      type = "success" if type == "notice"
      type = "error" if type == "alert"
      text = content_tag(:script, nil, type: "text/javascript") do
        sanitize("toastr.#{type}('#{message}', '', {closeButton: true,
          progressBar: true});")
      end
      flash_message << text if message
    end.join("\n")
  end
end
