# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

tags = [
  "Scaling",
	"Funding",
	"Vclivingdead",
	"Partnership",
	"Priorities",
	"Functionality",
	"Iteration",
	"Traction",
	"Design",
	"Privacy",
	"Customer",
	"Termsheet",
	"Management",
	"Outsourcing",
	"Competition",
	"Marketing",
	"Productfit",
	"Sales",
	"Board"
]

tags.each {|tag| Tag.create(:name => tag)}