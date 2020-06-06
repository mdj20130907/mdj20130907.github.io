### Event Names
- always use kebab-case for event names

### Customizing Component v-model
- By default, `v-model` on a component uses `value` as the prop and `input` as the event

### Binding Native Events to Components
- use the `.native` modifier for `v-on`
- `$listeners` property

### `.sync` Modifier
- child: `$emit('update:title', newTitle)` <=> parent: `v-on:update:title="doc.title = $event"`
- <text-document v-bind:title.sync="doc.title"></text-document>
- <text-document v-bind.sync="doc"></text-document>
