require 'rails_helper'

RSpec.describe Cat, type: :model do
 it "should validate name" do
    cat = Cat.create(age: 4, enjoys: 'Hiding under the bed', image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR7OLZBC9oeEXzls8Nsm8N7xge0jlfqlpHRoQ&usqp=CAU')
    expect(cat.errors[:name]).to_not be_empty
  end

  it "should validate age" do
  cat = Cat.create(name: 'Princess Peach', enjoys: 'Hiding under the bed', image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR7OLZBC9oeEXzls8Nsm8N7xge0jlfqlpHRoQ&usqp=CAU')
  expect(cat.errors[:age]).to_not be_empty
  end

  it "should validate enjoys" do
    cat = Cat.create(name: 'Princess Peach', age: 3, image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR7OLZBC9oeEXzls8Nsm8N7xge0jlfqlpHRoQ&usqp=CAU')
    expect(cat.errors[:enjoys]).to_not be_empty
  end

  it "should validate enjoys length" do
  cat = Cat.create(name: 'Princess Peach', age: 4, enjoys: 'Hiding', image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR7OLZBC9oeEXzls8Nsm8N7xge0jlfqlpHRoQ&usqp=CAU')
  expect(cat.errors[:enjoys]).to_not be_empty
  end

  it "should validate image" do
    cat = Cat.create(name: 'Princess Peach', age: 4, enjoys: 'Hiding under the bed')
    expect(cat.errors[:image]).to_not be_empty
  end
end
