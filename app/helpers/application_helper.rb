module ApplicationHelper
  include Pagy::Frontend

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

  def gravatar_for object, options = {size: Settings.image.avatar.size}
    size = options[:size]
    gravatar_id = Digest::MD5.hexdigest(object.name)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: object.name, class: "gravatar")
  end
end
