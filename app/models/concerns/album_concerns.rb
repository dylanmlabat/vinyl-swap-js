module AlbumConcerns
  extend ActiveSupport::Concern

  def artist_with_title
    "#{artist} - #{title}"
  end
end
