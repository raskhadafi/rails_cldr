require_dependency "rails_cldr/application_controller"

module RailsCldr
  class Numbers::NumbersController < ApplicationController
    def show
      render_numbers_json
    end
  end
end
