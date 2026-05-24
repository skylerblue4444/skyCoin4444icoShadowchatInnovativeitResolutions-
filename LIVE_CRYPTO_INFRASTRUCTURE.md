# Live Crypto Infrastructure Guide

**Made by Skyler Blue Spillers - Innovative Information Technology Resolutions LLC**

## Complete Implementation for TRUMP, DOGE, BTC, Shadow, SKYCoin4444, Monero, USDT

This document describes the full live crypto infrastructure integrated into the SKY4444 Money Management App (FinTrack).

---

## Supported Coins

| Coin | Symbol | Network | Mining | Staking | Swap | Trade | ICO |
|------|--------|---------|--------|---------|------|-------|-----|
| SkyCoin4444 | SKY4444 | Ethereum | Yes | Yes | Yes | Yes | Yes |
| TRUMP Token | TRUMP | Ethereum | No | Yes | Yes | Yes | No |
| Dogecoin | DOGE | Dogecoin | Yes | No | Yes | Yes | No |
| Bitcoin | BTC | Bitcoin | Yes | No | Yes | Yes | No |
| Shadow Token | SHADOW | Ethereum | Yes | Yes | Yes | Yes | Yes |
| Monero | XMR | Monero | Yes | No | Yes | Yes | No |
| Tether | USDT | Ethereum | No | Yes | Yes | Yes | No |

---

## Features

### Mining
- SHA-256 proof-of-work for SKY4444, Shadow, BTC
- Scrypt for DOGE
- RandomX for Monero (XMR)
- Halving schedules (SKY4444: every 210,000 blocks)
- Real-time mining sessions with hash rate tracking
- Block rewards credited directly to wallet

### Staking
- Multiple pools: 30-day, 90-day, 365-day lock periods
- APY: 5% (USDT) to 25% (SKY4444 365-day)
- Auto-compound option
- Early withdrawal penalty (50% reward loss)
- Total Value Locked (TVL) tracking

### Trading (Spot)
- 12 trading pairs
- Market, Limit, Stop, Stop-Limit orders
- Order book with bids/asks
- 24h volume and price change tracking
- Maker fee: 0.1%, Taker fee: 0.25%

### Token Swap
- Instant swap between any supported coins
- Liquidity pools with slippage calculation
- 0.3% swap fee
- 30-second quote expiry
- Max 5% slippage protection

### ICO / Funding
- 3 funding rounds: Seed ($0.005), Private ($0.008), Public ($0.01)
- Bonus tiers: 5% to 30% based on investment amount
- 90-day vesting period
- Token claiming with vesting schedule
- Hard cap: $10M, Soft cap: $1M

### Wallet
- Multi-coin balances (available, locked, staked, pending)
- Transfer between users
- Escrow holds for marketplace
- Token burn mechanism
- Airdrop distribution
- Full transaction history

### Shop / Marketplace
- Accept all 7 coins as payment
- 2.5% platform fee
- 1% charity fee
- 0.5% burn fee
- Escrow-based transactions
- 7-day dispute resolution

---

## API Endpoints

### Market Data
- `GET /api/crypto/coins` - List all supported coins and pairs
- `GET /api/crypto/prices` - Get current prices
- `GET /api/crypto/orderbook/:pair` - Get order book

### Trading
- `POST /api/crypto/trade/order` - Place order
- `DELETE /api/crypto/trade/order/:id` - Cancel order
- `GET /api/crypto/trade/orders/:userId` - Get user orders
- `GET /api/crypto/trade/history/:userId` - Get trade history

### Swap
- `POST /api/crypto/swap/quote` - Get swap quote
- `POST /api/crypto/swap/execute` - Execute swap

### Mining
- `POST /api/crypto/mining/start` - Start mining session
- `POST /api/crypto/mining/stop` - Stop mining session
- `POST /api/crypto/mining/mine` - Mine a block
- `GET /api/crypto/mining/stats/:coin` - Get mining stats
- `GET /api/crypto/mining/sessions/:userId` - Get user sessions

### Staking
- `GET /api/crypto/staking/pools` - List staking pools
- `POST /api/crypto/staking/stake` - Create staking position
- `POST /api/crypto/staking/unstake` - Withdraw stake
- `POST /api/crypto/staking/claim` - Claim rewards
- `GET /api/crypto/staking/positions/:userId` - Get positions
- `GET /api/crypto/staking/tvl` - Get total value locked

### ICO
- `GET /api/crypto/ico/status` - ICO status and progress
- `GET /api/crypto/ico/rounds` - Funding rounds
- `POST /api/crypto/ico/invest` - Make investment
- `POST /api/crypto/ico/claim` - Claim vested tokens
- `GET /api/crypto/ico/investments/:userId` - User investments
- `GET /api/crypto/ico/stats` - Investor statistics

### Wallet
- `GET /api/crypto/wallet/:userId` - Get balances
- `GET /api/crypto/wallet/:userId/portfolio` - Portfolio summary
- `POST /api/crypto/wallet/transfer` - Transfer coins
- `POST /api/crypto/wallet/buy` - Buy with Stripe
- `GET /api/crypto/wallet/:userId/transactions` - Transaction history

---

## Stripe Integration

**Project:** FinTrack - Money Management App

Environment variables required:
- `STRIPE_PUBLISHABLE_KEY` - For client-side payment forms
- `STRIPE_SECRET_KEY` - For server-side payment processing

Stripe handles:
- Crypto purchases (fiat-to-crypto)
- ICO investments
- Subscription payments (Basic/Pro/Enterprise)
- Marketplace escrow payments
- Refund processing

---

## Deployment

```bash
# Set environment variables
cp .env.example .env
# Edit .env with your actual keys

# Run with Docker
docker-compose -f docker-compose.prod.yml up -d

# Or run directly
pnpm install
pnpm build
pnpm start
```

---

## Security Notes

- Stripe keys stored as environment variables only (never committed)
- All crypto operations require authenticated user
- Escrow system for marketplace protection
- Rate limiting on all API endpoints
- KYC required for investments above $10,000
