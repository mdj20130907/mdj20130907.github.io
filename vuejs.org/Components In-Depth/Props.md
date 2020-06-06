### Prop Casing (camelCase vs kebab-case)
- kebab-cased (hyphen-delimited)
- <blog-post post-title="hello!"></blog-post>

### Prop Types
- props: ['title']
- props: {title: String}

### Passing Static or Dynamic Props

#### Passing a Number
- <blog-post v-bind:likes="42"></blog-post>

#### Passing a Boolean
- <blog-post v-bind:is-published="false"></blog-post>
- Including the prop with no value will imply `true`: <blog-post is-published></blog-post>

#### Passing an Array
- <blog-post v-bind:comment-ids="[234, 266, 273]"></blog-post>

#### Passing an Object
- <blog-post :author="{ name: 'Veronica', company: 'Veridian Dynamics' }"></blog-post>

#### Passing the Properties of an Object
- <blog-post v-bind="{id: 1, title: 'My Journey with Vue'}"></blog-post>

### One-Way Data Flow
- All props form a one-way-down binding between the child property and the parent one
- Note that objects and arrays in JavaScript are passed by reference, so if the prop is an array or object, mutating the object or array itself inside the child component will affect parent state.

- 1. The prop is used to pass in an initial value; the child component wants to use it as a local data property afterwards. In this case, it’s best to define a local data property that uses the prop as its initial value
- 2. The prop is passed in as a raw value that needs to be transformed. In this case, it’s best to define a computed property using the prop’s value

### Prop Validation
- `null` and `undefined` values will pass any type validation
- Basic type check: Vue.component('my-component', {props: {propA: Number}})
- Multiple possible types: Vue.component('my-component', {props: {propB: [String, Number]}})
- Required string: Vue.component('my-component', {props: {propC: {type: String, required: true}}})
- Number with a default value: Vue.component('my-component', {props: {propD: {type: Number, default: 100}}})
- Object with a default value, Object or array defaults must be returned from a factory function: Vue.component('my-component', {props: {propE: {type: Object, default: function () {return { message: 'hello' }}}}})
- Custom validator function: Vue.component('my-component', {props: {propF: {validator: function (value) {return ['success', 'warning', 'danger'].indexOf(value) !== -1}}}})
- Note that props are validated before a component instance is created, so instance properties (e.g. data, computed, etc) will not be available inside default or validator functions

#### Type Checks
- native constructors: String,Number,Boolean,Array,Object,Date,Function,Symbol
- type can also be a custom constructor function and the assertion will be made with an instanceof check

### Non-Prop Attributes
- A non-prop attribute is an attribute that is passed to a component, but does not have a corresponding prop defined
- components can accept arbitrary attributes, which are added to the component’s root element

#### Replacing/Merging with Existing Attributes
- For most attributes, the value provided to the component will replace the value set by the component
- the class and style attributes are a little smarter, so both values are merged

#### Disabling Attribute Inheritance
- set `inheritAttrs: false` in the component’s options
- combination with the `$attrs` instance property
- Note that inheritAttrs: false option does not affect style and class bindings
