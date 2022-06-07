require 'rails_helper'

RSpec.describe Product, type: :model do 
  describe 'Validations' do
    context "given all fields" do
      it "is valid" do
        category = Category.create(name: 'trees')
        product = Product.new(name:'Test', price:99, quantity:2, category: category)
        expect(product).to be_valid
      end
    end

    context "given all fields except name " do
      it "is not valid" do
        category = Category.create(name: 'trees')
        product = Product.new(price:99, quantity:2, category: category)
        expect(product).not_to be_valid
        puts product.errors.full_messages
      end
    end

    context "given all fields except price " do
      it "is not valid" do
        category = Category.create(name: 'trees')
        product = Product.new(name:'Test', quantity:2, category: category)
        expect(product).not_to be_valid
        puts product.errors.full_messages
      end
    end

    context "given all fields except quantity " do
      it "is not valid" do
        category = Category.create(name: 'trees')
        product = Product.new(name:'Test', price:99, category: category)
        expect(product).not_to be_valid
        puts product.errors.full_messages
      end
    end

    context "given all fields except category " do
      it "is not valid" do
        category = Category.create(name: 'trees')
        product = Product.new(name:'Test', price:99, quantity:2)
        expect(product).not_to be_valid
        puts product.errors.full_messages
      end
    end
  end
end