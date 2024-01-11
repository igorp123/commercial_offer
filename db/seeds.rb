30.times do
  body = Faker::Lorem.paragraph(sentence_count: 5, supplemental: true, random_sentences_to_add: 4)
  client = Faker::University.name
  amount = Faker::Commerce.price(range: 10000.0..100000.0, as_string: true)
  comment = Faker::Hipster.sentence(word_count: 10)

  Offer.create(body: body, client: client, amount: amount, comment: comment)
end
