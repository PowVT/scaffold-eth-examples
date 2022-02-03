pragma solidity ^0.8.4;
//SPDX-License-Identifier: MIT
//Author: evan@adaptiveresources.io

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract PriceConsumerV3 {
    AggregatorV3Interface internal priceFeed;

    int256 public weight;
    int256 public purity;
    int256 public _value;

    constructor() {
        priceFeed = AggregatorV3Interface(
            0x4a5AB0F60d12a4420d36D3eD9A1F77d8c47EB94c
        );
    }

    /**
     * Returns the latest GOLD price on xDai
     */
    function getThePrice() public view returns (int256) {
        // all values but price can be left out if we don't use them
        (, int256 price, , , ) = priceFeed.latestRoundData();
        return price;
    }

    function setWeight(int256 _newWeight) public {
        weight = _newWeight * 10**18;
    }

    function setPurity(int256 _newPurity) public {
        purity = _newPurity * 10**18;
    }

    function setValue() public returns (int256) {
        int256 currentGoldPrice = getThePrice();
        int256 pureValue = (weight * (purity / 100));
        int256 value = (pureValue / 10**18) * (currentGoldPrice / 10**8);

        _value = value;

        return (value);
    }
}
