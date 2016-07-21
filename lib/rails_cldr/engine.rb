module RailsCldr
  class Engine < ::Rails::Engine
    isolate_namespace RailsCldr

    initializer :rails_cldr_paths do |app|
      config.bower_components_path      = root.join("app/assets/json")
      config.cldr_numbers_src_path      = config.bower_components_path.join("cldr-numbers-full/main")
      config.cldr_supplemental_src_path = config.bower_components_path.join("cldr-core/supplemental")
      config.cldr_dates_src_path        = config.bower_components_path.join("cldr-dates-full/main")
    end

    initializer :rails_cldr_available_locales do |app|
      config.locales = {}
      config.locales[:numbers] = Dir[config.cldr_numbers_src_path.join("*").to_s].map {|e| Pathname.new(e).basename.to_s }
      config.locales[:dates]   = Dir[config.cldr_dates_src_path.join("*").to_s].map   {|e| Pathname.new(e).basename.to_s }
    end
  end
end
