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

  describe 'Creation' do

    it 'can create an astronaut' do
      expect(Astronaut.all.count).to eq(2)
    end

    it 'can retrieve missions through astronaut' do
      missions = @astronaut1.missions
      count    = missions.count
      first    = missions.first

      expect(count).to eq(3)
      expect(first.title).to eq("Mission 1")

    end

    it 'can create missions through astronaut' do
      count1 = @astronaut1.missions.count
      expect(count1).to eq(3)

      @astronaut1.missions.create!(title: "New 1", time_in_space: 10)

      count2 = @astronaut1.missions.count
      expect(count2).to eq(4)
    end

  end

  describe 'Calculations' do

    it 'can average age of all astronauts' do
      expected = 15
      age = Astronaut.average_age
      expect(age).to eq(expected)
    end

    it 'can create an astronaut table with total time in space' do
      temp = Astronaut.time_in_space
      a1_id = @astronaut1.id
      a1    = temp.find(a1_id)
      expected = 600
      total    = a1.total_time
      expect(total).to eq(expected)
    end

  end

  describe 'Sorting' do

    it "can sort an astronaut's missions in alphabetical order by title" do
      @astronaut1.missions.create(title: "A new mission", time_in_space: 10)
      first = @astronaut1.missions.first.title
      expect(first).to eq("Mission 1")

      sorted = @astronaut1.alphabetical_missions
      first = sorted.first.title
      expect(first).to eq("A new mission")
    end


  end





end
