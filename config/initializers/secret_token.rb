# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
Prelaunchr::Application.config.secret_token = ENV["RAILS_SECRET"] || 'c39a6da1158d6b2827fe71334bd62aa159ac8ec1a045fcf11ad32ece31153710d772d84b93273a4763061fef34deee8cff207c43f62048b53a12a5ab0ed7ab70'
