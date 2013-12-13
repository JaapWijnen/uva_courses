require 'spec_helper'

describe Programme do

  before { @programme = Programme.new(	name: "Example Programme", 
  										url: "www.someprogram.com") }

  subject { @programme }

  it { should respond_to(:name) }
  it { should respond_to(:url) }

  it { should be_valid }

  describe "when name is not present" do
    before { @programme.name = " " }
    it { should_not be_valid }
  end

  describe "when programme name is already taken" do
    before do
      programme_with_same_name = @programme.dup
      programme_with_same_name.save
    end

    it { should_not be_valid }
  end
end