# AnyViewModifier

Allow conditional `SwiftUI` modifiers. 

### Return conditional modifiers

```
func conditionalModifier() -> some ViewModifier {
    if someCondition {
        AnyViewModifier(ModifierA())
    } else {
        AnyViewModifier(ModifierB())
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
