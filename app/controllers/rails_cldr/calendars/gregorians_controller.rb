require_dependency "rails_cldr/application_controller"

module RailsCldr
  class Calendars::GregoriansController < ApplicationController
    def show
      render_dates_json("ca-gregorian.json")
    end
  end
end
