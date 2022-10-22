# Borramos lo que esté previamente
Petition.destroy_all
RecyclingSite.destroy_all
Material.destroy_all
User.destroy_all

# Creación de usuarios

9.times do
  user = User.create(
    email: Faker::Internet.email,
    password: "123456",
    password_confirmation: "123456",
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    collector: [true, false].sample
  )
  user.save
end

puts "Random users created"

# Usuarios para la demo

romario = User.create!(
  email: 'romario@mestra.com',
  password: "123456",
  password_confirmation: "123456",
  first_name: 'Romario',
  last_name: 'Mestra',
  collector: true
)

juanma = User.create!(
  email: 'juan@arboleda.com',
  password: "123456",
  password_confirmation: "123456",
  first_name: 'Juan Manuel',
  last_name: 'Arboleda',
  collector: false
)

camila = User.create!(
  email: 'camila@bedoya.com',
  password: "123456",
  password_confirmation: "123456",
  first_name: 'Camila',
  last_name: 'Bedoya',
  collector: false
)

albert = User.create!(
  email: 'albert@mesa.com',
  password: "123456",
  password_confirmation: "123456",
  first_name: 'Albert Andrés',
  last_name: 'Mesa',
  sitter: false
)

# Materiales
materials = %w[Aceite Baterías Electrónicos Papel/Carton Ropa Plástico Vidrio]

materials.each do |material|
  Material.create!(
    category: material
  )
end

# Creación de sitios de reciclaje
collectors = User.where(collector: true)

collectors.each do |collector|
  RecyclingSite.create!(
    material: Material.all.sample,
    collector: collectors.sample
  )
end

# Creación de peticiones
Petition.create!(
  user: juanma,
  material: Material.all.sample,
  date: Date.today,
  status: "0",
  collector: romario
)
