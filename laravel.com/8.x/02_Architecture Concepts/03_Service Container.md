# Introduction
- managing class dependencies
- performing dependency injection
- However, since the repository is injected, we are able to easily swap it out with another implementation. We are also able to easily "mock", or create a dummy implementation of the UserRepository when testing our application.

## Zero Configuration Resolution
- If a class has no dependencies or only depends on other concrete classes (not interfaces), the container does not need to be instructed on how to resolve that class.

## When To Use The Container
- First, if you write a class that implements an interface and you wish to type-hint that interface
- Secondly, if you are writing a Laravel package that you plan to share with other Laravel developers

# Binding

## Binding Basics

### Simple Bindings
- Within a service provider: $this->app
- outside of a service provider: App facade
- bind

### Binding A Singleton
- singleton

### Binding Instances
- instance

## Binding Interfaces To Implementations
- $this->app->bind(EventPusher::class, RedisEventPusher::class);

## Contextual Binding
- $this->app->when(PhotoController::class)->needs(Filesystem::class)->give(function () { return Storage::disk('local'); });

## Binding Primitives
- $this->app->when('App\Http\Controllers\UserController')->needs('$variableName')->give($value);
- $this->app->when(ReportAggregator::class)->needs('$reports')->giveTagged('reports');

## Binding Typed Variadics
- public function __construct(Logger $logger, Filter ...$filters)
- $this->app->when(Firewall::class)->needs(Filter::class)->give(\[NullFilter::class,ProfanityFilter::class,TooLongFilter::class,\]);
- ->giveTagged('reports')

## Tagging
- $this->app->tag([CpuReport::class, MemoryReport::class], 'reports');
- $this->app->bind(ReportAnalyzer::class, function ($app) { return new ReportAnalyzer($app->tagged('reports')); });

## Extending Bindings
- $this->app->extend(Service::class, function ($service, $app) { return new DecoratedService($service); });

# Resolving

## The Make Method
- $api = $this->app->make(Transistor::class);
- $api = $this->app->makeWith(Transistor::class, ['id' => 1]);
- use Illuminate\Container\Container; public function __construct(Container $container)

## Automatic Injection

# Container Events
- $this->app->resolving(Transistor::class, function ($api, $app) {
- $this->app->resolving(function ($object, $app) {

# PSR-11
- use Psr\Container\ContainerInterface;
- Route::get('/', function (ContainerInterface $container) {
