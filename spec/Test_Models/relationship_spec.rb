describe 'Users' do

  user1 = User.create!(name: 'David Uli',
                       email: 'mail@daviduli.com',
                       handle: '#NorCalDavid',
                       password_hash: ["password_hash", "$2a$10$9dNZbib6VQTXA7xPvoewMOnwHpPZer0ZnSxDQqcKdJx1sk6Pz.gA."])

  user2 = User.create!(name: 'James Bomotti',
                       email: 'test@thisserver.com',
                       handle: '#JBomotti',
                       password_hash: ["password_hash", "$2a$10$S0fnTfu3cLc1G7V5dMI/8uAzeLnxM5I5diiKT4T3EUMnAKpUcJICK"])

  describe "Follow / Unfollow Users" do

    it "New user should not follow any user" do
      expect(user1.followers).to be_nil
      expect(user2.followers).to be_nil
    end
####################################################################################
    it "Should allow one user to start following another user" do
      user1.follow(user2)
      expect(user2.followers).to include(user1)
    end
####################################################################################
    it "Should check to see if one user is following another user" do
      expect(user1.following?(user2)).to be_truthy
    end
####################################################################################
    it "Should allow one user to unfollow another user" do
      user1.unfollow(user2)
      expect(user2.followers).not_to include(user1)
    end
  end
end

describe "Relationships" do

  @relationship = Relationship.new(follower_id: 1, followed_id: 2)

  it "Should be Valid" do
    expect(@relationship).to be_valid
  end
####################################################################################
  it "Should require a follower_id" do
    @relationship.follower_id = nil
    expect(@relationship).not_to be_valid
  end
####################################################################################
  it "Should require a followed_id" do
    @relationship.followed_id = nil
    expect(@relationship).not_to be_valid
  end
end
