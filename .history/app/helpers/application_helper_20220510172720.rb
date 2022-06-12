module ApplicationHelper

  def full_title(page_title = nil)
    if page_title.empty?
      "BIGBAG Store"
    else
      "#{page_title} | #{BASE_TITLE}"
    end
  end
end
