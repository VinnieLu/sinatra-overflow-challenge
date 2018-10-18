require 'faker'


users = 5.times do

  User.create( :first_name => Faker::Name.first_name,
            :last_name => Faker::Name.last_name,
            :email => Faker::Internet.email,
            :password => 'password')
end

questions = 10.times do

  Question.create( :question => Faker::HarryPotter.quote,
                :user_id => rand(1..5) )

end

questioncomments = 5.times do
  QuestionComment.create(  :comment => Faker::Lorem.sentences,
                        :user_id => rand(1..5),
                        :question_id => rand(1..10) )
end

answers = 15.times do
  Answer.create(   :answer => Faker::Lorem.paragraph,
                :user_id => rand(1..5),
                :question_id => rand(1..10) )
end

answercomments = 5.times do
  AnswerComment.create(  :comment => Faker::Lorem.sentences,
                      :user_id => rand(1..5),
                      :answer_id => rand(15) )
end

questionvotes = rand(10..50).times do
  QuestionVote.create( :question_id => rand(1..10),
                    :user_id => rand(1..5),
                    :up => 1,
                    :down => nil)
end

questionvotes = rand(10..50).times do
  QuestionVote.create( :question_id => rand(1..10),
                    :user_id => rand(1..5),
                    :up => nil,
                    :down => -1)
end

answervotes = rand(10..50).times do
  AnswerVote.create( :answer_id => rand(1..15),
                  :user_id => rand(1..5),
                  :up => 1,
                  :down => nil)
end

answervotes = rand(10..50).times do
  AnswerVote.create( :answer_id => rand(1..15),
                  :user_id => rand(1..5),
                  :up => nil,
                  :down => -1)
end






# require 'faker'

# User.delete_all
# Channel.delete_all
# Subscription.delete_all

# users = 100.times.map do
#   User.create!( :first_name => Faker::Name.first_name,
#                 :last_name  => Faker::Name.last_name,
#                 :email      => Faker::Internet.email,
#                 :password   => 'password' )
# end

# channels = ["Telemundo", "Unimas ", "Azteca 13", "Mexiquense",
#  "ESPN", "Fox Sports", "NBC Sports", "Big Ten Network", "Nickelodeon"].map do |name|
#   Channel.create!(:name            => name,
#                   :callsign        => name[0..2].upcase,
#                   :price_per_month => Faker::Commerce.price)
# end

# users.each do |user|
#   user_channels = channels.sample(rand(2..4))
#   user_channels.each do |channel|
#     Subscription.create!(user: user,
#                          channel: channel)
#   end
# end
