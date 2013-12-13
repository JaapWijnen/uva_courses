require 'spec_helper'

describe Institute do

  before { @institute = Institute.new(name: "Example Institute") }

  subject { @institute }

  it { should respond_to(:name) }

  it { should be_valid }

  describe "when name is not present" do
    before { @institute.name = " " }
    it { should_not be_valid }
  end

  describe "when institute name is already taken" do
    before do
      institute_with_same_name = @institute.dup
      institute_with_same_name.save
    end

    it { should_not be_valid }
  end
end