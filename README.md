# Product Registry dApp

**MG3012: Blockchain Technology for Business, Assignment 2**
**Student:** Muhammad Shammas Cheema 24i-5598 · BSFT 5th Semester, Fall 2026
**Instructor:** Dr. Usama Arshad

A small decentralized application (dApp) that lets businesses list products and their prices on the
Ethereum **Sepolia** testnet. It is made of a Solidity smart contract and a single HTML/CSS/JavaScript
page that talks to the contract through **MetaMask** using **ethers.js (v6)**.

## 📍 Deployed Contract

| | |
|---|---|
| **Network** | Sepolia Testnet (chain ID 11155111) |
| **Contract address** | `0xEE76998D256180De6744bb8F5f0b3285044f7046` |
| **Etherscan** | https://sepolia.etherscan.io/address/0xEE76998D256180De6744bb8F5f0b3285044f7046 |

## 🧩 Smart Contract Functions (`SmartContract.sol`)

| Function | Type | What it does |
|---|---|---|
| `addProduct(string _name, uint256 _price)` | Write | Lists a new product. The caller becomes its seller. Emits `ProductAdded`. |
| `updatePrice(uint256 _id, uint256 _newPrice)` | Write | Changes a product's price. Only that product's seller can do this. Emits `PriceUpdated`. |
| `getProduct(uint256 _id)` | Read | Returns the product's name, price and seller address. |
| `getProductCount()` | Read | Returns how many products have been listed. |
| `owner()` | Read | Returns the address that deployed the contract. |

Validation with `require`: the name can't be empty, the price must be above 0, the product ID must exist,
and only the seller can update a price.

## 📂 Project Structure

```
├── SmartContract.sol   # Solidity smart contract
├── index.html          # Frontend (HTML + JavaScript with ethers.js)
├── style.css           # Styling
├── logo.svg            # Logo image used on the page
├── README.md           # This file
└── screenshots/        # Deployment and UI screenshots
```

## ⚙️ Setup & Running

### Requirements
- Google Chrome (or another browser) with the **MetaMask** extension
- Some **Sepolia test ETH** in your MetaMask wallet (from a Sepolia faucet)
- **VS Code** with the **Live Server** extension (or any local web server)

### 1. Deploy the contract (Remix IDE)
1. Open https://remix.ethereum.org and create a file named `SmartContract.sol`, then paste in the code.
2. **Solidity Compiler** tab → pick compiler `0.8.20` or newer → **Compile SmartContract.sol**.
3. **Deploy & Run Transactions** tab → Environment: **Injected Provider - MetaMask** (MetaMask on Sepolia).
4. Pick the contract `ProductRegistry` → **Deploy** → confirm in MetaMask.
5. Copy the deployed contract address.

### 2. Run the frontend
1. Open `index.html` and paste your address into the line
   `const CONTRACT_ADDRESS = "0x...";`
2. Open the project folder in VS Code → right-click `index.html` → **Open with Live Server**.
   (MetaMask doesn't work on pages opened by double-clicking the file, so a local server is needed.)
3. Click **Connect MetaMask**, approve, and then add products, update prices and refresh the list.

## 🖼️ Screenshots

### 1. Contract deployed on Sepolia (Remix + MetaMask)
![Deployment](screenshots/1-deployment.png)

### 2. Frontend connected to MetaMask
![Wallet connected](screenshots/2-connected.png)

### 3. Transaction confirmed and product shown in the list
![Transaction](screenshots/3-transaction.png)

## 🛠️ Technologies Used
- Solidity ^0.8.20
- Remix IDE
- MetaMask
- ethers.js v6
- HTML, CSS, JavaScript
- Sepolia Testnet & Etherscan
