module ApplicationHelper
  
  def profile_image_tag(user, options = {})
    image_class = options[:class] || "img-thumbnail profile-image"
    if user.profile_image.present?
      image_tag(user.profile_image, class: image_class, alt: "#{user.name}のプロフィール画像")
    else
      image_tag("sample.png", class: image_class, alt: "デフォルトのプロフィール画像")
    end
  end
end
