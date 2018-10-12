

class AstronautsController < ApplicationController

  def index
    @astronauts = Astronaut.time_in_space
  end

end
