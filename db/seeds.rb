Admin.create!(email: "batata@batata.com", password: "123456")

Role.create!(name: "Presidente")
Role.create!(name: "Diretor")
Role.create!(name: "Membro")

Member.create!(name: "Caetano", role_id: 3)
Member.find_by(id:1).photo.attach(io: File.open('./public/Caetano.jpg'), filename: 'Caetano.jpg')
Member.create!(name: "Pedro", role_id: 3)
Member.find_by(id:2).photo.attach(io: File.open('./public/Pedro.jpg'), filename: 'Pedro.jpg')
Member.create!(name: "Arthur", role_id: 3)
Member.find_by(id:3).photo.attach(io: File.open('./public/Arthur.jpg'), filename: 'Arthur.jpg')
Member.create!(name: "Luiz", role_id: 3)
Member.find_by(id:4).photo.attach(io: File.open('./public/Luiz.jpg'), filename: 'Luiz.jpg')
Member.create!(name: "Lucas", role_id: 2)
Member.find_by(id:5).photo.attach(io: File.open('./public/Lucas.png'), filename: 'Lucas.png')
Member.create!(name: "David", role_id: 2)
Member.find_by(id:6).photo.attach(io: File.open('./public/David.jpg'), filename: 'David.jpg')
Member.create!(name: "Batman", role_id: 3)
Member.find_by(id:7).photo.attach(io: File.open('./public/Batman.jpg'), filename: 'Batman.jpg')
Member.create!(name: "Super Homi", role_id: 3)
Member.find_by(id:8).photo.attach(io: File.open('./public/Superman.jpg'), filename: 'Superman.jpg')
Member.create!(name: "Flash", role_id: 3)
Member.find_by(id:9).photo.attach(io: File.open('./public/Flash.jpeg'), filename: 'Flash.jpeg')
Member.create!(name:"Miranha" ,role_id: 1)
Member.find_by(id:10).photo.attach(io: File.open('./public/Homem-Aranha.jpg'), filename: 'Homem-Aranha.jpg')


Project.create!(name: "Projeto Final Trainee", link: "www.youtube.com", description: "Projeto final do site da Struct feito pelo melhor grupo")
Project.find_by(id:1).photo.attach(io: File.open('./public/pokemon.png'), filename: 'pokemon.png')
Project.create!(name: "Club Penguin", link: "https://newcp.net/pt/", description: "Nostalgia Pura")
Project.find_by(id:2).photo.attach(io: File.open('./public/ClubPenguin.jpg'),filename: 'ClubPenguin.jpg')
Project.create!(name: "Sigaa", link: "https://sig.unb.br/sigaa", description: "Site da UnB")
Project.find_by(id:3).photo.attach(io: File.open('./public/logo-UnB.png'),filename: 'logo-UnB.png')


ProjectRole.create!(name: "Project Owner")
ProjectRole.create!(name: "Desenvolvedor")
ProjectRole.create!(name: "Gerente")

Partner.create!(name: "UnB", link: "www.sigaa.unb.br")
Partner.find_by(id:1).photo.attach(io: File.open('./public/logo-UnB.png'), filename: 'logo-UnB.png')
Partner.create!(name: "Concentro", link: "https://www.instagram.com/concentrodf/")
Partner.find_by(id:2).photo.attach(io: File.open('./public/logo-concentro.png'), filename: 'logo-concentro.png')
Partner.create!(name: "Brasil Junior", link: "https://brasiljunior.org.br/conheca-o-mej")
Partner.find_by(id:3).photo.attach(io: File.open('./public/logo-brasil-junior.png'), filename: 'logo-brasil-junior.png')

Service.create!(name: "Website", description: "Sites institucionais, portfólios, e-commerces e blogs, com layouts personalizados do seu jeito.")
Service.create!(name: "Sistema Web", description: "Plataformas e sistemas personalizados, seguros e responsivos, desenvolvidos para automatizar seus processos ou lançar um novo serviço.")
Service.create!(name: "Aplicativo", description: "Soluções em aplicativos Android e IOS, desenvolvidos sob demanda, personalizados para sua necessidade.")

ProjectMember.create!(member_id: 1, project_id: 1, project_role_id: 2)
ProjectMember.create!(member_id: 2, project_id: 1, project_role_id: 1)