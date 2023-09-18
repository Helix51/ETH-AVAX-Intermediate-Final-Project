# DegenToken ERC-20 Contract

This is the README file for the DegenToken ERC-20 contract. DegenToken is a simple ERC-20 token contract that also includes functionality for minting, burning, and a unique item redemption system.

## Contract Details

- **Token Name:** Degen
- **Token Symbol:** DGN
- **Decimals:** 0

## Features

1. **Minting Tokens:** Only the owner of the contract can mint new Degen tokens.

2. **Burning Tokens:** Tokens can be burned by the token holder.

3. **Check Balance:** You can check your Degen token balance.

4. **Transfer Tokens:** Transfer Degen tokens to another address.

5. **Redeem Items:** You can redeem unique fruit items using your Degen tokens. Each item has a randomly generated price.

## Item Redemption

The contract includes an item redemption system. There are 20 unique fruit items that you can redeem using your Degen tokens. Each item has a randomly generated price, making it a fun and unpredictable feature.

To redeem an item:

- Ensure you have enough Degen tokens to cover the item's price.
- Call the `redeemTokens` function with the item number as a parameter.

Once redeemed:

- The item becomes unavailable for future redemptions.
- The item is added to your owned items.
- The tokens used for the purchase are burned.

## Usage

To interact with this contract, you can use a tool like [MyEtherWallet](https://www.myetherwallet.com/) or [MetaMask](https://metamask.io/).

### Deploying the Contract

You can deploy this contract on an Ethereum testnet or mainnet. The contract is written in Solidity version 0.8.18.

### Interacting with the Contract

1. **Minting Tokens:** Only the contract owner can mint tokens. Use the `mint` function to mint tokens to a specific address.

2. **Burning Tokens:** Use the `burnTokens` function to burn your own tokens.

3. **Checking Balance:** Use the `getBalance` function to check your Degen token balance.

4. **Transferring Tokens:** Use the `transferTokens` function to transfer tokens to another address.

5. **Redeeming Items:** Use the `redeemTokens` function to redeem fruit items by specifying the item number.

6. **Getting Item List:** Use the `getItemList` function to get a list of available fruit items.

7. **Getting Owned Items:** Use the `getOwnedItems` function to get a list of fruit items owned by your address.

## Development

This contract uses OpenZeppelin libraries for ERC-20 token functionality. You can find more information about OpenZeppelin [here](https://openzeppelin.com/contracts/).

## License

This contract is provided under the MIT License. You can find the full license text in the SPDX-License-Identifier comment at the beginning of the contract code.

---

**Disclaimer:** This contract is provided for educational and demonstration purposes only. Be cautious when interacting with smart contracts, and make sure to thoroughly understand the code and its implications before using it on the Ethereum mainnet.
