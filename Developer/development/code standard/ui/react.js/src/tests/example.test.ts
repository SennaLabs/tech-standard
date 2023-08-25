import { expect, test } from "vitest";
import { example } from "libs/util";

test("example", () => {
  expect(example()).toBe(1);
});
