# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

airline_carriers = Carrier.create([{name: 'Southwest'}, {name: 'Air Canada'}, {name: 'American Airlines'}, {name: 'Delta'}, {name: 'JetBlue'}, {name: 'United Airlines'}, {name: 'US Airways'}, {name: 'Other'}])
airports = Airport.create([{name: 'Bradley International'}, {name: 'More coming soon!'}])
colleges = College.create([{name: 'Berkeley'},{name: 'Branford'}, {name: 'Calhoun'}, {name: 'Davenport'}, {name: 'Ezra Stiles'}, {name: 'Jonathan Edwards'}, {name: 'Morse'}, {name: 'Pierson'}, {name: 'Saybrook'}, {name: 'Silliman'}, {name: 'Timothy Dwight'}, {name: 'Trumbull'}])