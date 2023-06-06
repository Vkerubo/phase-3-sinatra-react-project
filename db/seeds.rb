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

client2 = Project.create(
    title: 'Client 2',
    favorite: true,
    color: '#e7aaa2'
)

client3 = Project.create(
    title: 'Client 3',
    favorite: false,
    color: '#e7aaa2'
)

client4 = Project.create(
    title: 'Client 3',
    favorite: false,
    color: '#e7aaa2'
)

puts "Seeding boards..."
client1_backlog = client1.boards.build(name: 'Backlog')
client1_todo = client1.boards.build(name: 'To Do')
client1_completed = client1.boards.build(name: 'Completed')

puts "✅ Done seeding!"
