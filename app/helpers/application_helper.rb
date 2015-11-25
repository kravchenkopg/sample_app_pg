module ApplicationHelper
  def full_title(page_title) 
    base_title = "RoR sample"
    if page_title.empty?
      base_title << " Tutorial"
    else
      "#{base_title}|#{page_title}"
    end
  end
end
