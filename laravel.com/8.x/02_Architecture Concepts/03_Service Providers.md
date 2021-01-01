# Introduction
- what do we mean by "bootstrapped"? In general, we mean registering things
- config/app.php file, providers array
- "deferred" providers

# Writing Service Providers
- extend the `Illuminate\Support\ServiceProvider` class
- `register` method: only bind things into the service container
- `boot` method
- php artisan make:provider MyServiceProvider

## The Register Method
- `$this->app` => service container
- `bindings` and `singletons` properties 

## The Boot Method
- This method is called after all other service providers have been registered
- may type-hint dependencies for your service provider's boot method

# Registering Providers
- registered in the `config/app.php` configuration file's `providers` array

# Deferred Providers
- If your provider is only registering bindings in the service container, you may choose to defer its registration until one of the registered bindings is actually needed.
- implement the `\Illuminate\Contracts\Support\DeferrableProvider` interface
- define a `provides` method
- TODO: 怎么验证呢?
