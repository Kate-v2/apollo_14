require 'rails_helper'

describe Astronaut, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :age }
    it { should validate_presence_of :job }
  end

  describe 'Relationships' do
    it { should have_many :astronaut_missions}
    it { should have_many :missions}
  end

  describe 'Calculations' do

    before(:each) do

      @astronaut1 = Astronaut.create!(name: "Astronaut 1", age: 10, job: "Title 1")
      @astronaut2 = Astronaut.create!(name: "Astronaut 2", age: 20, job: "Title 2")

      @mission1 = Mission.create!(title: "Mission 1", time_in_space: 100)
      @mission2 = Mission.create!(title: "Mission 2", time_in_space: 200)
      @mission3 = Mission.create!(title: "Mission 3", time_in_space: 300)

      AstronautMission.create!(astronaut: @astronaut1, mission: @mission1)
      AstronautMission.create!(astronaut: @astronaut1, mission: @mission2)
      AstronautMission.create!(astronaut: @astronaut1, mission: @mission3)

      AstronautMission.create!(astronaut: @astronaut2, mission: @mission2)
      AstronautMission.create!(astronaut: @astronaut2, mission: @mission3)

    end




    # Would rather this be dynamic to astronauts
    # shown, but that's not a task
    it 'can average age of all astronauts' do



    end


  end





end
