# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Read json file
require 'json'
# Get each name:

def hash_parser(json_file, state_id)
  if json_file
    data_hash = JSON.parse(json_file)

    data_hash.each do |n|
      City.create!(name: n['nome'].to_s, state_id: state_id)
    end
  else
    p 'Ocorreu um erro ao carregar o arquivo .json'
  end
end

state = State.create!(name: 'Paraná')
p 'Inserindo municípios do Paraná:'
json_file = File.read('./municipios.json')
hash_parser(json_file, state.id)

state = State.create!(name: 'Santa Catarina')
p 'Inserindo municípios de SC:'
json_file = File.read('./municipios-sc.json')
hash_parser(json_file, state.id)

state = State.create!(name: 'Rio Grande do Sul')
p 'Inserindo municípios do Rio Grande do Sul:'
json_file = File.read('./municipios-rs.json')
hash_parser(json_file, state.id)
