class Product < ApplicationRecord

  belongs_to :supplier
  has_many :images
  has_many :orders
  
validates :name, presence: true
validates :name, uniqueness: true
validates :description, presence: true
validates :description, length: { minimum: 20 }
validates :description, length: { maximum: 200 }
validates :image_url, uniqueness: true
validates :price, presence: true
validates :price, numericality: { greater_than: 0 }

  def supplier
    Suplier.find_by(id: supplier_id) 
  end

  def is_discounted?
    price < 2 
  end  

  def tax
   price * 0.09
  end  

  def total
    tax + price
  end  
end
