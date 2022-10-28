# RGA - TEST

RGA TEST CODE using Ruby On Rails

## System Dependencies

The following are needed by this project:

* [PostgreSQL](http://www.postgresql.org/)
* [Ruby On Rails](https://guides.rubyonrails.org/)

## Getting Started

Clone this repository and bundle.

    git clone https://github.com/frediansimanjuntak/rgatest.git
    cd rgatest
    bundle install

Create and initialize the database using this command:

    rake db:setup

Load the sample data

    rake db:seed

Reset sequence ID from table `authors` and `books`
    rails c
    ActiveRecord::Base.connection.reset_pk_sequence!('authors')
    ActiveRecord::Base.connection.reset_pk_sequence!('books')

Start the application server.

    rails server

Access the application at [http://localhost:3000/](http://localhost:3000/) and login using the email and password that was entered earlier on.
