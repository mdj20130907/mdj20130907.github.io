# Introduction
- Guards define how users are authenticated for each request.
- Providers define how users are retrieved from your persistent storage.
- config/auth.php

## Starter Kits

## Database Considerations
- the `password` column is at least 60 characters in length
- a nullable, string `remember_token` column of 100 characters

## Ecosystem Overview
### Laravel's Built-in Browser Authentication Services
### Laravel's API Authentication Services
- Passport
- Sanctum
### Summary & Choosing Your Stack

# Authentication Quickstart
Install A Starter Kit
Retrieving The Authenticated User
Protecting Routes
Login Throttling
# Manually Authenticating Users
Remembering Users
Other Authentication Methods
# HTTP Basic Authentication
Stateless HTTP Basic Authentication
# Logging Out
Invalidating Sessions On Other Devices
# Password Confirmation
Configuration
Routing
Protecting Routes
# Adding Custom Guards
Closure Request Guards
# Adding Custom User Providers
The User Provider Contract
The Authenticatable Contract
# Social Authentication
# Events
