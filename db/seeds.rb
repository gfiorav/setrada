# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create(username: 'guido', password: '123456')

a_table_dict = Dictionary.create(user: user, locator: 'a table')
a_map_dict = Dictionary.create(user: user, locator: 'a map')
an_interface_dict = Dictionary.create(user: user, locator: 'an interface')

a_table_map = {
  'cartodb_id' => 'id',
  'table_name_1234_ene_2013' => 'Results from elections'
}

Translation.create(dictionary: a_table_dict, map: a_table_map)

a_map_map = {
  'calculation' => 'results',
  'max' => 'top',
  'total_results' => 'Total results of the calculation'
}

Translation.create(dictionary: a_map_dict, map: a_map_map)

spanish = {
  'above' => 'arriba',
  'all' => 'todo',
  'results' => 'resultados'
}

Translation.create(dictionary: an_interface_dict, map: spanish)
