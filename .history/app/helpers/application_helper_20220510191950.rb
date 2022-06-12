module ApplicationHelper
BASE_TITLE = "Store".freeze
  def full_title(page_title = "")
    if page_title.brank?
      "BIGBAG Store"
    else
      "#{page_title} - BIGBAG Store"
    end
  end
end
