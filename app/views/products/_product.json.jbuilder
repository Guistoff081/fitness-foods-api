json.extract! product, :id, :code, :status, :imported_t, :url, :creator, :created_t, :last_modified_t, :product_name, :quantity, :brands, :categories, :labels, :cities, :purchase_places, :stores, :ingredients_text, :traces, :serving_size, :serving_quantity, :nutriscore_score, :nutriscore_grade, :main_category, :image_url, :created_at, :updated_at
json.url product_url(product, format: :json)
