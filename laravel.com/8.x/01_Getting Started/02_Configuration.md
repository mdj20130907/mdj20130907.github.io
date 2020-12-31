# Introduction
- `config` directory

# Environment Configuration
- .env.example
- .env
- putting placeholder values in the example configuration file
- Any variable in your .env file can be overridden by external environment variables such as server-level or system-level environment variables.
- .env file should not be committed to your application's source control

## Environment Variable Types
- If you need to define an environment variable with a value that contains spaces, you may do so by enclosing the value in double quotes

## Retrieving Environment Configuration
- `$_ENV` PHP super-global
- `env` helper, The second value passed to the env function is the "default value"

## Determining The Current Environment
- `APP_ENV` variable from your .env file
- use Illuminate\Support\Facades\App;
- App::environment()
- App::environment('local')
- App::environment(['local', 'staging'])
- The current application environment detection can be overridden by defining a server-level APP_ENV environment variable.

# Accessing Configuration Values
- `config` helper
- $value = config('app.timezone')
- $value = config('app.timezone', 'Asia/Seoul')
- config(['app.timezone' => 'America/Chicago'])

# Configuration Caching
- You should typically run the `php artisan config:cache` command as part of your production deployment process.
- If you execute the config:cache command during your deployment process, you should be sure that you are only calling the env function from within your configuration files.

# Debug Mode
- `debug` option in your `config/app.php` configuration file
- `APP_DEBUG` environment variable
- In your production environment, this value should always be false.

# Maintenance Mode
- php artisan down
- php artisan down --retry=60 // TODO:?
- php artisan down --secret="bypass-token"
- php artisan down --render="errors::503", resources/views/errors/503.blade.php
- php artisan down --redirect=/
- php artisan up
- While your application is in maintenance mode, no queued jobs will be handled.
- zero-downtime deployment