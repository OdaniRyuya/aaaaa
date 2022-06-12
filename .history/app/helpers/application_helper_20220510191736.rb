module ApplicationHelper
  def full_title(page_title = nil)
    if page_title.nl?
      "BIGBAG Store"
    else
      "#{page_title} - BIGBAG Store"
    end
  end
end
