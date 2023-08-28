# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Game.destroy_all

games = [
  { name: "The Witcher 3: Wild Hunt", description: "Um RPG épico de mundo aberto.", price: 29.99, category: "RPG", user_id: 1 },
  { name: "Valorant", description: "Um jogo de tiro tático em equipe.", price: 0, category: "FPS",  user_id: 1 }
]

games.each do |game|
  Game.create!(game)
end
