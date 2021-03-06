require 'rails_helper'

RSpec.describe Category, type: :model do
  before(:all) do
    @user = User.first || create(:user)
    @category = Category.first || create(:category, user_id: @user.id)
  end

  it "is valid with valid attributes" do
    category = build(:category, user_id: @user.id)
    expect(category.valid?).to be_truthy
  end

  it "is nil name attribute" do
    category = build(:category, name: nil, user_id: @user.id)
    expect(category.valid?).to be_falsey
  end

  it "is nil user_id attribute" do
    category = build(:category)
    expect(category.valid?).to be_falsey
  end

  it "has a unique name" do
    category = build(:category, name: @category.name, user_id: @user.id)
    expect(category.valid?).to be_falsey
  end

  it "dependent destroy with erros" do
    @category.projects.present? ||
      create(:project, user_id: @user.id, category_id: @category.id)
    expect(@category.destroy).to be_falsey
  end
end
