require 'rails_helper'

RSpec.describe Task, type: :model do
  before(:all) do
    user = User.first || create(:user)
    @category = Category.first || create(:category, user_id: @user.id)
    @project = Project.first ||
      create(:project, user_id: @user.id, category_id: @category.id)
  end

  it "is valid with valid attributes" do
    task = build(:task, project_id: @project.id)
    expect(task.valid?).to be_truthy
  end

  it "is nil name attribute" do
    project = build(:task, name: nil, project_id: @project.id)
    expect(project.valid?).to be_falsey
  end

  it "is nil project_id attribute" do
    project = build(:task)
    expect(project.valid?).to be_falsey
  end

  it "has a unique name" do
    task = create(:task, name: Faker::Name.unique.name, project_id: @project.id)
    new_task = build(:task, name: task.name, project_id: @project.id)
    expect(new_task.valid?).to be_falsey
  end
end
