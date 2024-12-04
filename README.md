# Incorrect Order of Events in Ownership Transfer Function
This bug demonstrates an issue where the order of operations in an ownership transfer function leads to incorrect behavior.  The `owner` variable is updated *after* the `OwnershipTransferred` event is emitted. This can cause issues for applications relying on the event's immediate accuracy.

## Bug
The `_transferOwnership` function in `bug.sol` demonstrates the error.  The `owner` variable is assigned its new value *after* emitting the `OwnershipTransferred` event.  This means that the emitted event will reflect the *old* owner, not the new one.

## Solution
The solution, in `bugSolution.sol`, corrects the issue by assigning the new owner *before* emitting the `OwnershipTransferred` event.  This ensures the event correctly reflects the current state of ownership.

## How to Reproduce
Compile both `bug.sol` and `bugSolution.sol`.  Deploy contracts based on each file.  Observe the event logs for each upon transferring ownership. The `bug.sol` contract will emit an event with the incorrect owner address.