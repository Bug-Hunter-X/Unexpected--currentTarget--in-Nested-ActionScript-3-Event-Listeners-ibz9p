# ActionScript 3: Unexpected `currentTarget` in Nested Event Listeners

This repository demonstrates a subtle bug in ActionScript 3 related to the use of `currentTarget` within nested event listeners.  The bug arises from a misunderstanding of event bubbling and how `currentTarget` is affected.

The `bug.as` file shows the problematic code. The `bugSolution.as` file provides a corrected version.

## Bug Description
When using nested event listeners, incorrect usage of `event.currentTarget` can lead to unexpected behavior.  If the inner listener doesn't explicitly specify the target or improperly uses `currentTarget`, it might reference the parent container instead of the intended target element.

## Solution
The solution involves careful consideration of event bubbling and using `event.target` to directly address the element that triggered the event.  The corrected code ensures that actions are performed on the correct element regardless of event propagation.