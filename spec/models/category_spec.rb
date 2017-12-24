require 'rails_helper'

RSpec.describe Category, type: :model do
  before(:all) do
    @user = User.first || create(:user)
    @category = Category.first || create(:category, user_id: @user.id)
  end

  it "is valid with valid attributes" do
    category = build(:category, name: generate(:name), user_id: @user.id)
    expect(category.valid?).to be_truthy
  end

  it "has a unique name" do
    category = build(:category, user_id: @user.id)
    expect(category.valid?).to be_falsey
  end

  it "dependent destroy with erros" do
    project =  @category.projects.first ||
      create(:project, user_id: @user.id, category_id: @category.id)
    expect(@category.destroy).to be_falsey
  end
end
