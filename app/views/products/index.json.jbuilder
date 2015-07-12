json.array!(@products) do |product|
  json.extract! product, :id, :name, :description, :cl_id, :price, :category_id
  json.url product_url(product, format: :json)
end
