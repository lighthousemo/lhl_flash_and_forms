namespace :db do
  desc "Populate the database with dummy data"
  task populate: :environment do
    Book.create!(title: "One Flew Over the Cuckoo's Nest", author: "Ken Kesey")
    Book.create!(title: "Harry Potter", author: "J. K. Rowling")
    Book.create!(title: "Life of Pi", author: "Yann Martel")
    Book.create!(title: "Snow", author: "Orhan Pamuk")
    Book.create!(title: "A Brief History of Seven Killings", author: "Marlon James")
    Book.create!(title: "The White Tiger", author: "Aravind Adiga")
    Book.create!(title: "Life and Times of Michael K", author: "J. M. Coetzee")
  end

end
