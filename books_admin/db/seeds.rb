# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
publisher = Publisher.create(
  name: "Ginhyo inc.",
  address: "Ichigaya"
)

publisher.books << Book.create(
  name: "enum Book 1",
  sales_status: :now_on_sale,
  publisher: Publisher.find(1),
  price: 100
)

publisher.books << Book.create(
  name: "enum Book 2",
  sales_status: :end_of_print,
  publisher: Publisher.find(1),
  price: 200
)

publisher.books << Book.create(
  name: "enum Book 3",
  sales_status: :reservation,
  publisher: Publisher.find(2),
  price: 300
)

matz = Author.create(
  name: "Matsumoto Yukihitro",
  penname: "Matz"
)

dhh = Author.create(
  name: "David Heinemeier Hansson",
  penname: "DHH"
)

matz.books << Book.find(1)
matz.books << Book.find(2)

book = Book.find(1)
book.authors << dhh

