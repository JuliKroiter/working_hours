# README

Ruby version: 2.3.1

Планы:

1. seed.rb :
Restaurant.create(working_hours: Restaurant::DEFAULT_WORKING_HOURS).tap {|rest| 2.times { rest.tables.create() } }

2. Возможность создавать резерв в ресторане
  RestaurantsController: show action(html)
  ReservesController: create action(ajax)