json.extract! gallery, :id, :name, :caption, :description, :image, :created_at, :updated_at
json.url gallery_url(gallery, format: :json)
