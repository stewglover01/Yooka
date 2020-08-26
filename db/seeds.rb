# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# moods = %w(happy joyful content silly sad angry scared worried confused surprised hurt embarrassed)
# moods.each do |mood|
#     puts "creating #{mood}"
#     Mood.create(name: mood)
# end

require 'faker'
require "open-uri"
require "json"

puts "Deleting everything!!!"
DailyMood.delete_all
Mood.delete_all
Response.delete_all
Question.delete_all
Activity.delete_all
Video.delete_all
JourneyLesson.delete_all
Lesson.delete_all
Journey.delete_all
DailyMood.delete_all
Mood.delete_all
BadgeUser.delete_all
Badge.delete_all
User.delete_all


badges = ['hot streak', 'mentor', 'stress buster', 'mindfulness guru', 'sleep master', 'habit former']
badges.each do|badge|
    puts "creating #{badge} badge"
    Badge.create(name: badge, image_url: "/assets/images/badges/#{badge}.png")
end

puts "creating moods"

moods = %w(happy joyful content silly sad angry scared worried confused surprised hurt embarrassed)
moods.each do |mood|
    puts "creating #{mood}"
    Mood.create(name: mood)
end

puts "Creating resilience index"

lesson1 = Lesson.new(
  name: "Resilience Index",
  description:"Learn how your habits and mindset are impacting your ability to bounce back  in tough times.",
  author: "Martin Selligman",
  topic: "Resilience",
  time_to_complete: "10 mins",
  photo: "mailbox.svg",
  author_photo: "MartinSelligman.jpg",
  author_description: "Commonly known as the founder of Positive Psychology, Martin Seligman is a leading authority in the fields of Positive Psychology, resilience, learned helplessness, depression, optimism and pessimism."
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
      question = Question.new(question: question)
      question.activity = activity1
      question.save!
    end

puts "creating 5 sleep lessons"

lesson2 = Lesson.new(
  name: "Why sleep is important",
  description:"Why should you care about how you sleep? Learn how sleep affects your daily life in this lesson.",
  author: "Matthew Walker",
  topic: "Sleep",
  time_to_complete: "25 mins",
  photo: "mailbox.svg",
  author_photo: "MatthewWalker.jpg",
  author_description: "Author of 'Why We Sleep'. Matthew is seen as the world expert on sleeps effects on the brain"
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

    questions2 = ["When you haven't sleep well the night before, how do you feel?"," If your sleep was 50% better, how do you think that would affect your life?", "What could you do to improve your sleep?"]
    questions2.each do |question|
      question = Question.new(question: question)
      question.activity = activity2
      question.save!
    end

  activity3 = Activity.new(
    name: "Quiz",
    description: "Do you remember what you just learnt?",
    xp: 50,
    time_to_complete: "10 mins"
  )
  activity3.lesson = lesson2
  activity3.save!

    counter3 = 0
    questions3 = ["How much sleep a night does a 16 year old need?","Do teenagers need more sleep than adults?", "Select the impacts of great sleep that are true."]
    correct_answers = ["9 hours", "True", "You gain weight"]
    questions3.each do |question|
      question = Question.new(question: question, correct_answer: correct_answers[counter3])
      question.activity = activity3
      question.save!
      counter3 +=1
    end


  activity4 = Activity.new(
    name: "Key Takeaways",
    description: "What can you takeaway from today?",
    xp: 10,
    time_to_complete: "2 mins"
  )
  activity4.lesson = lesson2
  activity4.save!

    questions4 = ["What is your #1 takeaway?","What is your #2 takeaway?"]
    questions4.each do |question|
      question = Question.new(question: question)
      question.activity = activity4
      question.save!
    end


lesson3 = Lesson.new(
  name: "How to build a habit",
  description:"Learn the science behind making habits stick.",
  author: "Charles Duhigg",
  topic: "Sleep",
  time_to_complete: "25 mins",
  photo: "mailbox.svg",
  author_photo: "MatthewWalker.jpg",
  author_description: "Author of 'Why We Sleep'. Matthew is seen as the world expert on sleeps effects on the brain"
)
lesson3.save!

  video3 = Video.new(
    name: "Why habits matter",
    description: Faker::Quote.yoda,
    time_to_complete: "2 min",
    xp: 15
  )
  video3.lesson = lesson3
  video3.save!

  activity5 = Activity.new(
    name: "Reflecting on your habits",
    description: Faker::Quote.yoda,
    xp: 15,
    time_to_complete: "2 mins"
  )
  activity5.lesson = lesson3
  activity5.save!

    questions5 = [Faker::Quote.yoda,Faker::Quote.yoda,Faker::Quote.yoda]
    questions5.each do |question|
      question = Question.new(question: question)
      question.activity = activity5
      question.save!
    end

  activity6 = Activity.new(
    name: "Setup your habit",
    description: Faker::Quote.yoda,
    xp: 15,
    time_to_complete: "2 mins"
  )
  activity6.lesson = lesson3
  activity6.save!

    questions6 = ["What time would you like to be notified", "How will you remind yourself to log your sleep?"]
    questions6.each do |question|
      question = Question.new(question: question)
      question.activity = activity6
      question.save!
    end


lesson4 =Lesson.new(
  name: "The science of good sleep",
  description:"Learn how science can help you sleep better.",
  author: "Matthew Walker",
  topic: "Sleep",
  time_to_complete: "45 mins",
  photo: "mailbox.svg",
  author_photo: "MatthewWalker.jpg",
  author_description: "Author of 'Why We Sleep'. Matthew is seen as the world expert on sleeps effects on the brain"
)
lesson4.save!

video4 = Video.new(
    name: "Learn",
    description: Faker::Quote.yoda,
    time_to_complete: "10 mins",
    xp: 30
  )
  video4.lesson = lesson4
  video4.save!

  activity7 = Activity.new(
    name: "Relection",
    description: Faker::Quote.yoda,
    xp: 15,
    time_to_complete: "10 mins"
  )
  activity7.lesson = lesson4
  activity7.save!

    questions7 = [Faker::Quote.yoda, Faker::Quote.yoda, Faker::Quote.yoda]
    questions7.each do |question|
      question = Question.new(question: question)
      question.activity = activity7
      question.save!
    end

  activity8 = Activity.new(
      name: "Quiz",
      description: Faker::Quote.yoda,
      xp: 15,
      time_to_complete: "10 mins"
    )
    activity8.lesson = lesson4
    activity8.save!

      questions8 = [Faker::Quote.yoda, Faker::Quote.yoda, Faker::Quote.yoda]
      questions8.each do |question|
        question = Question.new(question: question)
        question.activity = activity8
        question.save!
      end

  activity9 = Activity.new(
    name: "Key Takeaways",
    description: "What can you takeaway from today?",
    xp: 10,
    time_to_complete: "2 mins"
  )
  activity9.lesson = lesson4
  activity9.save!

    questions9 = ["What is your #1 takeaway?","What is your #2 takeaway?"]
    questions9.each do |question|
      question = Question.new(question: question)
      question.activity = activity9
      question.save!
    end

lesson5 =Lesson.new(
  name: "Technology and sleep",
  description:"How your phone and laptop are sabotaging your sleep.",
  author: "Matthew Walker",
  topic: "Sleep",
  time_to_complete: "20 mins",
  photo: "mailbox.svg",
  author_photo: "MatthewWalker.jpg",
  author_description: "Author of 'Why We Sleep'. Matthew is seen as the world expert on sleeps effects on the brain"
)
lesson5.save!

video5 = Video.new(
    name: "Learn",
    description: Faker::Quote.yoda,
    time_to_complete: "10 mins",
    xp: 30
  )
  video5.lesson = lesson5
  video5.save!

  activity10 = Activity.new(
    name: "Relection",
    description: Faker::Quote.yoda,
    xp: 15,
    time_to_complete: "10 mins"
  )
  activity10.lesson = lesson5
  activity10.save!

    questions10 = [Faker::Quote.yoda, Faker::Quote.yoda, Faker::Quote.yoda]
    questions10.each do |question|
      question = Question.new(question: question)
      question.activity = activity10
      question.save!
    end

  activity11 = Activity.new(
      name: "Quiz",
      description: Faker::Quote.yoda,
      xp: 15,
      time_to_complete: "10 mins"
    )
    activity11.lesson = lesson5
    activity11.save!

      questions11 = [Faker::Quote.yoda, Faker::Quote.yoda, Faker::Quote.yoda]
      questions11.each do |question|
        question = Question.new(question: question)
        question.activity = activity11
        question.save!
      end

  activity12 = Activity.new(
    name: "Key Takeaways",
    description: "What can you takeaway from today?",
    xp: 10,
    time_to_complete: "2 mins"
  )
  activity12.lesson = lesson5
  activity12.save!

    questions12 = ["What is your #1 takeaway?","What is your #2 takeaway?"]
    questions12.each do |question|
      question = Question.new(question: question)
      question.activity = activity12
      question.save!
    end

lesson6 =Lesson.new(
  name: "12 tips for healthy sleep",
  description:"Lets pull everything we've learnt together into 12 key tips.",
  author: "Matthew Walker",
  topic: "Sleep",
  time_to_complete: "30 mins",
  photo: "mailbox.svg",
  author_photo: "MatthewWalker.jpg",
  author_description: "Author of 'Why We Sleep'. Matthew is seen as the world expert on sleeps effects on the brain"
)
lesson6.save!

video6 = Video.new(
    name: "Learn",
    description: Faker::Quote.yoda,
    time_to_complete: "10 mins",
    xp: 30
  )
  video6.lesson = lesson6
  video6.save!

  activity13 = Activity.new(
    name: "Relection",
    description: Faker::Quote.yoda,
    xp: 15,
    time_to_complete: "10 mins"
  )
  activity13.lesson = lesson6
  activity13.save!

    questions13 = [Faker::Quote.yoda, Faker::Quote.yoda, Faker::Quote.yoda]
    questions13.each do |question|
      question = Question.new(question: question)
      question.activity = activity13
      question.save!
    end

  activity14 = Activity.new(
      name: "Quiz",
      description: Faker::Quote.yoda,
      xp: 15,
      time_to_complete: "10 mins"
    )
    activity14.lesson = lesson6
    activity14.save!

      questions14 = [Faker::Quote.yoda, Faker::Quote.yoda, Faker::Quote.yoda]
      questions14.each do |question|
        question = Question.new(question: question)
        question.activity = activity14
        question.save!
      end

  activity15 = Activity.new(
    name: "Key Takeaways",
    description: "What can you takeaway from today?",
    xp: 10,
    time_to_complete: "2 mins"
  )
  activity15.lesson = lesson6
  activity15.save!

    questions15 = ["What is your #1 takeaway?","What is your #2 takeaway?"]
    questions15.each do |question|
      question = Question.new(question: question)
      question.activity = activity15
      question.save!
    end

puts "#{Lesson.count} lessons created"

puts "Creating 3 managing anxiety lessons"

lesson7 =Lesson.new(
  name: "Anxiety and your nervous system",
  description:"What does anxiety do to your body? Learn about the effects.",
  author: "Albert Bandura",
  topic: "Managing anxiety",
  time_to_complete: "45 mins",
  photo: "mailbox.svg",
  author_description: "Albert is the world expert on managing anxiety. After suffering from crippling anxiety at school he went on to study at Harvard and winning an Olympic gold medal.",
  author_photo: "AlbertBandura.jpg"
)
lesson7.save!

lesson8 =Lesson.new(
  name: "Exam Nerves",
  description:"How to stop exam nerves.",
  author: "Albert Bandura",
  topic: "Managing anxiety",
  time_to_complete: "20 mins",
  photo: "mailbox.svg",
  author_description: "Albert is the world expert on managing anxiety. After suffering from crippling anxiety at school he went on to study at Harvard and winning an Olympic gold medal.",
  author_photo: "AlbertBandura.jpg"
)
lesson8.save!

lesson9 =Lesson.new(
  name: "Window of Tolerance",
  description:"What to do when your feeling anxious. Learn how the window of tolerance can help.",
  author: "Albert Bandura",
  topic: "Managing anxiety",
  time_to_complete: "35 mins",
  photo: "mailbox.svg",
  author_description: "Albert is the world expert on managing anxiety. After suffering from crippling anxiety at school he went on to study at Harvard and winning an Olympic gold medal.",
  author_photo: "AlbertBandura.jpg"
)
lesson9.save!

puts "We now have #{Lesson.count} lessons created"

puts "Creating 3 dealing with failure lessons"

lesson10 =Lesson.new(
  name: "Why failure can be good",
  description:"Failure is often a good thing. Learn why.",
  author: "Samantha Green",
  topic: "Dealing with failure",
  time_to_complete: "15 mins",
  photo: "mailbox.svg",
  author_description: "Samantha is the CEO and recently launched the Beating Failure Partnership with Oxford University.",
  author_photo: "SamanthaGreen.jpg"
)
lesson10.save!

lesson11 =Lesson.new(
  name: "Picking yourself back-up",
  description:"Sometimes when you fall what matters is how you respond.",
  author: "Samantha Green",
  topic: "Dealing with failure",
  time_to_complete: "25 mins",
  photo: "mailbox.svg",
  author_description: "Samantha is the CEO and recently launched the Beating Failure Partnership with Oxford University.",
  author_photo: "SamanthaGreen.jpg"
)
lesson11.save!

lesson12 =Lesson.new(
  name: "Resilience and failure",
  description:"Learn about the link between failure and resilience. How can you use failure to your advantage?",
  author: "Samantha Green",
  topic: "Dealing with failure",
  time_to_complete: "35 mins",
  photo: "mailbox.svg",
  author_description: "Samantha is the CEO and recently launched the Beating Failure Partnership with Oxford University.",
  author_photo: "SamanthaGreen.jpg"
)
lesson12.save!

puts "We now have #{Lesson.count} lessons created"

headshots = []
api_call = Unsplash::Photo.search('headshot', page = 1, per_page = 30)
api_call.each do |photo|
  headshots << photo.urls.regular
end
counter1 = 0

puts "creating 4 users"
first_names = ["Bill", "Lachlan", "Liam", "Stewart"]
last_names = ["Bawden", "Oreo", "Barlow", "Glover"]
emails = ["wabawden@aol.com", "lachlan@hey.com", "liam@gmail.com", "stewart@gmail.com"]
counter = 0
4.times do
  user = User.new(
    first_name: first_names[counter],
    last_name: last_names[counter],    
    year_level: 10,
    school_name: "Cherrybrook High School",
    school_class: "Year 10 C",
    xp: counter,
    teacher: false,
    email: emails[counter],
    password: "123456"
  )
  counter += 1
  file1 = URI.open(headshots[counter1])
  counter1 += 1
  user.photo.attach(io: file1, filename: 'nes.png', content_type: 'image/png')

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

    journeylesson10 = JourneyLesson.new(
      journey_id: journey.id,
      lesson_id: lesson10.id
  )
  journeylesson10.save!
  journeylesson11 = JourneyLesson.new(
      journey_id: journey.id,
      lesson_id: lesson11.id
  )
  journeylesson11.save!
  journeylesson12 = JourneyLesson.new(
      journey_id: journey.id,
      lesson_id: lesson12.id
  )
  journeylesson12.save!
end
