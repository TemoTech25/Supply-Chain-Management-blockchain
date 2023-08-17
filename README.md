# Supply Chain Management Blockchain Contracts

Welcome to the Supply Chain Management Blockchain Contracts repository! This project consists of smart contracts that enable a secure and transparent supply chain management system, ensuring product authenticity, tracking movement, and facilitating financial transactions between stakeholders.

## AuthenticityContract

The `AuthenticityContract` verifies product authenticity and allows authorized checkpoints.

### Features:
- Authorized Checkpoints: Owner designates authorized checkpoints for the product.
- Adding Checkpoints: Only the owner can add new authorized checkpoints.
- Product Authenticity Verification: Verifies if a checkpoint is authorized for a product.

## TrackingContract

The `TrackingContract` records product movement and location updates.

### Features:
- Location Updates: Authorized parties update product location with timestamp and name.
- Security: Only authorized parties can update product location.
- Current Location Retrieval: Get the latest product location.

## PaymentsContract

The `PaymentsContract` handles secure financial transactions among stakeholders.

### Features:
- Deposit Funds: Stakeholders deposit funds into their contract accounts.
- Send Payments: Stakeholders send secure payments to others.
- Balance Inquiry: Check account balances.

## How to Use

1. Deploy the contracts on Ethereum network using Remix.
2. Access contract functions through Remix, providing required inputs.
3. Use `AuthenticityContract` to manage checkpoints and verify authenticity.
4. Utilize `TrackingContract` to update and retrieve product movement.
5. Use `PaymentsContract` for secure financial transactions.

Explore functions and experiment with contracts in Remix. Happy supply chain management!

## License

This project is licensed under the MIT License - see [LICENSE](LICENSE) for details.

---
*Disclaimer: Simplified explanation for education. Actual implementations may involve additional considerations and security measures.*
