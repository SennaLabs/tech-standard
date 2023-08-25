import { render } from "@testing-library/react";
import { ExampleComponent } from "components/ExampleComponent/ExampleComponent";

describe("<Example />", () => {
  it("render Example component", () => {
    const { getByText } = render(<ExampleComponent />);
    getByText("Example component");
  });
});
