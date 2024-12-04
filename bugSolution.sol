function transferOwnership(newOwner) {
  require(newOwner != address(0), "Ownable: new owner is the zero address");
  _transferOwnership(newOwner);
}

function _transferOwnership(newOwner) {
  owner = newOwner; //Corrected to update before emit
  emit OwnershipTransferred(owner, newOwner);
}