;;-----------------------------------------------------------------
;; title: Privacy-Preserving Payment Protocol
;;-----------------------------------------------------------------

;; summary: A Stacks-based private payment system leveraging zero-knowledge proofs 
;; and Bitcoin settlement for secure, anonymous transactions

;;-----------------------------------------------------------------
;; description: 
;; Implements a privacy-focused payment protocol with:
;; - Zero-knowledge proof-based transaction verification
;; - Commitment-based transaction model
;; - Double-spending prevention 
;; - Flexible transaction routing
;; - Comprehensive error handling
;; - Secure fund management
;;
;; Key Features:
;; - Private transaction creation
;; - Proof-based transaction claiming
;; - Nullifier mechanism to prevent replay attacks
;; - Optional recipient specification
;; - Fallback STX receiving
;;
;; Security Considerations:
;; - Validates transaction amounts
;; - Checks sender balance
;; - Implements strict access controls
;; - Uses commitment-based architecture
;; - Provides granular error reporting
;;
;; Use Cases:
;; - Confidential payments
;; - Privacy-sensitive financial transactions
;; - Secure value transfer on Bitcoin layer
;;-----------------------------------------------------------------

;; Error constants for precise transaction failure reporting
(define-constant ERR-INSUFFICIENT-FUNDS (err u1))
(define-constant ERR-INVALID-PROOF (err u2))
(define-constant ERR-ALREADY-CLAIMED (err u3))
(define-constant ERR-UNAUTHORIZED (err u4))
(define-constant ERR-INVALID-AMOUNT (err u5))
(define-constant ERR-INVALID-COMMITMENT-HASH (err u6))
(define-constant ERR-INVALID-NULLIFIER (err u7))

;; Track private transaction commitments
(define-map TransactionCommitments
  {
    sender: principal,
    commitment-hash: (buff 32)
  }
  {
    amount: uint,
    recipient: (optional principal),
    claimed: bool
  }
)

;; Prevent transaction replay attacks
(define-map Nullifiers 
  {
    nullifier: (buff 32)
  }
  bool
)

