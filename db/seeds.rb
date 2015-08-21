# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

def random_string(digits)
  str = ""
  digits.times do 
    str += (Random.rand(27) + 65).chr
  end
  return str
end


100.times do |i|
  User.create(
    :name => random_string(10),
    :email => random_string(Random.rand(10)+20) + '@' + random_string(5) + '.' + random_string(3),
    :country_code => 'JP',
    :state_code => '13',
    :password => random_string(10)
    :profile => random_string(100)
  )
end