require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'Products shoud be valid if all fields exist ' do
      cat1 = Category.create(name: 'cat1')
      product = cat1.products.create(name: 'abc', price: 5, quantity: 2)
      expect(product).to be_valid
    end

    it 'Products shoud not be valid if name is missing ' do
      cat1 = Category.create(name: 'cat1')
      product = cat1.products.create(name: nil, price: 5, quantity: 2)
      expect(product).to_not be_valid
    end

    it 'Products shoud not be valid if price is missing ' do
      cat1 = Category.create(name: 'cat1')
      product = cat1.products.create(name: 'abc', price: nil, quantity: 2)
      expect(product).to_not be_valid
    end

    it 'Products shoud not be valid if quantity is missing ' do
      cat1 = Category.create(name: 'cat1')
      product = cat1.products.create(name: 'abc', price: 5, quantity: nil)
      expect(product).to_not be_valid
    end

    it 'Products shoud not be valid if quantity is missing ' do
      product = Product.create(name: 'abc', price: 5, quantity: 2)
      expect(product).to_not be_valid
    end
  end
end
