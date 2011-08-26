#coding: utf-8

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

Item.create([
  {:type => 1, :name => 'item1', :data => 'freedata1'},
  {:type => 1, :name => 'item2', :data => 'freedata2'},
  {:type => 1, :name => 'item3', :data => 'freedata3'},
  {:type => 1, :name => 'item4', :data => 'freedata4'}
]);

