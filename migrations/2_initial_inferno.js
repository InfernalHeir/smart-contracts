const Inferno = artifacts.require("../contracts/Inferno.sol");

module.exports =  (deployer) => {
     deployer.deploy(Inferno);   
}