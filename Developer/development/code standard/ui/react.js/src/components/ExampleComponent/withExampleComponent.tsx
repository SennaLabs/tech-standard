import { FunctionComponentType } from "interfaces/FunctionComponentType";

export function withExampleComponent(
  Component: React.FC<FunctionComponentType>
) {
  function WithExampleComponent() {
    return <Component />;
  }

  return WithExampleComponent;
}
