class ChangePosturlInMovies < ActiveRecord::Migration[6.0]
  def change
    remove_column :movies, :post_url
    add_column :movies, :poster_url, :string
  end
end
