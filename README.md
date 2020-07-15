# README

## Prerequisites

* Rails - 6.0.3.2
* Ruby - 2.5.3
* Postgresql


## Installation Steps
* Clone this repo
* `cd` into the repo
* run `bundle install` to install dependencies
* Run `rails credentials:edit`
* Add a key  - `db_user` and a value representing your database username
* Add a key - `db_password` and a value representing your database password
* Save your new credentials
* Run  `rails db:create` to create the database
* Run `rails db:migrate` to create all the  necessary tables. 
* Alternatively, you can run `rails schema:load`
* Run `rails db:seed` to seed the database with initial values
* Start the app by running `rails s`

