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
client1.save

client2_backlog = client2.boards.build(name: 'Backlog')
client2_todo = client2.boards.build(name: 'To Do')
client2_completed = client2.boards.build(name: 'Completed')
client2.save

client3_backlog = client3.boards.build(name: 'Backlog')
client3_todo = client3.boards.build(name: 'To Do')
client3_completed = client3.boards.build(name: 'Completed')

puts "Seeding tasks..."
client3_todo.tasks.build(
    name: 'Homepage WK40',
    due_date: Date.new(2023,9,1),
    description: '',
    status: 'Not Started',
    priority: 'Medium',
    completed: false
)

client3_todo.tasks.build(
    name: 'Rebrand Website',
    due_date: Date.new(2023,10,1),
    description: 'Develop a wireframe & UI/UX design',
    status: 'Not Started',
    priority: 'Low',
    completed: false
)

client3_todo.tasks.build(
    name: 'Company flyer',
    due_date: Date.new(2023,11,1),
    description: 'Design flyout images',
    status: 'Not Started',
    priority: 'High',
    completed: false
)

client3_todo.save


client3_completed.tasks.build(
    name: 'Website analytics',
    due_date: Date.new(2023,11,29),
    description: '',
    status: 'Complete',
    priority: 'Medium',
    completed: true
)

client3_completed.save


client4_todo.tasks.build(
    name: 'Homepage Fall 3 WK40',
    due_date: Date.new(2023,10,1),
    description: '',
    status: 'Not Started',
    priority: 'High',
    completed: false
)

client4_todo.tasks.build(
    name: 'Banner',
    due_date: Date.new(2023,10,4),
    description: 'Offering flyout discounts up to 25%',
    status: 'Not Started',
    priority: 'Medium',
    completed: false
)

client4_todo.tasks.build(
    name: 'Banner - APPLE',
    due_date: Date.new(2023,10,7),
    description: 'Global Banner - 11% discount on APPLE products'
    status: 'Not Started',
    priority: 'High',
    completed: false
)

client4_todo.save


client1_todo.tasks.build(
    name: 'Promo Code Banner - MONEY BACK',
    due_date: Date.new(2023,11,29),
    description: 'promo code for money back on orders above 10,000'
    status: 'Complete',
    priority: 'High',
    completed: true
)

client1_todo.tasks.build(
    name: 'Website',
    due_date: Date.new(2023,9,29),
    description: 'Redesign the website',
    status: 'In Progress',
    priority: 'High',
    completed: false
)

client1_todo.tasks.build(
    name: 'Promo Code TEST',
    due_date: Date.new(2023,9,30),
    description: 'Generate tests for clients to try, on passing, they get a promo code'
    status: 'In Progress',
    priority: 'High',
    completed: false
)

client1_todo.tasks.build(
    name: 'Workspace for Test',
    due_date: Date.new(2023,9,30),
    description: '',
    status: 'Not Started',
    priority: 'Low',
    completed: false
)

client1_todo.save

puts "✅ Done seeding!"
