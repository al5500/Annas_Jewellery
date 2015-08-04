# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  name        :string
#  description :text
#  cl_id       :string
#  price       :decimal(, )
#  category_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  image_one   :string
#  image_two   :string
#  highlighted :boolean
#  available   :boolean
#  quantity    :integer
#  on_sale     :boolean
#  list_price  :decimal(, )
#  postage     :decimal(, )
#

class Product < ActiveRecord::Base
  belongs_to :category
  has_many :line_items

  before_destroy :ensure_not_referenced_by_any_line_item

  def self.search(search)
    search = ('%' + search + '%')

    Product.where( [
      "name ILIKE :query or
       description ILIKE :query
      ",
      { :query => search }
    ] ) 

  end

  private
  def ensure_not_referenced_by_any_line_item
    if line_items.empty?
      return true
    else
      errors.add(:base, 'Line Items present')
     return false
    end
  end
end
