require_dependency "rails_cldr/application_controller"

module RailsCldr
  class Supplemental::CurrencyDataController < ApplicationController
    def show
      render_supplemental_json
    end
  end
end
