puts "Clearing old data..."
Task.destroy_all
Board.destroy_all
Project.destroy_all



puts "✅ Done seeding!"
