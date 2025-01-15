An uncommon ActionScript 3 bug can occur when working with nested EventListeners and the `currentTarget` property.  Consider this scenario: you have a button inside a container, both with event listeners attached.  If you're not careful, you might accidentally access `currentTarget` within the inner button's event listener, expecting it to refer to the button itself but instead it refers to the container. This would lead to unexpected behavior if you rely on `currentTarget` for element-specific actions.  For example:

```actionscript
import flash.events.MouseEvent;

// Container
container.addEventListener(MouseEvent.CLICK, containerClickHandler);

// Button inside container
button.addEventListener(MouseEvent.CLICK, buttonClickHandler);

function containerClickHandler(event:MouseEvent):void {
  trace("Container Clicked: "+ event.currentTarget);
}

function buttonClickHandler(event:MouseEvent):void {
  trace("Button Clicked: "+ event.currentTarget); //Incorrectly assumes this is the button
  // ...code that relies on event.currentTarget being the button...
}
```
In this case, within `buttonClickHandler`, `event.currentTarget` will refer to the container, not the button, because the event bubbles up.