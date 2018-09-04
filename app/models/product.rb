class Product < ApplicationRecord
#Create a model method called `is_discounted?` that returns true if an item is under $2 and false otherwise.

#Create a model method called `tax` which will return the tax that would be charged for a particular product. (Assume a 9% tax rate.)

#Create a model method called `total` which will return the sum of the price + tax
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
