# typed: false
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


def create_user_posts(user)
  5.times do
    title = ::Faker::Lorem.sentence(word_count: 2)
    body = ::Faker::Lorem.paragraph(sentence_count: 30, random_sentences_to_add: 20)

    user.posts.create(title: title, body: body)
  end
end

def create_users
  5.times do
    name = ::Faker::Name.name
    email = ::Faker::Internet.email

    user = User.create(name: name, email: email)

    create_user_posts(user)
  end
end

def create_polls
  5.times do
    poll = Poll.create(question: ::Faker::Lorem.question(word_count: 3), user: User.all.sample)
    4.times do
      poll.choices.create(choice_text: ::Faker::Lorem.sentence(word_count: 3))
    end
    25.times do
      poll.choices.sample.votes.create(user: User.all.sample)
    end
  end
end

create_users
create_polls
