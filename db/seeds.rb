# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Country
json_country = JSON.parse(File.read(Rails.root.join('db/seedfiles/countries.json')))
json_country['countries'].each_with_index do |item, index|
  country = Country.find_by(id: item['id'])
  if !country.present?
    country = Country.new
    country.id = item['id']
  end
  # (lstrip) Remove space at front of text
  country.name = item['name'].lstrip
  country.save()
end

# Author
json_author = JSON.parse(File.read(Rails.root.join('db/seedfiles/authors.json')))
json_author['authors'].each_with_index do |item, index|
  author = Author.find_by(id: item['id'])
  if !author.present?
    author = Author.new
    author.id = item['id']
  end
  author.name = item['name'].lstrip
  author.bio = item['bio'].present? ? item['bio'].lstrip : nil
  author.gender = item['gender']
  author.wikipedia = item['wikipedia']
  author.summary = item["summary"].present? ? item["summary"].lstrip : nil
  author.born = item["born"]
  author.died = item["died"]

  author.save()  

  # Assign Author and Country (many-to-many relationship)
  item["countries"].each_with_index do |ctry, index|
    country = Country.find_by(id: ctry)
    authorCountry = author.countries.find_by(id: country.id)
    if !authorCountry.present?
      author.countries << country      
    end    
  end
end

# Book
json_book = JSON.parse(File.read(Rails.root.join('db/seedfiles/books.json')))
json_book['books'].each_with_index do |item, index|
  book = Book.find_by(id: item['id'])
  if !book.present?
    book = Book.new
    book.id = item['id']
  end
  book.content_name = item['content_name']
  book.isbn = item['isbn']
  book.original_title = item['original_title']
  book.year = item['year']
  book.language_code = item['language_code']
  book.images = item['images']
  book.category = item['category']
  book.plot = item['plot']
  book.genres = item['genres']
  book.copyright = item['copyright']
  book.title = item['title']
  book.wikipedia = item['wikipedia']
  book.average_rating = item['average_rating']
  book.rating_count = item['rating_count']
  book.goodreads = item['goodreads']
  book.similar_books = item['similar_books']
  book.description = item['description']
  book.loc_class = item['loc_class']
  book.gutenberg = item['gutenberg']
  book.pages = item['pages']
  book.language = item['language']
  book.isbn13 = item['isbn13']
  book.release_date = item['release_date']
  book.cover = item['cover']
  book.summary = item['summary']
  book.content_cleaned = item['content_cleaned']  
  book.classes = item['classes']
  book.content_available = item['content_available']
  book.contents = item['contents'].present? ? item['contents'] : nil
  book.images_urls = item['images_urls']
  book.save()  

  # Assign Book and Country (many-to-many relationship)
  item["countries"].each_with_index do |ctry, index|
    country = Country.find_by(id: ctry)
    bookCountry = book.countries.find_by(id: country.id)
    if !bookCountry.present?
      book.countries << country
    end    
  end

  # Assign Book and Author (many-to-many relationship)
  item["authors"].each_with_index do |athr, index|
    author = Author.find_by(id: athr)
    bookAuthor = book.authors.find_by(id: author.id)
    if !bookAuthor.present?
      book.authors << author      
    end    
  end
end

puts "Total books:    #{Book.all.count}"
puts "Total authors:  #{Author.all.count}"

user = User::find_by(email: "admin@testrga.com")
if !user.present?
  user = User.new
  user.email = "admin@testrga.com"
  user.password = "admin123"
  user.save!(validate: false)
end
