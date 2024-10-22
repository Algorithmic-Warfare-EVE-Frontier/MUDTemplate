// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0;
import { Script } from "forge-std/Script.sol";
import { console } from "forge-std/console.sol";
import { ResourceId, WorldResourceIdLib } from "@latticexyz/world/src/WorldResourceId.sol";
import { StoreSwitch } from "@latticexyz/store/src/StoreSwitch.sol";
import { IBaseWorld } from "@latticexyz/world/src/codegen/interfaces/IBaseWorld.sol";

import { Utils } from "../src/systems/test/Utils.sol";
import { TestSystem } from "../src/systems/test/TestSystem.sol";
import { IWorld } from "../src/codegen/world/IWorld.sol";

contract Test is Script {
  function run(address worldAddress) external {
    // Load the private key from the `PRIVATE_KEY` environment variable (in .env)
    uint256 playerPrivateKey = vm.envUint("PLAYER_PRIVATE_KEY");
    vm.startBroadcast(playerPrivateKey);

    StoreSwitch.setStoreAddress(worldAddress);
    IBaseWorld world = IBaseWorld(worldAddress);


    ResourceId systemId = Utils.testSystemId();

    //The method below will change based on the namespace you have configurd. If the namespace is changed, make sure to update the method name

    bool check = abi.decode(world.call(
      systemId,
      abi.encodeCall(TestSystem.getCheck, ())
    ), (bool));

    console.logBool(check);
    

    world.call(
      systemId,
      abi.encodeCall(TestSystem.toggleCheck, ())
    );

    vm.stopBroadcast();
  }
}
