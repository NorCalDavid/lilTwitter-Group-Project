# david = User.create(name: 'David Uli', email: 'mail@daviduli.com', handle: '#NorCalDavid', password_hash: ["password_hash", "$2a$10$9dNZbib6VQTXA7xPvoewMOnwHpPZer0ZnSxDQqcKdJx1sk6Pz.gA."])

# james = User.create(name: 'James Bomotti', email: 'test@thisserver.com', handle: '#JBomotti', password_hash: ["password_hash", "$2a$10$S0fnTfu3cLc1G7V5dMI/8uAzeLnxM5I5diiKT4T3EUMnAKpUcJICK"])

# Tweet.create( message: 'lilTwitter Rocks!', user_id: 2 )

# 10.times do
#   Tweet.create( message: Faker::Lorem.characters(rand(105)+25), user_id: rand(2)+1 )
# end

# Users
users = []

User.create!(name: 'David Uli',
             email: 'mail@daviduli.com',
             handle: '#NorCalDavid',
             password_hash: ["password_hash", "$2a$10$9dNZbib6VQTXA7xPvoewMOnwHpPZer0ZnSxDQqcKdJx1sk6Pz.gA."])

User.create!(name: 'James Bomotti',
             email: 'test@thisserver.com',
             handle: '#JBomotti',
             password_hash: ["password_hash", "$2a$10$S0fnTfu3cLc1G7V5dMI/8uAzeLnxM5I5diiKT4T3EUMnAKpUcJICK"])

# Tweets

5.times do
  content = Tweet.create( message: Faker::Lorem.characters(rand(105)+25), user_id: rand(2)+1 )
end

# Following relationships
# COMMENTED OUT FOR NOW TO TEST SITE - Ben and Brenda
# users = User.all
# user  = users.first
# following = users[0]
# followers = users[1]
# following.each { |followed| user.follow(followed) }
# followers.each { |follower| follower.follow(user) }

