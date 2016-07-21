RailsCldr::Engine.routes.draw do
  namespace :numbers do
    scope "(:locale)", :locale => /#{RailsCldr::Engine.config.locales[:numbers].join("|")}/ do
      resource :currencies, format: :json, only: :show
      resource :numbers,    format: :json, only: :show
    end
  end

  namespace :calendars do
    scope "(:locale)", :locale => /#{RailsCldr::Engine.config.locales[:numbers].join("|")}/ do
      resource :gregorians, format: :json, only: :show
    end
  end

  namespace :supplemental do
    resource :likely_subtags,    format: :json, only: :show
    resource :time_data,         format: :json, only: :show
    resource :week_data,         format: :json, only: :show
    resource :currency_data,     format: :json, only: :show
    resource :numbering_systems, format: :json, only: :show
  end
end
