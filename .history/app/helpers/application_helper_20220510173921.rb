module ApplicationHelper
  def full_title(page_title: "")
    if page_title.nil?
      "BIGBAG Store"
    else
      "#{page_title} - BIGBAG Store"
    end
  end
end
