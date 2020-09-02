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
JourneyHabit.delete_all
Habit.delete_all
Lesson.delete_all
Journey.delete_all
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

moods = %w(😊 😃 😌 🙃 🙁 😡 😰 😯 🤒 🤕 🥱 😳)
mood_description = %w(joy happy content silly sad angry nervous shocked sick hurt guilty embarrased)
mood_counter = 0
moods.each do |mood|
    puts "creating #{mood}"
    Mood.create(name: mood, description: mood_description[mood_counter])
    mood_counter += 1
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
    xp: 15,
    video: "Footboys.mp4"
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
    possible_answers = ["Never", "Rarely", "Sometimes", "Often", "Always"]
      questions.each do |question|
      question = Question.new(question: question, possible_answers: possible_answers)
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
    xp: 30,
    video: "Footboys.mp4"
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
    possible_answers = [["12 hours", "7 hours", "9 hours", "5 hours"],["True", "False"], ["Easier to focus", "You live longer on average", "More resilient to negative life events", "You gain weight"]]

    questions3.each do |question|
      question = Question.new(question: question, correct_answer: correct_answers[counter3], possible_answers: possible_answers[counter3])
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
  author_photo: "CharlesDuhigg.jpg",
  author_description: "The author of The Power of habit. Charles knows what it takes to make a new habit stick!"
)
lesson3.save!

  video3 = Video.new(
    name: "Why habits matter",
    description: Faker::Quote.yoda,
    time_to_complete: "2 min",
    xp: 15,
    video: "Footboys.mp4"
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
    xp: 30,
    video: "Footboys.mp4"
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
    xp: 30,
    video: "Footboys.mp4"
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
    xp: 30,
    video: "Footboys.mp4"
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

video7 = Video.new(
    name: "Learn",
    description: Faker::Quote.yoda,
    time_to_complete: "10 mins",
    xp: 30,
    video: "Footboys.mp4"
  )
  video7.lesson = lesson7
  video7.save!

  activity14 = Activity.new(
    name: "Relection",
    description: Faker::Quote.yoda,
    xp: 15,
    time_to_complete: "10 mins"
  )
  activity14.lesson = lesson7
  activity14.save!

    questions14 = [Faker::Quote.yoda, Faker::Quote.yoda, Faker::Quote.yoda]
    questions14.each do |question|
      question = Question.new(question: question)
      question.activity = activity14
      question.save!
    end

  activity15 = Activity.new(
      name: "Quiz",
      description: Faker::Quote.yoda,
      xp: 15,
      time_to_complete: "10 mins"
    )
    activity15.lesson = lesson7
    activity15.save!

      questions15 = [Faker::Quote.yoda, Faker::Quote.yoda, Faker::Quote.yoda]
      questions15.each do |question|
        question = Question.new(question: question)
        question.activity = activity15
        question.save!
      end

  activity16 = Activity.new(
    name: "Key Takeaways",
    description: "What can you takeaway from today?",
    xp: 10,
    time_to_complete: "2 mins"
  )
  activity16.lesson = lesson7
  activity16.save!

    questions16 = ["What is your #1 takeaway?","What is your #2 takeaway?"]
    questions16.each do |question|
      question = Question.new(question: question)
      question.activity = activity16
      question.save!
    end


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

video7 = Video.new(
    name: "Learn",
    description: Faker::Quote.yoda,
    time_to_complete: "10 mins",
    xp: 30,
    video: "Footboys.mp4"
  )
  video7.lesson = lesson8
  video7.save!

  activity14 = Activity.new(
    name: "Relection",
    description: Faker::Quote.yoda,
    xp: 15,
    time_to_complete: "10 mins"
  )
  activity14.lesson = lesson8
  activity14.save!

    questions14 = [Faker::Quote.yoda, Faker::Quote.yoda, Faker::Quote.yoda]
    questions14.each do |question|
      question = Question.new(question: question)
      question.activity = activity14
      question.save!
    end

  activity15 = Activity.new(
      name: "Quiz",
      description: Faker::Quote.yoda,
      xp: 15,
      time_to_complete: "10 mins"
    )
    activity15.lesson = lesson8
    activity15.save!

      questions15 = [Faker::Quote.yoda, Faker::Quote.yoda, Faker::Quote.yoda]
      questions15.each do |question|
        question = Question.new(question: question)
        question.activity = activity15
        question.save!
      end

  activity16 = Activity.new(
    name: "Key Takeaways",
    description: "What can you takeaway from today?",
    xp: 10,
    time_to_complete: "2 mins"
  )
  activity16.lesson = lesson8
  activity16.save!

    questions16 = ["What is your #1 takeaway?","What is your #2 takeaway?"]
    questions16.each do |question|
      question = Question.new(question: question)
      question.activity = activity16
      question.save!
    end


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

video7 = Video.new(
    name: "Learn",
    description: Faker::Quote.yoda,
    time_to_complete: "10 mins",
    xp: 30,
    video: "Footboys.mp4"
  )
  video7.lesson = lesson9
  video7.save!

  activity14 = Activity.new(
    name: "Relection",
    description: Faker::Quote.yoda,
    xp: 15,
    time_to_complete: "10 mins"
  )
  activity14.lesson = lesson9
  activity14.save!

    questions14 = [Faker::Quote.yoda, Faker::Quote.yoda, Faker::Quote.yoda]
    questions14.each do |question|
      question = Question.new(question: question)
      question.activity = activity14
      question.save!
    end

  activity15 = Activity.new(
      name: "Quiz",
      description: Faker::Quote.yoda,
      xp: 15,
      time_to_complete: "10 mins"
    )
    activity15.lesson = lesson9
    activity15.save!

      questions15 = [Faker::Quote.yoda, Faker::Quote.yoda, Faker::Quote.yoda]
      questions15.each do |question|
        question = Question.new(question: question)
        question.activity = activity15
        question.save!
      end

  activity16 = Activity.new(
    name: "Key Takeaways",
    description: "What can you takeaway from today?",
    xp: 10,
    time_to_complete: "2 mins"
  )
  activity16.lesson = lesson9
  activity16.save!

    questions16 = ["What is your #1 takeaway?","What is your #2 takeaway?"]
    questions16.each do |question|
      question = Question.new(question: question)
      question.activity = activity16
      question.save!
    end

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

video7 = Video.new(
    name: "Learn",
    description: Faker::Quote.yoda,
    time_to_complete: "10 mins",
    xp: 30,
    video: "Footboys.mp4"
  )
  video7.lesson = lesson10
  video7.save!

  activity14 = Activity.new(
    name: "Relection",
    description: Faker::Quote.yoda,
    xp: 15,
    time_to_complete: "10 mins"
  )
  activity14.lesson = lesson10
  activity14.save!

    questions14 = [Faker::Quote.yoda, Faker::Quote.yoda, Faker::Quote.yoda]
    questions14.each do |question|
      question = Question.new(question: question)
      question.activity = activity14
      question.save!
    end

  activity15 = Activity.new(
      name: "Quiz",
      description: Faker::Quote.yoda,
      xp: 15,
      time_to_complete: "10 mins"
    )
    activity15.lesson = lesson10
    activity15.save!

      questions15 = [Faker::Quote.yoda, Faker::Quote.yoda, Faker::Quote.yoda]
      questions15.each do |question|
        question = Question.new(question: question)
        question.activity = activity15
        question.save!
      end

  activity16 = Activity.new(
    name: "Key Takeaways",
    description: "What can you takeaway from today?",
    xp: 10,
    time_to_complete: "2 mins"
  )
  activity16.lesson = lesson10
  activity16.save!

    questions16 = ["What is your #1 takeaway?","What is your #2 takeaway?"]
    questions16.each do |question|
      question = Question.new(question: question)
      question.activity = activity16
      question.save!
    end

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

video7 = Video.new(
    name: "Learn",
    description: Faker::Quote.yoda,
    time_to_complete: "10 mins",
    xp: 30,
    video: "Footboys.mp4"
  )
  video7.lesson = lesson11
  video7.save!

  activity14 = Activity.new(
    name: "Relection",
    description: Faker::Quote.yoda,
    xp: 15,
    time_to_complete: "10 mins"
  )
  activity14.lesson = lesson11
  activity14.save!

    questions14 = [Faker::Quote.yoda, Faker::Quote.yoda, Faker::Quote.yoda]
    questions14.each do |question|
      question = Question.new(question: question)
      question.activity = activity14
      question.save!
    end

  activity15 = Activity.new(
      name: "Quiz",
      description: Faker::Quote.yoda,
      xp: 15,
      time_to_complete: "10 mins"
    )
    activity15.lesson = lesson11
    activity15.save!

      questions15 = [Faker::Quote.yoda, Faker::Quote.yoda, Faker::Quote.yoda]
      questions15.each do |question|
        question = Question.new(question: question)
        question.activity = activity15
        question.save!
      end

  activity16 = Activity.new(
    name: "Key Takeaways",
    description: "What can you takeaway from today?",
    xp: 10,
    time_to_complete: "2 mins"
  )
  activity16.lesson = lesson11
  activity16.save!

    questions16 = ["What is your #1 takeaway?","What is your #2 takeaway?"]
    questions16.each do |question|
      question = Question.new(question: question)
      question.activity = activity16
      question.save!
    end

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

video7 = Video.new(
    name: "Learn",
    description: Faker::Quote.yoda,
    time_to_complete: "10 mins",
    xp: 30,
    video: "Footboys.mp4"
  )
  video7.lesson = lesson12
  video7.save!

  activity14 = Activity.new(
    name: "Relection",
    description: Faker::Quote.yoda,
    xp: 15,
    time_to_complete: "10 mins"
  )
  activity14.lesson = lesson12
  activity14.save!

    questions14 = [Faker::Quote.yoda, Faker::Quote.yoda, Faker::Quote.yoda]
    questions14.each do |question|
      question = Question.new(question: question)
      question.activity = activity14
      question.save!
    end

  activity15 = Activity.new(
      name: "Quiz",
      description: Faker::Quote.yoda,
      xp: 15,
      time_to_complete: "10 mins"
    )
    activity15.lesson = lesson12
    activity15.save!

      questions15 = [Faker::Quote.yoda, Faker::Quote.yoda, Faker::Quote.yoda]
      questions15.each do |question|
        question = Question.new(question: question)
        question.activity = activity15
        question.save!
      end

  activity16 = Activity.new(
    name: "Key Takeaways",
    description: "What can you takeaway from today?",
    xp: 10,
    time_to_complete: "2 mins"
  )
  activity16.lesson = lesson12
  activity16.save!

    questions16 = ["What is your #1 takeaway?","What is your #2 takeaway?"]
    questions16.each do |question|
      question = Question.new(question: question)
      question.activity = activity16
      question.save!
    end

puts "We now have #{Lesson.count} lessons created"

puts "Creating a habit"

habit = Habit.new(name: "Sleep", xp: 50)
  habit.save!
    habit_questions = ["Select the things you did yesterday", "How did you sleep?", "What time did you go to bed?", "What time did you wake up?", "How do you feel today?"]
    possible_answers = ["Coffee after 4pm", "Exercised late", "Ate after 8:30pm", "Phone in room"]

      habit_questions.each_with_index do |question, index|
        if index == 0
          question = Question.new(question: question, possible_answers: possible_answers)
          question.habit = habit
          question.save!
        else
          question = Question.new(question: question)
          question.habit = habit
          question.save!  
        end
      end


headshots = []
api_call = Unsplash::Photo.search('headshot', page = 1, per_page = 30)
api_call.each do |photo|
  headshots << photo.urls.regular
end
counter1 = 0

puts "creating 4 users"
first_names = ["Bill", "Lachlan", "Liam", "Stewart", "Ben"]
last_names = ["Bawden", "Oreo", "Barlow", "Glover", "Fanning"]
emails = ["wabawden@aol.com", "lachlan@hey.com", "liam@gmail.com", "stewart@gmail.com", "Ben@ben.com"]
counter = 0
5.times do
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

  journey_habit = JourneyHabit.new(
    journey_id: journey.id,
    habit_id: habit.id
  )

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
puts "creating tools"

tools = ["Meditation", "Sleep Sounds", "CBT Therapy", "Noting", "Exam Planner", "Calm Counter", "Sleep Tracker", "Hydration monitor", "Yoga", "Stories" ]
tools.each do |tool|
  toolobject = Tool.new(
    name: tool,
    photo: "mailbox.svg"
  )
toolobject.save!
end

puts "Creating Mr Gilbert...."
teacher = User.new(email:"mrgilbert@rudgepark.com", password:"123456", teacher:true, first_name:"Phil", last_name:"Gilbert", school_name:"Rudge Park School", school_class:"Year 10 C")
teacher.save

puts "generating fake badge activity.............."

badge = Badge.all.sample
user = User.where(teacher: false).sample
badgeuser = BadgeUser.create(user:user, badge:badge)
badgeuser.created_at = "Mon, 24 Aug 2020 13:03:49 UTC +00:00"
badgeuser.save

badge = Badge.all.sample
user = User.where(teacher: false).sample
badgeuser = BadgeUser.create(user:user, badge:badge)
badgeuser.created_at = "Tue, 25 Aug 2020 13:03:49 UTC +00:00"
badgeuser.save

badge = Badge.all.sample
user = User.where(teacher: false).sample
badgeuser = BadgeUser.create(user:user, badge:badge)
badgeuser.created_at = "Wed, 26 Aug 2020 13:03:49 UTC +00:00"
badgeuser.save

badge = Badge.all.sample
user = User.where(teacher: false).sample
badgeuser = BadgeUser.create(user:user, badge:badge)
badgeuser.created_at = "Thu, 27 Aug 2020 13:03:49 UTC +00:00"
badgeuser.save

badge = Badge.all.sample
user = User.where(teacher: false).sample
badgeuser = BadgeUser.create(user:user, badge:badge)
badgeuser.created_at = "Fri, 28 Aug 2020 13:03:49 UTC +00:00"
badgeuser.save

badge = Badge.all.sample
user = User.where(teacher: false).sample
badgeuser = BadgeUser.create(user:user, badge:badge)
badgeuser.created_at = "Sat, 29 Aug 2020 13:03:49 UTC +00:00"
badgeuser.save

puts "generating fake mood activity.............."

mood = Mood.all.sample
user = User.where(teacher: false).sample
dailymood = DailyMood.create(user:user, mood:mood)
dailymood.created_at = "Mon, 24 Aug 2020 13:03:49 UTC +00:00"
dailymood.save

mood = Mood.all.sample
user = User.where(teacher: false).sample
dailymood = DailyMood.create(user:user, mood:mood)
dailymood.created_at = "Tue, 25 Aug 2020 13:03:49 UTC +00:00"
dailymood.save

mood = Mood.all.sample
user = User.where(teacher: false).sample
dailymood = DailyMood.create(user:user, mood:mood)
dailymood.created_at = "Wed, 26 Aug 2020 13:03:49 UTC +00:00"
dailymood.save

mood = Mood.all.sample
user = User.where(teacher: false).sample
dailymood = DailyMood.create(user:user, mood:mood)
dailymood.created_at = "Thu, 27 Aug 2020 13:03:49 UTC +00:00"
dailymood.save

mood = Mood.all.sample
user = User.where(teacher: false).sample
dailymood = DailyMood.create(user:user, mood:mood)
dailymood.created_at = "Fri, 28 Aug 2020 13:03:49 UTC +00:00"
dailymood.save

mood = Mood.all.sample
user = User.where(teacher: false).sample
dailymood = DailyMood.create(user:user, mood:mood)
dailymood.created_at = "Sat, 29 Aug 2020 13:03:49 UTC +00:00"
dailymood.save

puts "generating fake habit activity.............."

habit = Habit.first
user = User.where(teacher: false).sample
journey = user.journeys.first
journeyhabit = JourneyHabit.create(journey:journey, habit:habit)
journeyhabit.created_at = "Mon, 24 Aug 2020 13:03:49 UTC +00:00"
journeyhabit.save

habit = Habit.first
user = User.where(teacher: false).sample
journey = user.journeys.first
journeyhabit = JourneyHabit.create(journey:journey, habit:habit)
journeyhabit.created_at = "Tue, 25 Aug 2020 13:03:49 UTC +00:00"
journeyhabit.save

habit = Habit.first
user = User.where(teacher: false).sample
journey = user.journeys.first
journeyhabit = JourneyHabit.create(journey:journey, habit:habit)
journeyhabit.created_at = "Wed, 26 Aug 2020 13:03:49 UTC +00:00"
journeyhabit.save

habit = Habit.first
user = User.where(teacher: false).sample
journey = user.journeys.first
journeyhabit = JourneyHabit.create(journey:journey, habit:habit)
journeyhabit.created_at = "Thu, 27 Aug 2020 13:03:49 UTC +00:00"
journeyhabit.save

habit = Habit.first
user = User.where(teacher: false).sample
journey = user.journeys.first
journeyhabit = JourneyHabit.create(journey:journey, habit:habit)
journeyhabit.created_at = "Fri, 28 Aug 2020 13:03:49 UTC +00:00"
journeyhabit.save

habit = Habit.first
user = User.where(teacher: false).sample
journey = user.journeys.first
journeyhabit = JourneyHabit.create(journey:journey, habit:habit)
journeyhabit.created_at = "Sat, 29 Aug 2020 13:03:49 UTC +00:00"
journeyhabit.save

