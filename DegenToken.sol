// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "hardhat/console.sol";

contract DegenToken is ERC20, Ownable, ERC20Burnable {
    constructor() ERC20("Degen", "DGN") {
        // Initialize the store with 20 fruit items.
        initializeStore();
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function decimals() override public pure returns (uint8) {
        return 0;
    }

    function getBalance() external view returns (uint256) {
        return balanceOf(msg.sender);
    }

    function transferTokens(address _receiver, uint256 _value) external {
        require(balanceOf(msg.sender) >= _value, "You do not have enough Degen Tokens");
        approve(msg.sender, _value);
        transferFrom(msg.sender, _receiver, _value);
    }

    function burnTokens(uint256 _value) external {
        require(balanceOf(msg.sender) >= _value, "You do not have enough Degen Tokens");
        _burn(msg.sender, _value);
    }

    struct FruitItem {
        string name;
        uint256 price;
        bool available;
    }

    mapping(uint256 => FruitItem) public PriceAndAvailability;

    function initializeStore() private {
        string[20] memory fruitNames = [
            "Apple", "Banana", "Cherry", "Grape", "Lemon", "Mango", "Orange", "Peach", "Pear", "Pineapple",
            "Plum", "Strawberry", "Watermelon", "Kiwi", "Blueberry", "Raspberry", "Cantaloupe", "Coconut", "Pomegranate", "Fig"
        ];

        for (uint256 i = 1; i <= 20; i++) {
            uint256 price = uint256(keccak256(abi.encodePacked(block.timestamp, i))) % 21 + 10;
            PriceAndAvailability[i] = FruitItem(fruitNames[i - 1], price, true);
        }
    }

    // Define a struct to hold item information
    struct ItemInfo {
        uint256 itemNumber;
        string itemName;
    }

    function getItemList() public view returns (ItemInfo[] memory) {
        ItemInfo[] memory availableItems = new ItemInfo[](20);

        for (uint256 i = 1; i <= 20; i++) {
            if (PriceAndAvailability[i].available) {
                availableItems[i - 1] = ItemInfo(i, PriceAndAvailability[i].name);
            }
        }

        return availableItems;
    }

    mapping(address => uint256[]) private ownedItems;

    function getOwnedItems() external view returns (ItemInfo[] memory) {
        uint256[] storage userOwnedItems = ownedItems[msg.sender];
        ItemInfo[] memory items = new ItemInfo[](userOwnedItems.length);

        for (uint256 i = 0; i < userOwnedItems.length; i++) {
            uint256 itemNumber = userOwnedItems[i];
            items[i] = ItemInfo(itemNumber, PriceAndAvailability[itemNumber].name);
        }

        return items;
    }

    function redeemTokens(uint256 itemNumber) external returns (bool) {
        require(balanceOf(msg.sender) >= PriceAndAvailability[itemNumber].price, "Insufficient balance");
        require(itemNumber >= 1 && itemNumber <= 20, "Invalid item number");
        require(PriceAndAvailability[itemNumber].available, "Item not available");

        // Implement your logic to transfer the item to the user here.
        // Ensure that you transfer the item to msg.sender.

        // Mark the item as unavailable
        PriceAndAvailability[itemNumber].available = false;

        // Add the item to the user's owned items
        ownedItems[msg.sender].push(itemNumber);

        // Burn the tokens used for the purchase.
        _burn(msg.sender, PriceAndAvailability[itemNumber].price);

        return true;
    }
}

