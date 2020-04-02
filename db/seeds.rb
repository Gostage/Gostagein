Favorite.destroy_all
Comment.destroy_all
Review.destroy_all
Internship.destroy_all
User.destroy_all

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
		population: ["Personnes âgées", "Enfants", "Adolescents", "Adultes", "Autistes", "Haut potentiel", "Personnes Cérébro-lésées", "Non pertinent", "Autres"].sample, 
		duration: [1, 2, 2.5, 3, 3.5, 4, 4.5, 5, 6].sample,
		remuneration: [250, 300, 350, 400, 450, 500, 550, 600, 650].sample,
		user: User.all.sample , 
		description: Faker::GreekPhilosophers.quote, 
		title: Faker::Job.title, 
		cursus: ["Licence 1", "Licence 2", "Licence 3", "Master 1", "Master 2"].sample,
		region: ["Auvergne-Rhône-Alpes", "Bourgogne-Franche-Comté", "Bretagne", "Centre-Val de Loire", "Corse", "Grand Est", "Hauts-de-France", "Île-de-France", "Normandie", "Nouvelle-Aquitaine", "Occitanie", "Pays de la Loire", "Provence-Alpes-Côte d'Azur"].sample)
end

puts "100 stages ont été crées"


100.times do |favorite|
	favorite = Favorite.create(user: User.all.sample, internship: Internship.all.sample)
end

puts "100 favoris ont été crées"

100.times do |comment|
	comment = Comment.create(content: Faker::Quote.most_interesting_man_in_the_world, user: User.all.sample,
		internship: Internship.all.sample)
end

puts "100 commentaires ont été crées"

100.times do |review|
	review = Review.create(title: Faker::Lorem.sentence,
		description: Faker::Lorem.paragraph,
		notation: [1, 2, 2.5, 3, 3.5, 4, 4.5, 5].sample,
		internship: Internship.all.sample,
		user: User.all.sample)
end

puts "100 avis ont été crées"

puts "Le seed est fait, yeaah 🤟"