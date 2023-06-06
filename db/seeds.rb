puts "Clearing old data..."
Task.destroy_all
Board.destroy_all
Project.destroy_all

puts "Seeding projects..."

client1 = Project.create(
  title: "Client 1",
  favorite: false,
	#description: "Client 1's project",
  color: '#e7aaa2'
)

puts "✅ Done seeding!"
