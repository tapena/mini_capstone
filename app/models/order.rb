class Order < ApplicationRecord
  belongs_to :user
  belongs_to :product

  def calculate_subtotal
    self.subtotal = product.price * quantity
  end

  def calculate_tax
    self.tax = subtotal * 0.09
  end

  def calcaulate_total
    self.total = subtotal + tax
  end

  def build_totals
    calculate_subtotal
    calculate_tax
    calcaulate_total
  end  

end
