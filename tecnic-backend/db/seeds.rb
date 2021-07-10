# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

personal_seed_file = Rails.root.join('db', 'seeds', 'personal_db.yml')
personal_db = YAML.load_file(personal_seed_file)

personal_db.each do |info|
	next if info["rss"].nil? || info["rss"].empty?
	begin
		Author.create(
			name:        info["name"],
			author_type: 1,
			blog:        info["blog"].nil? ? nil : info["blog"],
			rss:         info["rss"],
			description: info["description"].nil? ? nil : info["description"],
			github:      info["github"].nil? ? nil : info["github"],
			facebook:    info["facebook"].nil? ? nil : info["facebook"],
			linkedin:    info["linkedin"].nil? ? nil : info["linkedin"],
			twitter:     info["twitter"].nil? ? nil : info["twitter"]
		)
	rescue => e
		# logger.send(:fatal, "#{e}: #{e.message}\n#{e.backtrace.join("\n")}")
		puts "#{e}: #{e.message}\n#{e.backtrace.join("\n")}"
	end
end