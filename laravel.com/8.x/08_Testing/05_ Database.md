# Introduction
## Resetting The Database After Each Test
- `Illuminate\Foundation\Testing\RefreshDatabase`
- `use RefreshDatabase;`
- /phpunit.xml, DB_*

# Defining Model Factories
## Concept Overview
- /vendor/laravel/framework/src/Illuminate/Database/Eloquent/Factories/HasFactory.php
- /vendor/laravel/framework/src/Illuminate/Database/Eloquent/Factories/Factory.php, `public static function factoryForModel(string $modelName)`
- extend Laravel's base `factory` class and define a `model` property and `definition` method
- Via the `faker` property, factories have access to the `Faker PHP` library
- `faker_locale` option to your config/app.php configuration file

## Generating Factories
- php artisan make:factory PostFactory --model=Post

## Factory States
- State transformation methods typically call the `state` method provided by Laravel's base factory class

## Factory Callbacks
- `afterMaking` and `afterCreating` methods
- `configure` method

# Creating Models Using Factories

## Instantiating Models
- the static `factory` method provided to your models by the `Illuminate\Database\Eloquent\Factories\HasFactory` trait
- use the `make` method to create models without persisting them to the database
- create a collection of many models using the `count` method
- Applying States: User::factory()->count(5)->suspended()->make();
- Overriding Attributes: pass an array of values to the `make` method, the `state` method may be called directly
- Mass assignment protection is automatically disabled when creating models using factories.
- Connecting Factories & Models: look for a factory in the Database\Factories namespace that has a class name matching the model name and is suffixed with Factory; may overwrite the `newFactory` method on your model

## Persisting Models
- `create` method instantiates model instances and persists them to the database using Eloquent's `save` method
- may `override` the factory's default model attributes by passing an array of attributes to the `create` method

## Sequences
- Illuminate\Database\Eloquent\Factories\Sequence
- may wish to alternate the value of an admin column between Y and N for each created user

# Factory Relationships

## Has Many Relationships
- `has` method
- magic factory relationship methods, hasPosts

## Belongs To Relationships
- `for` method
- magic factory relationship methods, forUser

## Many To Many Relationships
- `has` method
- Pivot Table Attributes: `hasAttached` method
- magic factory relationship methods, hasRoles

## Polymorphic Relationships
- TODO: 看完模型关系后再来测试一遍?

## Defining Relationships Within Factories
- TODO: ?

# Running Seeders
- By default, the `seed` method will execute the `DatabaseSeeder`, which should execute all of your other seeders.
- $this->seed();
- $this->seed(OrderStatusSeeder::class);
- you may instruct the RefreshDatabase trait to automatically seed the database before each test. You may accomplish this by defining a `$seed` property on your test class

# Available Assertions
- https://laravel.com/docs/8.x/database-testing#available-assertions