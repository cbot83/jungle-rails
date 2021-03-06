# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example.

## My contribution to the project

When I inherited this code it was a "working" ecommerce application. My additions included:

* Adding a sold out badge.
* Giving admins the ability to create categories.
* Giving admins the ability to post new products.
* Adding user registration and login.
* Encrypting the users password on the database.
* Adding order details to the final order page.
* Creating an automated email receipt on each purchase.
* Redirecting empty carts so they can't checkout.
* Adding product ratings and overall ratings for products.


## Setup

1. Fork & Clone
2. Run `bundle install` to install dependencies
3. Create `config/database.yml` by copying `config/database.example.yml`
4. Create `config/secrets.yml` by copying `config/secrets.example.yml`
5. Run `bin/rake db:reset` to create, load and seed db
6. Create `.env` by copying `.env.example`
7. Sign up for a Stripe account
8. Put Stripe (test) keys into appropriate .env vars
9. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4242 4242 4242 4242 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe

### Screen Shots

!["Homepage View"](https://github.com/cbot83/jungle-rails/blob/master/docs/Screen%20Shot%202018-04-28%20at%209.45.18%20AM.png)
!["Product View"](https://github.com/cbot83/jungle-rails/blob/master/docs/Screen%20Shot%202018-04-28%20at%209.45.52%20AM.png)