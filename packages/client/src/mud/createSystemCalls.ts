/*
 * Create the system calls that the client can use to ask
 * for changes in the World state (using the System contracts).
 */

import { SetupNetworkResult } from "./setupNetwork";

export type SystemCalls = ReturnType<typeof createSystemCalls>;

export function createSystemCalls(
  /*
   * The parameter list informs TypeScript that:
   *
   * - The first parameter is expected to be a
   *   SetupNetworkResult, as defined in setupNetwork.ts
   *
   *   Out of this parameter, we care about the following fields:
   *   - worldContract (which comes from getContract, see
   *     https://github.com/latticexyz/mud/blob/main/templates/react/packages/client/src/mud/setupNetwork.ts#L63-L69).
   *
   *   - useStore
   *   - tables
   */
  { worldContract, useStore, tables }: SetupNetworkResult
) {
  const toggleCheck = async () => {
    await worldContract.write.test__toggleCheck();
  };

  const getChecks = async () => {
    return useStore.getState().getRecords(tables.Test);
  };

  return {
    toggleCheck,
    getChecks,
  };
}
