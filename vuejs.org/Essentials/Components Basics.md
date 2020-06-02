### Base Example
- Components are reusable Vue instances with a name
- options: data, computed, watch, methods, and lifecycle hooks
- props, template
- The only exceptions are a few root-specific options like el

### Reusing Components
- <button-counter></button-counter>
- data Must Be a Function

### Organizing Components

### Passing Data to Child Components with Props

### A Single Root Element

### Listening to Child Components Events
- a custom events system
- The parent can choose to listen to any event on the child component instance with `v-on`
- Then the child component can emit an event on itself by calling the built-in `$emit` method, passing the name of the event

- Emitting a Value With an Event: `$event`

- Using v-model on Components ??

### Content Distribution with Slots
- <slot>

### Dynamic Components
- `is` special attribute
- all attributes will be bound as DOM attributes
- `.prop` modifier ??

### DOM Template Parsing Caveats
- `is`
