require 'spec_helper'

describe Staff do

  before { @staff = Staff.new(	name: "Example Staff", 
  								url: "www.staffmembersite.com") }

  subject { @staff }

  it { should respond_to(:name) }
  it { should respond_to(:url) }

  it { should be_valid }

  describe "when name is not present" do
    before { @staff.name = " " }
    it { should_not be_valid }
  end

  describe "when staff name is already taken" do
    before do
      staff_with_same_name = @staff.dup
      staff_with_same_name.save
    end

    it { should_not be_valid }
  end
end