// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title ProductRegistry - a simple on-chain product catalogue for small businesses
/// @notice Anyone can list a product; only the seller who listed it can change its price.
contract ProductRegistry {
    struct Product {
        string name;
        uint256 price;   // price in PKR (whole rupees)
        address seller;  // wallet that listed the product
    }

    address public owner;          // the account that deployed the contract
    Product[] private products;    // all listed products (id = array index)

    event ProductAdded(uint256 indexed id, string name, uint256 price, address indexed seller);
    event PriceUpdated(uint256 indexed id, uint256 oldPrice, uint256 newPrice);

    constructor() {
        owner = msg.sender;
    }

    /// WRITE: list a new product
    function addProduct(string calldata _name, uint256 _price) external {
        require(bytes(_name).length > 0, "Product name is required");
        require(_price > 0, "Price must be greater than zero");

        products.push(Product(_name, _price, msg.sender));
        emit ProductAdded(products.length - 1, _name, _price, msg.sender);
    }

    /// WRITE: change the price of a product you listed
    function updatePrice(uint256 _id, uint256 _newPrice) external {
        require(_id < products.length, "Product does not exist");
        require(products[_id].seller == msg.sender, "Only the seller can update the price");
        require(_newPrice > 0, "Price must be greater than zero");

        uint256 oldPrice = products[_id].price;
        products[_id].price = _newPrice;
        emit PriceUpdated(_id, oldPrice, _newPrice);
    }

    /// READ: get one product's details
    function getProduct(uint256 _id)
        external
        view
        returns (string memory name, uint256 price, address seller)
    {
        require(_id < products.length, "Product does not exist");
        Product storage p = products[_id];
        return (p.name, p.price, p.seller);
    }

    /// READ: how many products have been listed
    function getProductCount() external view returns (uint256) {
        return products.length;
    }
}
