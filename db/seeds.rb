# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
moods = %w(happy joyful content silly sad angry scared worried confused surprised hurt embarrassed)
moods.each do |mood|
    puts "creating #{mood}"
    Mood.create(name: mood)
end

require 'faker'

require "open-uri"
require "json"

puts "Deleting all questions, activities, lessons, journeys and users"
DailyMood.delete_all
Mood.delete_all
Response.delete_all
Question.delete_all
Activity.delete_all
Video.delete_all
JourneyLesson.delete_all
Lesson.delete_all
Journey.delete_all
User.delete_all

puts "Creating resilience index"

lesson1 = Lesson.new(
  name: "Resilience Index",
  description:"Learn how your habits and mindset are impacting your ability to bounce back  in tough times.",
  author: "Martin Selligman",
  topic: "Resilience",
  time_to_complete: "10 mins",
)
lesson1.save!
video1 = Video.new(
  name: "Intro to resilience",
  description: "An Introduction to resilience",
  time_to_complete: "2 min",
  xp: 15
)
video1.lesson = lesson1
video1.save!
activity1 = Activity.new(
  name: "Resilience index",
  description: "Learn how your habits and mindset are impacting your ability to bounce back  in tough times.",
  xp: 50,
  time_to_complete: "10 mins"
)
activity1.lesson = lesson1
activity1.save!
questions = ["How often did you feel tired out for no good reason?", "How often excited to tackle your school work?", "How often did you feel so nervous that nothing could calm you down?", "How often do you feel like you cant achieve your goals?", "How often do you feel like you its not your fault when you fail?", "How often do you feel like you have slept well?", "How often did you feel that you can cheer yourself up?", "How often did you feel your cool under-pressure", "How many hours sleep should you get a night?", "How many hours sleep  do you think you get a night?"]
questions.each do |question|
  question1 = Question.new(question: question)
  question1.save!
end

puts "creating 5 sleep lessons"

lesson2 = Lesson.new(
  name: "Why sleep is important",
  description:"Why should you care about how you sleep? Learn how sleep affects your daily life in this lesson.",
  author: "Matthew Walker",
  topic: "Sleep",
  time_to_complete: "25 mins"
)
lesson2.save!
video2 = Video.new(
  name: "How sleep affects you",
  description: "Video about the effects of sleep on happiness and resilience",
  time_to_complete: "8 mins",
  xp: 30
)
video2.lesson = lesson2
video2.save!
activity2 = Activity.new(
  name: "Reflecting on your sleep",
  description: "Reflect on how your sleep impacts your day",
  xp: 15,
  time_to_complete: "5 mins"
)
activity2.lesson = lesson2
activity2.save!
activity3 = Activity.new(
  name: "Quiz",
  description: "Do you remember what you just learnt?",
  xp: 50,
  time_to_complete: "10 mins"
)
activity3.lesson = lesson2
activity3.save!
questions2 = ["How much sleep a night does a 16 year old need?","Do teenagers need more sleep than adults?", "Select the impacts of great sleep that are true."]
questions.each do |question|
  question2 = Question.new(question: question)
  question2.save!
end
activity4 = Activity.new(
  name: "Quiz",
  description: "Do you remember what you just learnt?",
  xp: 50,
  time_to_complete: "10 mins"
)
activity4.lesson = lesson2
activity4.save!




lesson3 = Lesson.new(
  name: "How to build a habit",
  description:"Learn the science behind making habits stick.",
  author: "Charles Duhigg",
  topic: "Sleep",
  time_to_complete: "25 mins"
)
lesson3.save!

lesson4 =Lesson.new(
  name: "The science of good sleep",
  description:"Learn how science can help you sleep better.",
  author: "Matthew Walker",
  topic: "Sleep",
  time_to_complete: "45 mins"
)
lesson4.save!

lesson5 =Lesson.new(
  name: "Technology and sleep",
  description:"How your phone and laptop are sabotaging your sleep.",
  author: "Matthew Walker",
  topic: "Sleep",
  time_to_complete: "20 mins"
)
lesson5.save!

