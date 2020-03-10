
Internship.destroy_all
User.destroy_all
# Comment.destroy_all
# Favorite.destroy_all


require 'faker'

100.times do |user|
	user = User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: "azerty")
end

puts "100 utilisateurs ont été crées"


100.times do |internship|
	internship = Internship.create(adress: Faker::Address.street_address, 
		zipcode: Faker::Address.zip_code, 
		city: Faker::Address.city, 
		specialty: ["Hospitalier", "Maison médicale","Social", "Médico-social", "Petite enfance", "Associatif", "Scolaire", "Médico-pédagogique", "Libéral", "Recherche", "Entreprise","Privé", "Justice","Police Nationale", "Armée", "Carcéral", "Insertion professionnelle", "Recrutement", "Gestion de carrières", "Ressouces Humaines", "Marketing", "Santé au travail", "Autres"].sample, 
		organization: Faker::Movies::HarryPotter.location, 
		population: ["Personnes âgées", "Enfants", "Adolescents", "Adultes", "Autistes", "Haut Potentionel", "Personnes Cérébro-lésées", "Autres"].sample, 
		notation: [1, 1.5, 3, 3.5, 4, 4.5, 5].sample, 
		user: User.all.sample , 
		description: Faker::GreekPhilosophers.quote, 
		title: Faker::Job.title, 
		cursus: ["Licence 1", "Licence 2", "Licence 3", "Master 1", "Master 2"].sample)
end

puts "100 stages ont été crées"

=begin

100.times do |favorite|
	favorite = Favorite.create(user_id: User.sample.all.id, internship_id: Internship.sample.all.id)
end

puts "100 favoris ont été crées"


100.times do |comment|
	comment = Comment.create(content: Faker::GreekPhilosophers.quote, user: User.sample.all,
		internship: Internship.sample.all)
end

puts "100 commentaires ont été crées"
=end
