# Jungle

A mini e-commerce application built with Rails 6.1

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rails db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Database

If Rails is complaining about authentication to the database, uncomment the user and password fields from `config/database.yml` in the development and test sections, and replace if necessary the user and password `development` to an existing database user.

## Stripe Testing

Use Credit Card # 4242 4242 4242 4242 for testing success scenarios, and input any date in the future, along with a random 3-digit string for the cv code.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Screenshots

!["Homepage](https://github.com/MiersX/jungle-rails/blob/master/docs/Homepage.png?raw=true)
!["Product listings"](https://github.com/MiersX/jungle-rails/blob/master/docs/ProductListings.png?raw=true)
!["A purchase order](https://github.com/MiersX/jungle-rails/blob/master/docs/PurchaseOrder.png?raw=true)

## Dependencies

- Rails 6.1 [Rails Guide](http://guides.rubyonrails.org/v6.1/)
- Bootstrap 5
- PostgreSQL 9.x
- Stripe
