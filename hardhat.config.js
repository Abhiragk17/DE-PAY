
require("@nomiclabs/hardhat-ethers");
require("@nomiclabs/hardhat-etherscan");

module.exports = {
    defaultNetwork: "polygon_mumbai",
    networks: {
        hardhat: {
        },
        polygon_mumbai: {
            url: "https://rpc-mumbai.maticvigil.com",
            accounts: ["cdb947a33af169c551aba407b69d9a4fad5fe6155e76e377fdc8e24c9dad8f16"]
        }
    },
    etherscan: {
        apiKey: "9E51FJ3P8RQKE28GV59X6UB6Y1AH8CKM2N"
    },
    solidity: {
        version: "0.8.9",
        settings: {
            optimizer: {
                enabled: true,
                runs: 200
            }
        }
    },
}
