The solution is to use `event.target` instead of relying solely on `event.currentTarget` within the nested listener. `event.target` always refers to the object that initially dispatched the event. 

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
  trace("Button Clicked: "+ event.target); // Correctly identifies the button
  // ...code that now correctly uses event.target...
}
```
By using `event.target`, the code now accurately identifies the button element, resolving the unexpected behavior.