require 'spec_helper'

describe Course do

  before { @course = Course.new(name: "Example Course", 
  								description: "Description of the course.", 
  								acode: "3X4MP73", 
  								code: "3X4MP732", 
  								sgid: "SG128", 
  								year: "The year 2013", 
  								ects: "18", 
  								period: "period 0", 
  								lecture_material: "some books and stuff", 
  								timetable: "busy", 
  								goals: "Be a winner", 
  								participant_count: "at least 0 students", 
  								specialities: "Juggling", 
  								examination: "Write an essay") }

  subject { @course }

  it { should respond_to(:name) }
  it { should respond_to(:description) }
  it { should respond_to(:acode) }
  it { should respond_to(:code) }
  it { should respond_to(:sgid) }
  it { should respond_to(:year) }
  it { should respond_to(:ects) }
  it { should respond_to(:period) }
  it { should respond_to(:lecture_material) }
  it { should respond_to(:timetable) }
  it { should respond_to(:goals) }
  it { should respond_to(:participant_count) }
  it { should respond_to(:specialities) }
  it { should respond_to(:examination) }

  it { should be_valid }

  describe "when name is not present" do
    before { @course.name = " " }
    it { should_not be_valid }
  end

  describe "when course name is already taken" do
    before do
      course_with_same_name = @course.dup
      course_with_same_name.save
    end

    it { should_not be_valid }
  end
end