pragma solidity ^0.5.8;

// Import the library 'Roles'
import "./Roles.sol";

// Define a contract 'DistributorRole' to manage this role - add, remove, check
contract DistributorRole {
  using Roles for Roles.Role;

  // Define 2 events, one for Adding, and other for Removing
  event addDistributor(address _addedDistributor);
  event removeDistributor(address _removedDistributor);

  // Define a struct 'distributors' by inheriting from 'Roles' library, struct Role
  Roles.Role private distributors;

  // In the constructor make the address that deploys this contract the 1st distributor
  constructor() public {
    _addDistributor(msg.sender);
  }

  // Define a modifier that checks to see if msg.sender has the appropriate role
  modifier onlyDistributor() {
    require(isDistributor(msg.sender), "You must posses this role.");
    _;
  }

  // Define a function 'isDistributor' to check this role
  function isDistributor(address _account) public view returns (bool) {
    return distributors.has(_account);
  }

  // Define a function 'addDistributor' that adds this role
  function addDistributor(address _account) public onlyDistributor {
    _addDistributor(_account);
  }

  // Define a function 'renounceDistributor' to renounce this role
  function renounceDistributor() public {
    _removeDistributor(msg.sender);
  }

  // Define an internal function '_addDistributor' to add this role, called by 'addDistributor'
  function _addDistributor(address _account) internal {
    distributors.add(_account);
    emit addDistributor(_account);
  }

  // Define an internal function '_removeDistributor' to remove this role, called by 'removeDistributor'
  function _removeDistributor(address _account) internal {
    distributors.remove(_account);
    emit removeDistributor(_account);
  }
}