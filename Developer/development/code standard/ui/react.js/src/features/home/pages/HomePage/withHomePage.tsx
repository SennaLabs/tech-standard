import { FunctionComponentType } from "interfaces/FunctionComponentType";

export function withHomePage(Component: React.FC<FunctionComponentType>) {
  function WithHomePage() {
    return <Component />;
  }

  return WithHomePage;
}
