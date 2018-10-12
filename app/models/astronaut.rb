

class Astronaut < ApplicationRecord
  validates_presence_of :name, :age, :job

  has_many :astronaut_missions
  has_many :missions, through: :astronaut_missions

  def self.average_age
    average(:age)
  end

  def self.time_in_space
    select('astronauts.*, SUM(missions.time_in_space) AS total_time')
    .joins(:missions)
    .group(:astronaut_id, :id)
  end

  def alphabetical_missions
    missions.order(:title)
  end



end
