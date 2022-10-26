require 'rails_helper'

RSpec.describe Product, type: :model do

 describe 'Validations' do
  @category = Category.new(name: "Palms")
  @product = Product.new(name: "Cascade Palm", price_cents: 5000, quantity: 30, category: @category)


  it 'saves correctly if all fields validate' do
    @category = Category.new(name: "Palms")
    @product = Product.new(name: "Cascade Palm", price_cents: 5000, quantity: 30, category: @category)
    @product.save!
    expect(Product.where(name: "Cascade Palm")).to be_present
    expect(@product).to be_valid
  end

  it 'validates :name, presence: true' do
    @category = Category.new(name: "Palms")
    @product = Product.create(name: nil, price_cents: 5000, quantity: 30, category: @category)
    expect(@product.errors.full_messages).to include "Name can't be blank"
    expect(@product).not_to be_valid
  end

  it 'validates :price, presence: true' do
    @category = Category.new(name: "Palms")
    @product = Product.create(name: "Cascade Palm", price_cents: nil, quantity: 30, category: @category)
    expect(@product.errors.full_messages).to include "Price can't be blank"
    expect(@product).not_to be_valid
  end

  it 'validates :quantity, presence: true' do
    @category = Category.new(name: "Palms")
    @product = Product.create(name: "Cascade Palm", price_cents: 5000, quantity: nil, category: @category)
    expect(@product.errors.full_messages).to include "Quantity can't be blank"
    expect(@product).not_to be_valid
  end

  it 'validates :category, presence: true' do
    @category = Category.new(name: "Palms")
    @product = Product.create(name: "Cascade Palm", price_cents: 5000, quantity: 30, category: nil)
    expect(@product.errors.full_messages).to include "Category can't be blank"
    expect(@product).not_to be_valid
  end


 end
end
