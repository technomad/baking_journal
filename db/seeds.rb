# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
require 'open-uri'

#Supply all the units of measurement to be used
Unit.delete_all
open("db/seeds/measurements.csv") do |measurements|
  measurements.read.each_line do |measurement|
    unit, uof = measurement.chomp.split(",")
    Unit.create!(:name => unit, :unit_of => uof)
  end
end