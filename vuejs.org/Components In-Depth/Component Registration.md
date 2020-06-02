### Component Names
- Vue.component('my-component-name', { /* ... */ })
- <my-component-name></my-component-name>

### Global Registration
- Vue.component(
- Global registration often isn’t ideal

### Local Registration
- var ComponentA = { /* ... */ }
- new Vue({ components: {'component-a': ComponentA} })

### Module Systems
- require.context
