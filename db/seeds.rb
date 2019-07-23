# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#  cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)
    Role.create( :roleName => 'admin')
    Role.create( :roleName => 'manager')
    Role.create( :roleName => 'managerassist')
    Role.create( :roleName => 'observer')

    Category.create( :categoryName => 'COMPUTER, DESKTOP')
    Category.create( :categoryName => 'COMPUTER, lAPTOP')
    Category.create( :categoryName => 'ANALYZER, SPECTRUM')
    Category.create( :categoryName => 'OSCILLOSCOPE')
    Category.create( :categoryName => 'MONITOR')
    Category.create( :categoryName => 'MULTIMETER, BENCH')
    Make.create( :makeName => 'Dell')
    Make.create( :makeName => 'Apple')
    Make.create( :makeName => 'Agilent')
    Make.create( :makeName => 'HP')
    Make.create( :makeName => 'Lab-Volt')
    

# ["admin", "manager", "managerassist", "observer"].each do |role|
#Role.roleName role

