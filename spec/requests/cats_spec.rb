require 'rails_helper'

RSpec.describe "Cats", type: :request do
  describe "GET /index" do
    it "gets a list of cats" do
      Cat.create(
        {
    name: 'Pamela',
    age: 2,
    enjoys: 'Hissing at dogs, pate with extra gravy, and catnip.',
    image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSy7jz1nplDstOjFlgq8_s-GV9OiqgFeWP90g&usqp=CAU'
        }
      )
      # request to endpoint
      get '/cats'
      # specify the date we want as JSON
      cat = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(cat.length).to eq 1
    end
  end

  describe "Post /create" do
    it "creates a cat" do
      cat_params = {
       cat:   {
        name: 'Pamela',
        age: 2,
        enjoys: 'Hissing at dogs, pate with extra gravy, and catnip.',
        image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSy7jz1nplDstOjFlgq8_s-GV9OiqgFeWP90g&usqp=CAU'
        }
      }
      post '/cats', params: cat_params
      expect(response).to have_http_status(200)
      cat = Cat.first
      expect(cat.name).to eq 'Pamela' 
    end
  end

  describe "PATCH /update" do
    it "updates a cat" do
      cat_params = {
        # what we intend to update pre edits
       cat: {
        name: 'Pamela',
        age: 2,
        enjoys: 'Hissing at dogs, pate with extra gravy, and catnip.',
        image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSy7jz1nplDstOjFlgq8_s-GV9OiqgFeWP90g&usqp=CAU'
        }
      }

      post '/cats', params: cat_params 
      cat = Cat.first 
      # what we update post edits
      updated_cat_params = {
        cat: {
          name: 'Pamela',
          age: 2,
          enjoys: 'Hissing at dogs, pate with extra gravy, and staring out the window.',
          image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSy7jz1nplDstOjFlgq8_s-GV9OiqgFeWP90g&usqp=CAU'
        }
      }

      patch "/cats/#{cat.id}", params: updated_cat_params
      updated_cat = Cat.find(cat.id)
      expect(response).to have_http_status(200)
      expect(updated_cat.enjoys).to eq 'Hissing at dogs, pate with extra gravy, and staring out the window.'

    end
  end

  describe "cannot create a cat without valid attributes" do
    it "does not create a cat without a name" do
      cat_params = {
        cat: {
          age: 4,
          enjoys: 'Hiding under the bed',
          image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR7OLZBC9oeEXzls8Nsm8N7xge0jlfqlpHRoQ&usqp=CAU'
        }
      }

      post '/cats', params: cat_params
      expect(response).to have_http_status(422)
      cat = JSON.parse(response.body)
      expect(cat['name']).to include "can't be blank"
    end

    it "does not create a cat with an age" do
      cat_params = {
        cat: {
          name: 'Princess Peach',
          enjoys: 'Hiding under the bed',
          image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR7OLZBC9oeEXzls8Nsm8N7xge0jlfqlpHRoQ&usqp=CAU'
        }
      }

      post '/cats', params: cat_params
      expect(response).to have_http_status(422)

      cat = JSON.parse(response.body)
      expect(cat['age']).to include "can't be blank"

    end
  end
end
