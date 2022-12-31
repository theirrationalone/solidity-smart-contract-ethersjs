const fs = require("fs");
const { ethers } = require("ethers");
require("dotenv").config();

const encrypt = async () => {
    console.log("\x1b[33mEncrypting Wallet, Please Wait...\x1b[0m");
    const wallet = new ethers.Wallet(process.env.METAMASK_PRIVATE_KEY);
    const encryptedWallet = await wallet.encrypt(process.env.WALLET_PASSWORD);
    console.log("\x1b[32mWallet Encrypted Successfully!");
    console.log("\x1b[33mSaving Encrypted Wallet into File System, Please wait...\x1b[0m");
    fs.writeFileSync("./.encryptedJson.json", encryptedWallet, "utf8");
    console.log("\x1b[32mEncrypted Json Key Saved into FileSystem Successfully!\x1b[0m");
};

encrypt()
    .then(() => process.exit(0))
    .catch((err) => {
        console.log(`\x1b[31mdeploy.js -- ERROR: ${err} \x1b[0m`);
        process.exit(1);
    });
