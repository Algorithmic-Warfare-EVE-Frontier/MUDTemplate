import { defineWorld } from "@latticexyz/world";

export default defineWorld({
  namespace: "test",
  systems: {
    TestSystem: {
      name: "TestSystem",
      openAccess: true,
    },
  },
  tables: {
    Test: {
      schema: {
        addr: "address",
        check: "bool",
      },
      key: ["addr"],
    },
  },
});
