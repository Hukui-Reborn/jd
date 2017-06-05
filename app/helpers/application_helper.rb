module ApplicationHelper

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def resource_class
    User
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

def markdown(text)
  options = {
    filter_html:     true,
    hard_wrap:       true,
    link_attributes: { rel: 'nofollow', target: "_blank" },
    space_after_headers: true,
    highlight: true,
    tables: true


  }

  extensions = {
    autolink:           true,
    superscript:        true,
    fenced_code_blocks: true,
    lax_spacing: true,

    disable_indented_code_blocks: true


  }
  if text.blank?
    nil
  else
    renderer = Redcarpet::Render::HTML.new(options)
    markdown = Redcarpet::Markdown.new(renderer, extensions)

    markdown.render(text).html_safe
  end
end

end
