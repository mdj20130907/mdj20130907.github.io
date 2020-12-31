# Introduction
- good, high-level overview of how the Laravel framework works

# Lifecycle Overview
## First Steps
- `public/index.php`
- loads the Composer generated autoloader definition, and then retrieves an instance of the Laravel application from `bootstrap/app.php`
- The first action taken by Laravel itself is to create an instance of the application / service container.

## HTTP / Console Kernels
- HTTP kernel, which is located in `app/Http/Kernel.php`
- The HTTP kernel extends the `Illuminate\Foundation\Http\Kernel` class, which defines an array of `bootstrappers` that will be run before the request is executed.
- The HTTP kernel also defines a list of HTTP `middleware` that all requests must pass through before being handled by the application.
- The method signature for the HTTP kernel's `handle` method is quite simple: it receives a Request and returns a Response.

## Service Providers
- configured in the `config/app.php` configuration file's `providers` array
- Laravel will iterate through this list of providers and `instantiate` each of them. `register` the `boot`

## Routing
- `App\Providers\RouteServiceProvider`
- `routes` directory

## Finishing Up
- `index.php` file calls the `send` method on the returned response

# Focus On Service Providers
- `app/Providers` directory
- `AppServiceProvider`
