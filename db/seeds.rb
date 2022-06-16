# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Role.create!(name: "Estagiario")

#Member.create!(name: "Arthur", role_id: 1)
#Member.create!(name: "Luiz", role_id: 1)
Member.create!(name: "Caetano", role_id: 1)
Member.find_by(id:1).photo.attach(io: File.open('./public/Caetano.jpg'), filename: 'Caetano.jpg')


Admin.create!(email: "batata@batata.com", password: "123456")

Project.create!(name: "Projeto Final Trainee", link: "www.youtube.com", description: "Projeto final do site da Struct feito pelo melhor grupo")
Project.find_by(id:1).photo.attach(io: File.open('./public/pokemon.png'), filename: 'pokemon.png')

ProjectRole.create!(name: "Project Owner")
ProjectRole.create!(name: "Desenvolvedor")
ProjectRole.create!(name: "Gerente")

Partner.create!(name: "UnB", link: "www.sigaa.unb.br")
Partner.find_by(id:1).photo.attach(io: File.open('./public/logo-UnB.png'), filename: 'logo-UnB.png')

Service.create!(name: "Website", description: "sla 1")
Service.create!(name: "Sistema Web", description: "sla 2")
Service.create!(name: "Aplicativo", description: "sla 3")

ProjectMember.create!(member_id: 1, project_id: 1, project_role_id: 2)