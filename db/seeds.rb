# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Heartbreak.delete_all

Heartbreak.create(display: "Education")
Heartbreak.create(display: "Human Rights")
Heartbreak.create(display: "Nutrition & Water Crisis")
Heartbreak.create(display: "Physical/Mental Health")
Heartbreak.create(display: "Poverty")
Heartbreak.create(display: "Violence/Abuse")
Heartbreak.create(display: "War/Genocide")


Inspiration.delete_all

Inspiration.create(display: "Activism")
Inspiration.create(display: "Arts & Culture")
Inspiration.create(display: "Business")
Inspiration.create(display: "Education")
Inspiration.create(display: "Humanitarian")
Inspiration.create(display: "Politics")
Inspiration.create(display: "Science")
