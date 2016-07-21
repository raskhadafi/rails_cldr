//= require cldrjs/dist/cldr
//= require cldrjs/dist/cldr/event
//= require cldrjs/dist/cldr/supplemental
//= require_self
//= require ./rails_cldr/routes

"use strict";

var railsCldr = {};

railsCldr.load = function load(locale, afterLoad, initializer) {
  $.when(
    $.get(railsCldr.routes.rails_cldr_supplemental_likely_subtags_path()),
    $.get(railsCldr.routes.rails_cldr_numbers_numbers_path({locale: locale})),
    $.get(railsCldr.routes.rails_cldr_numbers_currencies_path({locale: locale})),
    $.get("/cldr/calendars/" + locale + "/gregorians.json"),
    $.get(railsCldr.routes.rails_cldr_supplemental_time_data_path()),
    $.get(railsCldr.routes.rails_cldr_supplemental_week_data_path()),
    $.get(railsCldr.routes.rails_cldr_supplemental_currency_data_path()),
    $.get(railsCldr.routes.rails_cldr_supplemental_numbering_systems_path())
  ).then(function(){
    return [].slice.apply(arguments, [0]).map(function(result) {
      return result[0];
    });
  }).then(afterLoad).then(function(){
    initializer();
  });
};
