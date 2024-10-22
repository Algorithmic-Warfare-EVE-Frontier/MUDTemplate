//SPDX-License-Identifier: MIT
pragma solidity >=0.8.21;

import { ResourceId } from "@latticexyz/store/src/ResourceId.sol";
import { WorldResourceIdLib } from "@latticexyz/world/src/WorldResourceId.sol";
import { RESOURCE_SYSTEM } from "@latticexyz/world/src/worldResourceTypes.sol";
import { ResourceIds } from "@latticexyz/store/src/codegen/tables/ResourceIds.sol";

import { TEST_SYSTEM_NAME, TEST_DEPLOYMENT_NAMESPACE } from "./constants.sol";

library Utils {
  function testSystemId() internal pure returns (ResourceId) {
    return
      WorldResourceIdLib.encode({
        typeId: RESOURCE_SYSTEM,
        namespace: TEST_DEPLOYMENT_NAMESPACE,
        name: TEST_SYSTEM_NAME
      });
  }
}
