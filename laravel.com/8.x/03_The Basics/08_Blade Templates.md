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
- @php $counter = 1; @endphp

# Building Layouts

## Layouts Using Components
### Defining The Layout Component
- resources/views/components/layout1.blade.php
- {{ $title }}
- {{ $slot }}

### Applying The Layout Component
- resources/views/test1.blade.php
- <x-layout1> <x-slot name="title">Custom Title</x-slot> 其他的都给了$slot </x-layout1>

## Layouts Using Template Inheritance
### Defining A Layout
- resources/views/layouts/app2.blade.php
- @section('sidebar') 内容 @show: @section directive, defines a section of content
- @yield('title'): @yield directive is used to display the contents of a given section

### Extending A Layout
- resources/views/test2.blade.php
- @extends('layouts.app2'): use the @extends Blade directive to specify which layout the child view should "inherit"
- @section('title', '自定义标题'), @section('sidebar') @parent 新增内容 @endsection: inject content into the layout's sections using @section directives
- utilizing the `@parent` directive to append (rather than overwriting) content to the layout
- The `@endsection` directive will only define a section while `@show` will define and immediately yield the section
- `@yield` directive also accepts a default value as its second parameter

# Forms
## CSRF Field
- Anytime you define an HTML form in your application, you should include a hidden CSRF token field in the form so that the CSRF protection middleware can validate the request
- `@csrf` Blade directive

## Method Field
- Since HTML forms can't make `PUT`, `PATCH`, or `DELETE` requests, you will need to add a hidden _method field to spoof these HTTP verbs
- `@method` Blade directive

## Validation Errors
- `@error` directive
- @error('title') {{ $message }} @enderror

# Components: TODO:?

# Stacks
- @prepend('scripts') @endprepend
- @push('scripts') @endpush
- @stack('scripts')

# Service Injection
- @inject('metrics', 'App\Services\MetricsService')
- {{ $metrics->monthlyRevenue() }}

# Extending Blade
- Blade::directive
- After updating the logic of a Blade directive, you will need to delete all of the cached Blade views

## Custom If Statements
- Blade::if
