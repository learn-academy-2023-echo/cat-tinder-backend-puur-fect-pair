class Cat < ApplicationRecord
    validates :name, :age, :enjoys, presence: true
    validates :enjoys, presence: true, length: { minimum: 10 }
end
