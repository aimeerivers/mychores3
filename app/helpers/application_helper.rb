module ApplicationHelper

  def page_title(title)
    content_for :title do
      title
    end
  end

end
