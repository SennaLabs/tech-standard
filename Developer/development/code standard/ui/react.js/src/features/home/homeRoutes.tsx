import { Outlet } from "react-router-dom";

import { HomePage } from "./pages/HomePage";

export const homeRoutes = [
  {
    path: "",
    element: <Outlet />,
    children: [
      {
        path: "",
        element: <HomePage />,
      },
    ],
  },
];
