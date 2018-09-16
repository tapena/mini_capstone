class Product < ApplicationRecord

  belongs_to :supplier
  has_many :images
  has_many :orders
  has_many :product_categories
  has_many :categories, through: :product_categories
  
validates :name, presence: true
validates :name, uniqueness: true
validates :description, presence: true
validates :description, length: { minimum: 20 }
validates :description, length: { maximum: 200 }
validates :price, presence: true
validates :price, numericality: { greater_than: 0 }

  def is_discounted?
    self.price < 2 
  end  

  def tax
   self.price * 0.09
  end  

  def total
   self.tax + price
  end  

end