lesson6 =Lesson.new(
  name: "12 tips for healthy sleep",
  description:"Lets pull everything we've learnt together into 12 key tips.",
  author: "Matthew Walker",
  topic: "Sleep",
  time_to_complete: "30 mins"
)
lesson6.save!

puts "#{Lesson.count} lessons created"

puts "Creating 3 managing anxiety lessons"

lesson7 =Lesson.new(
  name: "Anxiety and your nervous system",
  description:"What does anxiety do to your body? Learn about the effects.",
  author: "Albert Bandura",
  topic: "Managing anxiety",
  time_to_complete: "45 mins"
)
lesson7.save!

lesson8 =Lesson.new(
  name: "Exam Nerves",
  description:"How to stop exam nerves.",
  author: "Albert Bandura",
  topic: "Managing anxiety",
  time_to_complete: "20 mins"
)
lesson8.save!

lesson9 =Lesson.new(
  name: "Window of Tolerance",
  description:"What to do when your feeling anxious. Learn how the window of tolerance can help.",
  author: "Albert Bandura",
  topic: "Managing anxiety",
  time_to_complete: "35 mins"
)
lesson9.save!

puts "We now have #{Lesson.count} lessons created"

puts "Creating 3 dealing with failure lessons"

lesson7 =Lesson.new(
  name: "Why failure can be good",
  description:"Failure is often a good thing. Learn why.",
  author: "Samantha Green",
  topic: "Dealing with failure",
  time_to_complete: "15 mins"
)
lesson7.save!

lesson8 =Lesson.new(
  name: "Picking yourself back-up",
  description:"Sometimes when you fall what matters is how you respond.",
  author: "Samantha Green",
  topic: "Dealing with failure",
  time_to_complete: "25 mins"
)
lesson8.save!

lesson9 =Lesson.new(
  name: "Resilience and failure",
  description:"Learn about the link between failure and resilience. How can you use failure to your advantage?",
  author: "Samantha Green",
  topic: "Dealing with failure",
  time_to_complete: "35 mins"
)
lesson9.save!

puts "We now have #{Lesson.count} lessons created"

# api_call = Unsplash::Photo.search('headshot', page = 1, per_page = 30)
# api_call.each do |photo|
#   headshots << photo.urls.regular
# end
# counter1 = 0

puts "creating 30 users"

30.times do
  user = User.new(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,    
    year_level: 10,
    school_name: "Cherrybrook High School",
    school_class: "Year 10 C",
    xp: 0,
    teacher: false,
    email: Faker::Internet.free_email,
    password: "123456"
  )
#   file1 = URI.open(headshots[counter1])
#   counter1 += 1
#   user.photo.attach(io: file1, filename: 'nes.png', content_type: 'image/png')
  user.save!
  puts "saved #{user.first_name}"
  journey = Journey.new(
    user_id: user.id,
    name: "#{user.first_name}'s journey"
  )
  journey.save!
  puts "created #{journey.name}"
  journeylesson1 = JourneyLesson.new(
      journey_id: journey.id,
      lesson_id: lesson1.id
  )
  journeylesson1.save!
  journeylesson2 = JourneyLesson.new(
      journey_id: journey.id,
      lesson_id: lesson2.id
  )
  journeylesson2.save!
  journeylesson3 = JourneyLesson.new(
      journey_id: journey.id,
      lesson_id: lesson3.id
  )
  journeylesson3.save!
  journeylesson4 = JourneyLesson.new(
      journey_id: journey.id,
      lesson_id: lesson4.id
  )
  journeylesson4.save!
  journeylesson5 = JourneyLesson.new(
      journey_id: journey.id,
      lesson_id: lesson5.id
  )
  journeylesson5.save!
  journeylesson6 = JourneyLesson.new(
      journey_id: journey.id,
      lesson_id: lesson6.id
  )
  journeylesson6.save!
  journeylesson7 = JourneyLesson.new(
      journey_id: journey.id,
      lesson_id: lesson7.id
  )
  journeylesson7.save!
  journeylesson8 = JourneyLesson.new(
      journey_id: journey.id,
      lesson_id: lesson8.id
  )
  journeylesson8.save!
  journeylesson9 = JourneyLesson.new(
      journey_id: journey.id,
      lesson_id: lesson9.id
  )
  journeylesson9.save!
end