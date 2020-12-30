# Introduction
- support for testing with `PHPUnit`
- `phpunit.xml`
- convenient helper methods
- tests directory contains two directories: `Feature` and `Unit`
- most unit tests probably focus on a single method. Tests within your "Unit" test directory do not boot your Laravel application
- Feature tests may test a larger portion of your code, including how several objects interact with each other or even a full HTTP request to a JSON endpoint. Generally, most of your tests should be feature tests

# Environment
- set the configuration environment to `testing`
- configures the `session` and `cache` to the `array` driver
- clear your configuration cache using the `config:clear`
- `.env.testing` file will be used instead of the .env file when running PHPUnit tests or executing Artisan commands with the --env=testing option

# Creating & Running Tests
- php artisan make:test UserTest, `tests/Feature`
- php artisan make:test UserTest --unit, `tests/Unit`
- Test stubs may be customized using stub publishing
- setUp / tearDown => parent::setUp() / parent::tearDown(), /vendor/laravel/framework/src/Illuminate/Foundation/Testing/TestCase.php

## Artisan Test Runner
- vendor/bin/phpunit
- php artisan test
- php artisan test --testsuite=Feature --stop-on-failure
