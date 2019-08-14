pragma solidity ^0.5.10;

// Import the library 'Roles'
import "./Roles.sol";

// Define a contract 'ConsumerRole' to manage this role - add, remove, check
contract ConsumerRole {
  using Roles for Roles.Role;

  // Define 2 events, one for Adding, and other for Removing
  event addConsumer(address _newConsumer);
  event removeConsumer(address _removedConsumer);

  // Define a struct 'consumers' by inheriting from 'Roles' library, struct Role
  Roles private consumers;

  // In the constructor make the address that deploys this contract the 1st consumer
  constructor() public {
    _addConsumer(msg.sender);
  }

  // Define a modifier that checks to see if msg.sender has the appropriate role
  modifier onlyConsumer() {
    require(isConsumer(msg.sender), "You must posses this role.");
    _;
  }

  // Define a function 'isConsumer' to check this role
  function isConsumer(address _account) public view returns (bool) {
    return consumers.has(_account);
  }

  // Define a function 'addConsumer' that adds this role
  function addConsumer(address account) public onlyConsumer {
    consumers.add(msg.sender);
  }

  // Define a function 'renounceConsumer' to renounce this role
  function renounceConsumer() public {
    consumers.remove(msg.sender);
  }

  // Define an internal function '_addConsumer' to add this role, called by 'addConsumer'
  function _addConsumer(address _account) internal {
    consumers.add(_account);
    emit addConsumer(_account);
  }

  // Define an internal function '_removeConsumer' to remove this role, called by 'removeConsumer'
  function _removeConsumer(address _account) internal {
    consumers.remove(_account);
    emit removeConsumer(_account);
  }
}