const HelloWorld = artifacts.require("prodinfo");

module.exports = function(deployer) {
  deployer.deploy(HelloWorld);
};
