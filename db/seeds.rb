# Borramos lo que esté previamente
Petition.destroy_all
RecyclingSite.destroy_all
Material.destroy_all
Address.destroy_all
User.destroy_all

puts "Borrando base de datos..."
# Creación de usuarios
# Usuarios para la demo

User.create!(
  email: 'albert@mesa.com',
  password: "123456",
  password_confirmation: "123456",
  first_name: 'Albert Andrés',
  last_name: 'Mesa',
  collector: false
)

puts "Creando materiales..."

# Materiales
materials = %w[Aceite Baterías Electrónicos Papel/Carton Ropa Plástico Vidrio Aluminio]

materials.each do |material|
  Material.create!(
    category: material
  )
end
