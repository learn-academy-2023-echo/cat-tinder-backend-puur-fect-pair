cats = [
  {
    name: 'Pamela',
    age: 2,
    enjoys: 'Hissing at dogs, pate with extra gravy, and catnip.',
    image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSy7jz1nplDstOjFlgq8_s-GV9OiqgFeWP90g&usqp=CAU'
  },
  {
    name: 'Stevie',
    age: 1,
    enjoys: 'Belly rubs, cuddles, and chaising the laser pointer.',
    image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSbBI1mGxt742jewuszQzwD9hNyHoHIN5jv8Q&usqp=CAU'
  },
  {
    name: 'Jerry',
    age: 83,
    enjoys: 'Trying to capture that dang mouse, Tom!',
    image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSSVoLi4TYM3ZB6Z9J1lLdclwvIO6F1OqvU8A&usqp=CAU'
  },
  {
    name: 'Tony',
    age: 70,
    enjoys: 'Frosted Flakes!',
    image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSe2Oc5kBaMcBAf0k2YToeqTC-QxNpeIM1xJg&usqp=CAU'
  },
  {
    name: 'Salem',
    age: 100,
    enjoys: 'Pumpkin spice lattes, spell books, and brooms.',
    image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRQFmpKwFFtlKYolO2CA72m_rZTyyuWJPITHw&usqp=CAU'
  }
]  

cats.each do |each_cat|
    Cat.create each_cat
    puts "creating cat #{each_cat}"
  end
