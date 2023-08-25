import { Outlet, useRoutes } from "react-router-dom";

import { homeRoutes } from "features/home/homeRoutes";

function App() {
  const routes = useRoutes([
    {
      path: "",
      element: <Outlet />,
      children: [...homeRoutes],
    },
  ]);

  return routes;
}

export default App;
