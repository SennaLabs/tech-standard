import { ExampleComponent } from "./ExampleComponent";
import { withExampleComponent } from "./withExampleComponent";

const ConnectedExampleComponent = withExampleComponent(ExampleComponent);

export { ConnectedExampleComponent as ExampleComponent };
