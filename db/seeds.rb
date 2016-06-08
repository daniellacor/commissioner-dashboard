# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


justin = Commissioner.create(name: "Justin", email: "j@flatiron.com", password: "asdf", phone_number: "5555555555")
daniella = Commissioner.create(name: "Daniella", email: "d@flatiron.com", password: "asdf", phone_number: "6666666666")

j_league = League.create(name: "J's League", commissioner_id: 1)
d_league = League.create(name: "D's League", commissioner_id: 2)

first_manager = Manager.create(name: "Bob", email: "bob@bob.com", phone_number: "3333333333", league_id: 1)
second_manager = Manager.create(name: "George", email: "george@george.com", phone_number: "2222222222", league_id: 1)
third_manager = Manager.create(name: "Jim", email: "jim@jim.com", phone_number: "1111111111", league_id: 1)

another_manager = Manager.create(name: "Lauren", email: "lauren@lauren.com", phone_number: "3333333333", league_id: 2)
other_manager = Manager.create(name: "Veronica", email: "veronica@veronica.com", phone_number: "2222222222", league_id: 2)
again_manager = Manager.create(name: "Maureen", email: "maureen@maureen.com", phone_number: "1111111111", league_id: 2)

j_due = Due.create(commissioner_id: 1, league_id: 1, amount: 25)
d_due = Due.create(commissioner_id: 2, league_id: 2, amount: 25)

first_due = Due.create(manager_id: 1, league_id: 1, amount: 25)
second_due = Due.create(manager_id: 2, league_id: 1, amount: 25)
third_due = Due.create(manager_id: 3, league_id: 1, amount: 25)

another_due = Due.create(manager_id: 4, league_id: 2, amount: 25)
other_due = Due.create(manager_id: 5, league_id: 2, amount: 25)
again_due = Due.create(manager_id: 6, league_id: 2, amount: 25)
