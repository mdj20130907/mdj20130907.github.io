# Introduction
- `.blade.php` file
- `resources/views` directory
- `view` helper, data may be passed to the Blade view using the view helper's second argument
- https://laravel.com/docs/8.x/views

# Displaying Data
- wrapping the variable in curly braces, `{{ $data }}`
- Blade's `{{ }}` echo statements are automatically sent through PHP's `htmlspecialchars` function to prevent `XSS` attacks
- you can put any PHP code you wish inside of a Blade echo statement, `{{ time() }}`
- in JavaScript: `@json` Blade directive, PHP's `json_encode` function
- You should only use the @json directive to render `existing variables` as JSON. The Blade templating is based on `regular expressions`

## HTML Entity Encoding
- By default, `Blade` (and the Laravel `e` helper) will double encode HTML entities.
- If you would like to disable double encoding, call the `Blade::withoutDoubleEncoding` method from the `boot` method of your `AppServiceProvider`
- `htmlspecialchars` 函数的第4个参数`double_encode`，TODO:？
- https://www.php.net/manual/zh/function.htmlspecialchars.php
- Displaying Unescaped Data: `{!! $name !!}`

## Blade & JavaScript Frameworks
- use the `@` symbol to inform the Blade rendering engine an expression should remain untouched, `@{{ name }}`
- The `@` symbol may also be used to escape Blade directives: `@@json()`
- wrap the HTML in the `@verbatim`,`@endverbatim` directive

# Blade Directives

## If Statements
- @if, @elseif, @else, and @endif directives
- @unless, @endunless directive
- @isset, @endisset
- https://www.php.net/manual/zh/function.isset.php
- @empty, @endempty
- https://www.php.net/manual/zh/function.empty.php
- @auth, @endauth; @guest, @endguest; may specify the authentication guard
- @production, @endproduction; @env('staging'), @env(['staging', 'production']), @endenv
- @hasSection('navigation'), @sectionMissing('navigation'), @endif

## Switch Statements
- @switch, @case, @break, @default and @endswitch directives

## Loops
- @for, @endfor
- @foreach, @endforeach
- @forelse, @empty, @endforelse
- @while, @endwhile
- @continue($user->type == 1), @break($user->number == 5)

## The Loop Variable
- $loop variable, access the parent loop's $loop variable via the `parent` property
- index, iteration, remaining, count, first, last, even, odd, depth, parent

## Comments
- {{-- This comment will not be present in the rendered HTML --}}

## Including Subviews
- @include directive
- All variables that are available to the parent view will be made available to the included view
- @include('view.name', ['status' => 'complete'])
- @includeIf('view.name', ['status' => 'complete'])
- @includeWhen($boolean, 'view.name', ['status' => 'complete'])
- @includeUnless($boolean, 'view.name', ['status' => 'complete'])
- @includeFirst(['custom.admin', 'admin'], ['status' => 'complete'])
- avoid using the __DIR__ and __FILE__ constants in your Blade views

### Rendering Views For Collections
- combine `loops` and `includes` into one line with Blade's `@each` directive
- @each('view.name', $jobs, 'job'), array key as the `key` variable
- @each('view.name', $jobs, 'job', 'view.empty')
- @each do not inherit the variables from the parent view

## The @once Directive
- useful for pushing a given piece of JavaScript into the page's header using stacks
- @once, @endonce

## Raw PHP

# Components
Rendering Components
Passing Data To Components
Component Attributes
Slots
Inline Component Views
Anonymous Components
Dynamic Components
Manually Registering Components
# Building Layouts
Layouts Using Components
Layouts Using Template Inheritance
# Forms
CSRF Field
Method Field
Validation Errors
# Stacks
# Service Injection
# Extending Blade
Custom If Statements
