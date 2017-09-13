var PreIcoContract = artifacts.require("./PreIcoContract.sol");
var ImmlaIco = artifacts.require("./ImmlaIco.sol");
var ImmlaToken = artifacts.require("./ImmlaToken.sol");

var accounts = [
    "0xaec3ae5d2be00bfc91597d7a1b2c43818d84396a",
    "0xf1f42f995046e67b79dd5ebafd224ce964740da3",
    "0x918d3ac6c257c4dfe62152989428474c809d1a45",
    "0xcaeed947eeb1124e6cd63281055b0fce192af13f",
    "0xf862ff4b6ad7dd8e4e7a9aa61069faa1c4fd5ac1",
    "0x9f863efb256b43432eddf249dc35bafa13f30366",
    "0xf69c3f9f3fed65aaa0498dfde49cf933a9113084",
    "0xf6e2cc3b874b91e144bc7f1e2989941691eef99c",
    "0x3fb3e8431243cefb88ec1cb8669cd86c29ea9764",
    "0xb338c2fedcaadb6596ea7da5cb37de46c4522ba1",
    "0x05782fd20f1e86effb9cd749b77445a251d3c356",
    "0xa47c1f9f9f9be191e4ad94eb60536f865239ef7f"
];

var manager = accounts[0];
var founder1 = accounts[1];
var founder2 = accounts[2];
var founder3 = accounts[3];
var team = accounts[4];
var bountyOwner = accounts[5];
var hackerVasya = accounts[8];
var escrow = accounts[9];

var oldUser1 = accounts[6];
var oldUser2 = accounts[7];

var value1 = 123456;
var value2 = 789000;

module.exports = function(deployer) {
    return deployer.deploy(PreIcoContract, oldUser1, value1, oldUser2, value2)
        .then(function () {
            return deployer.deploy(ImmlaIco, manager, PreIcoContract.address, 0, 0, 0);
        })
        .then(function () {
            return ImmlaIco.deployed();
        }) 
        .then(function (immlaIco) {
            return immlaIco.init(founder1, founder2, founder3, team, bountyOwner, escrow, {from: manager});
        });
};
