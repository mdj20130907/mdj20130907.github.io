# Introduction
- `resources/views` directory
- `view` helper

# Creating & Rendering Views
- `.blade.php`, `.php`也可以
- `View` facade

## Nested View Directories
- "Dot" notation
- View directory names should not contain the . character

## Creating The First Available View
- `View` facade's `first` method
- useful if your application or package allows views to be customized or overwritten

## Determining If A View Exists
- `View` facade, `exists` method

# Passing Data To Views
- use the `with` method to add individual pieces of data to the view

## Sharing Data With All Views
- `View` facade's `share` method
- place calls to the `share` method within a service provider's `boot` method

# View Composers
- If you have data that you want to be bound to a view each time that view is rendered, a view composer can help you organize that logic into a single location.
- view composers will be registered within one of your application's service providers
- add the service provider to the `providers` array in the `config/app.php`
- use the `View` facade's `composer` method to register the view composer
- Attaching A Composer To Multiple Views
- The composer method also accepts the `*` character as a wildcard, allowing you to attach a composer to all views

## View Creators
- `creator` method

# Optimizing Views
- php artisan view:cache
- php artisan view:clear
