# Introduction
- $response = $this->get('/');
- $response->assertStatus(200);
- class ExampleTest extends TestCase {, 类名`*Test`
- public function testBasicTest() {, 函数名`test*`

# Making Requests
- To make a request to your application, you may invoke the `get, post, put, patch, or delete` methods within your test.
- These methods do not actually issue a "real" HTTP request to your application. Instead, the entire network request is simulated internally.
- Instead of returning an `Illuminate\Http\Response` instance, test request methods return an instance of `Illuminate\Testing\TestResponse`
- $this->get('/')->assertStatus(200)
- For convenience, the CSRF middleware is automatically disabled when running tests.

## Customizing Request Headers
- `withHeaders` method, /vendor/laravel/framework/src/Illuminate/Foundation/Testing/Concerns/MakesHttpRequests.php

## Cookies
- `withCookie` or `withCookies` methods, 同上

## Session / Authentication
- `withSession` method, /vendor/laravel/framework/src/Illuminate/Foundation/Testing/Concerns/InteractsWithSession.php
- `actingAs` helper method provides a simple way to authenticate a given user as the current user, You may also specify which guard should be used
- /vendor/laravel/framework/src/Illuminate/Foundation/Testing/Concerns/InteractsWithAuthentication.php
- $user = User::factory()->create();

## Debugging Responses
- `dump, dumpHeaders, and dumpSession` methods

# Testing JSON APIs
- `json, getJson, postJson, putJson, patchJson, deleteJson, and optionsJson` methods
- JSON response data may be accessed as array variables on the response,  $this->assertTrue($response['created']);
- `assertJson` method verify that the given array `exists` within the JSON response, `PHPUnit::assertArraySubset`
- `assertExactJson` method
- `assertJsonPath` method

# Testing File Uploads
- `Illuminate\Http\UploadedFile` class provides a `fake` method
- `Storage` facade's `fake` method

# Testing Views
- call the `view` method within your test
- `Illuminate\Testing\TestView`
- `assertSee, assertSeeInOrder, assertSeeText, assertSeeTextInOrder, assertDontSee, and assertDontSeeText`
- $contents = (string) $this->view('welcome');
- `withViewErrors` method

## Rendering Blade & Components
- `blade` method, evaluate and render a raw Blade string
- `component` method, evaluate and render a Blade component

# Available Assertions
- https://laravel.com/docs/8.x/http-tests#available-assertions
- `Illuminate\Testing\TestResponse`

## Response Assertions

## Authentication Assertions
