module RailsCldr
  class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    private

      def render_dates_json(name)
        render json: File.read(
          RailsCldr::Engine.config.cldr_dates_src_path.join(params[:locale]).join(name)
        )
      end

      def render_supplemental_json
        render json: File.read(
          RailsCldr::Engine.config.cldr_supplemental_src_path.join(json_filename.camelize(:lower))
        )
      end

      def render_numbers_json
        render json: File.read(
          RailsCldr::Engine.config.cldr_numbers_src_path.join(params[:locale]).join(json_filename)
        )
      end

      def json_filename
        [controller_name, ".json".freeze].join
      end
  end
end
