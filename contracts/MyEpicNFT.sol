// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

// We first import some OpenZeppelin Contracts.
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "hardhat/console.sol";

// We inherit the contract we imported. This means we'll have access
// to the inherited contract's methods.
contract MyEpicNFT is ERC721URIStorage {
    // Magic given to us by OpenZeppelin to help us keep track of tokenIds.
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    string baseSvg =
        "<svg xmlns='http://www.w3.org/2000/svg' preserveAspectRatio='xMinYMin meet' viewBox='0 0 350 350'><style>.base { fill: white; font-family: serif; font-size: 24px; }</style><rect width='100%' height='100%' fill='black' /><text x='50%' y='50%' class='base' dominant-baseline='middle' text-anchor='middle'>";

    string[] firstWords = [
        "Fancy",
        "Humorous",
        "Evil",
        "Scandalous",
        "Anonymous",
        "Hot",
        "Beautiful",
        "Dull",
        "Abstract",
        "Fruitful",
        "Convex",
        "Optimal",
        "Colorful",
        "Eccentric",
        "Righteous"
    ];
    string[] secondWords = [
        "Sock",
        "Turtle Neck",
        "fork",
        "Shoe",
        "Snake",
        "Coffee",
        "Lasagna",
        "Pancake",
        "Oat",
        "Vanilla",
        "Cougar",
        "Cat"
        "Camel",
        "Eagle",
        "Cryptographer"
    ];
    string[] thirdWords = [
        "Company",
        "Factory",
        "Overlord",
        "Servent",
        "Plebian",
        "Simp",
        "God",
        "Mobile",
        "Peasant",
        "Man",
        "Women",
        "Servant",
        "King",
        "Celestial Body",
        "Joke"
    ];

    // We need to pass the name of our NFTs token and its symbol.
    constructor() ERC721("TurtleNeckNFT", "NECK") {
        console.log("This is my NFT contract. Woah!");
    }

    // A function our user will hit to get their NFT.
    function makeAnEpicNFT() public {
        // Get the current tokenId, this starts at 0.
        uint256 newItemId = _tokenIds.current();

        // Actually mint the NFT to the sender using msg.sender.
        _safeMint(msg.sender, newItemId);

        // Set the NFTs data.
        _setTokenURI(
            newItemId,
            "data:application/json;base64,eyJuYW1lIjoiVHVydGxlTmVja0dvZCIsImRlc2NyaXB0aW9uIjoiQW4gTkZUIGZyb20gdGhlIGhpZ2hseSBhY2NsYWltZWQgVHVydGxlIE5lY2sgR29kcyIsImltYWdlIjoiZGF0YTppbWFnZS9zdmcreG1sO2Jhc2U2NCxQSE4yWnlCNGJXeHVjejBpYUhSMGNEb3ZMM2QzZHk1M015NXZjbWN2TWpBd01DOXpkbWNpSUhCeVpYTmxjblpsUVhOd1pXTjBVbUYwYVc4OUluaE5hVzVaVFdsdUlHMWxaWFFpSUhacFpYZENiM2c5SWpBZ01DQXpOVEFnTXpVd0lqNEtJQ0FnSUR4emRIbHNaVDR1WW1GelpTQjdJR1pwYkd3NklIZG9hWFJsT3lCbWIyNTBMV1poYldsc2VUb2djMlZ5YVdZN0lHWnZiblF0YzJsNlpUb2dNVFJ3ZURzZ2ZUd3ZjM1I1YkdVK0NpQWdJQ0E4Y21WamRDQjNhV1IwYUQwaU1UQXdKU0lnYUdWcFoyaDBQU0l4TURBbElpQm1hV3hzUFNKaWJHRmpheUlnTHo0S0lDQWdJRHgwWlhoMElIZzlJalV3SlNJZ2VUMGlOVEFsSWlCamJHRnpjejBpWW1GelpTSWdaRzl0YVc1aGJuUXRZbUZ6Wld4cGJtVTlJbTFwWkdSc1pTSWdkR1Y0ZEMxaGJtTm9iM0k5SW0xcFpHUnNaU0krVkhWeWRHeGxUbVZqYTBkdlpEd3ZkR1Y0ZEQ0S1BDOXpkbWMrIn0="
        );
        console.log(
            "An NFT w/ ID %s has been minted to %s",
            newItemId,
            msg.sender
        );

        // Increment the counter for when the next NFT is minted.
        _tokenIds.increment();
    }
}
