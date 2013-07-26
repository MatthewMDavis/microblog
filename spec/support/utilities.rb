  def full_title(page_title)
    base_title = 'The Back 140 Microblog'
    if page_title.empty? || page_title == 'Home'
      base_title
    else
      "#{base_title} | #{page_title}" 
    end
  end