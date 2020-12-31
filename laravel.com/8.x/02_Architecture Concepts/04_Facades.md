# Introduction
- Facades provide a "static" interface to classes that are available in the application's service container.
- Laravel facades serve as "static proxies" to underlying classes in the service container
- Illuminate\Support\Facades namespace
- "use App;"和"use Illuminate\Support\Facades\App;"都可以引用到App，是因为: /config/app.php => 'aliases'
- Helper Functions: app()->version()
- Because helper functions are globally available, you do not need to import any classes in order to use them

# When To Use Facades
- The primary danger of facades is class "scope creep"

## Facades Vs. Dependency Injection
- One of the primary benefits of dependency injection is the ability to swap implementations of the injected class

## Facades Vs. Helper Functions
- Under the hood, the cache helper is going to call the get method on the class underlying the Cache facade

# How Facades Work
- a facade is a class that provides access to an object from the container
- extend the base Illuminate\Support\Facades\Facade class
- __callStatic() magic-method

# Real-Time Facades
- To generate a real-time facade, prefix the namespace of the imported class with Facades
- When testing, we can use Laravel's built-in facade testing helpers to mock this method call

# Facade Class Reference
- facade and its underlying class
- https://laravel.com/docs/8.x/facades
