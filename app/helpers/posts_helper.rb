module PostsHelper
  def markdown
    markdown  = Redcarpet::Markdown.new(Redcarpet::Render::HTML,
        :autolink => true, :space_after_headers => true)
  end

  def date_format
    "March 4, 2010, 09:00 AM"
  end
end
