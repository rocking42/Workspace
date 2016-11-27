# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.destroy_all
u1 = User.create name: "Billy Bob", email: "bill@gmail.co", job_title: "Sales rep", password: "chicken", password_confirmation: "chicken"
u2 = User.create name: "James ferguson", email: "james@gmail.co", job_title: "Marketing wizz", password: "chicken", password_confirmation: "chicken"
u3 = User.create name: "Ahi Shahar", email: "ahi@gmail.co", job_title: "Dev ops", password: "chicken", password_confirmation: "chicken"
 puts "User total count #{User.all.count}"

Organisation.destroy_all
o1 = Organisation.create name: "Pillco LPO", description: "A place for all to get together and contribute to a better tomorrow", location: "355 randwick road Roustmeister 2055"
o2 = Organisation.create name: "Farmzone", description: "Farm coordinated central supply chain", location: "564 Ubenave restley place"
o3 = Organisation.create name: "Sport spaz", description: "The greatest sport news you've ever come across go sports!", location: "234 rockadocker road"

puts "Org total count: #{Organisation.all.count}"

o1.users << u1 << u2
o2.users << u3

OrganisationPost.destroy_all
op1 = OrganisationPost.create post: "this is ned checking in"
op2 = OrganisationPost.create post: "this is Bill checking in"
op3 = OrganisationPost.create post: "this is Craig checking in"
op4 = OrganisationPost.create post: "this is Jerry checking in"
op5 = OrganisationPost.create post: "this is Spike checking in"
op6 = OrganisationPost.create post: "this is Tommy checking in"
op7 = OrganisationPost.create post: "this is James checking in"
op8 = OrganisationPost.create post: "this is Howard checking in"
op9 = OrganisationPost.create post: "this is Steph checking in"

o1.organisation_posts << op1 << op2 << op3 << op4 << op5 << op6 << op7 << op8 << op9
u1.organisation_posts << op1 << op3 << op5 << op7 << op9
u2.organisation_posts << op2 << op4 << op6 << op8



Group.destroy_all
g1 = Group.create name: "marketing"
g2 = Group.create name: "Dev ops"
g3 = Group.create name: "Development"
g4 = Group.create name: "Sales"
g5 = Group.create name: "Management"

o1.groups << g1 << g2 << g3 << g4 << g5
g1.users << u1 << u2
g2.users << u3
