require 'rails_helper'

RSpec.describe Project, type: :model do
  before(:all) do
    @user = User.first || create(:user)
    @category = Category.first || create(:category, user_id: @user.id)
    @project = Project.first ||
      create(:project, user_id: @user.id, category_id: @category.id)
  end

  it "is valid with valid attributes" do
    project = build(:project, user_id: @user.id, category_id: @category.id)
    expect(project.valid?).to be_truthy
  end

  it "is nil name attribute" do
    project = build(:project, name: nil, user_id: @user.id, category_id: @category.id)
    expect(project.valid?).to be_falsey
  end

  it "is nil category attribute" do
    project = build(:project, user_id: @user.id)
    expect(project.valid?).to be_falsey
  end

  it "is nil user attribute" do
    project = build(:project, category_id: @category.id)
    expect(project.valid?).to be_falsey
  end

  it "has a unique name" do
    project = build(:project, name: @project.name, user_id: @user.id, category_id: @category.id)
    expect(project.valid?).to be_falsey
  end
end
