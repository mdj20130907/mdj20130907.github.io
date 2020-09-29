### Introduction
- HTTP driven applications are stateless, sessions provide a way to store information about the user across multiple requests
- config/session.php
- storage/framework/sessions

### Using The Session
- Retrieving Data
- Storing Data
- Flash Data
- Deleting Data
- Regenerating The Session ID

### Session Blocking

### Adding Custom Session Drivers
- Implementing The Driver
- Registering The Driver


### 代码
- config/app.php => Illuminate\Session\SessionServiceProvider::class
- vendor/laravel/framework/src/Illuminate/Session/SessionServiceProvider.php
- vendor/laravel/framework/src/Illuminate/Session/Middleware/StartSession.php
- vendor/laravel/framework/src/Illuminate/Session/SessionManager.php
- vendor/laravel/framework/src/Illuminate/Session/Store.php