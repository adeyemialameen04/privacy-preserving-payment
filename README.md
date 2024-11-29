# Privacy-Preserving Payment Protocol

A smart contract for the Stacks blockchain that enables secure, anonymous transactions using zero-knowledge proofs and Bitcoin settlement.

## Overview

This smart contract implements a privacy-focused payment system with the following features:

- Zero-knowledge proof-based transaction verification
- Commitment-based transaction model
- Double-spending prevention
- Flexible transaction routing
- Comprehensive error handling
- Secure fund management

## Features

### Private Transaction Creation

- Create transactions with commitment hashes
- Specify optional recipients
- Lock funds in the contract

### Proof-based Transaction Claiming

- Claim transactions using zero-knowledge proofs
- Verify proof validity before processing claims

### Double-Spending Prevention

- Implement nullifier mechanism to prevent replay attacks
- Track used nullifiers to ensure each transaction is processed only once

### Flexible Recipient Specification

- Allow transactions with or without specified recipients
- Return funds to sender if no recipient is specified

### Secure Fund Management

- Lock funds during transaction creation
- Release funds only upon valid proof presentation

## Technical Specifications

### Constants

- Error codes for various failure scenarios (e.g., insufficient funds, invalid proof)

### Data Structures

#### Transaction Commitments

```
{
  sender: principal,
  commitment-hash: (buff 32),
  amount: uint,
  recipient: (optional principal),
  claimed: bool
}
```

#### Nullifiers

```
{
  nullifier: (buff 32),
  used: bool
}
```

### Public Functions

- `create-private-transaction`: Create a new private transaction commitment
- `claim-private-transaction`: Claim a private transaction using a zero-knowledge proof
- `receive-stx`: Fallback function to allow the contract to receive STX

### Private Functions

- `verify-zk-proof`: Verify the validity of a zero-knowledge proof
- `valid-commitment-hash?`: Validate the length of a commitment hash
- `valid-nullifier?`: Validate the length of a nullifier

## Security Features

- Comprehensive input validation
- Balance checks to prevent overspending
- Nullifier tracking to prevent double-spending
- Zero-knowledge proof verification for transaction claiming
- Strict access controls on transaction creation and claiming

## Error Codes

| Code | Description |
|------|-------------|
| 1    | Insufficient funds |
| 2    | Invalid proof |
| 3    | Already claimed |
| 4    | Unauthorized |
| 5    | Invalid amount |
| 6    | Invalid commitment hash |
| 7    | Invalid nullifier |

## Installation and Usage

1. Deploy the contract to the Stacks blockchain
2. Create private transactions using `create-private-transaction`
3. Claim transactions with valid zero-knowledge proofs using `claim-private-transaction`
4. Monitor transaction status and handle errors as needed

## Security Considerations

- Zero-knowledge proofs must be properly implemented and verified
- Nullifier uniqueness is crucial for preventing double-spending
- Commitment hashes should be securely generated and managed
- Access to private keys must be strictly controlled

## Use Cases

- Confidential payments
- Privacy-sensitive financial transactions
- Secure value transfer on the Bitcoin layer

## Future Enhancements

- Integration with advanced zero-knowledge proof systems
- Support for more complex transaction types
- Enhanced privacy features such as stealth addresses
- Improved scalability and performance optimizations
