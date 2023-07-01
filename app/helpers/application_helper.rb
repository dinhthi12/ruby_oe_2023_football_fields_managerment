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
      text = "<script>toastr.#{type}('#{message}', '', {closeButton: true,
       progressBar: true})</script"
      flash_message << text.html_safe if message
    end.join("\n").html_safe
  end
end
