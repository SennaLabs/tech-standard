import { HomePage } from "./HomePage";
import { withHomePage } from "./withHomePage";

const ConnectedHomePage = withHomePage(HomePage);

export { ConnectedHomePage as HomePage };
