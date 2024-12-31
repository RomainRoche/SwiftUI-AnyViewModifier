# AnyModifier

Allow conditional `SwiftUI` modifiers. 

### Return conditional modifiers

```
func conditionalModifier() -> some ViewModifier {
    if someCondition {
        AnyModifier(ModifierA())
    } else {
        AnyModifier(ModifierB())
    }
}

Text("Hello World")
    .modifier(conditionalModifier())
```

### Apply modifiers conditionally 

```
Text("Hello World")
    .modifier(if: someCondition, ModifierA()) // else, no modifier
```
