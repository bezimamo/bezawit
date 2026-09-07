import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'models/login_response.dart';

const Color kRed = Color(0xFFD90000);

class HomePage extends StatelessWidget {
  final UserModel user;

  const HomePage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── Top bar ─────────────────────────────────────────
              Row(
                children: [
                  Container(
                    width: 42,
                    height: 42,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.08),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        'AM',
                        style: const TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Row(
                      children: [
                        const Text(
                          'Good Morning,',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(width: 6),
                        Flexible(
                          child: Text(
                            user.name.split(' ').first,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                        const SizedBox(width: 4),
                        const Text('👋', style: TextStyle(fontSize: 16)),
                      ],
                    ),
                  ),
                  Container(
                    width: 42,
                    height: 42,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.08),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        const Icon(
                          Icons.notifications_outlined,
                          size: 24,
                          color: Colors.black87,
                        ),
                        Positioned(
                          top: 8,
                          right: 8,
                          child: Container(
                            width: 7,
                            height: 7,
                            decoration: const BoxDecoration(
                              color: kRed,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // ── Card 1: Red balance card ─────────────────────────
              _buildRedCard(),
              const SizedBox(height: 12),

              // ── Card 2: Services grid ────────────────────────────
              _buildServicesCard(),
              const SizedBox(height: 12),

              // ── Card 3: Transactions ─────────────────────────────
              _buildTransactionsCard(),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  // ── Red Balance Card ───────────────────────────────────────────────────────
  Widget _buildRedCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: kRed,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.10),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Main Balance',
                      style: TextStyle(color: Colors.white70, fontSize: 14),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '* * * * * * * *',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        letterSpacing: 3,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade700,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Icon(Icons.add, color: Colors.white, size: 14),
                    ),
                    const SizedBox(width: 6),
                    const Text(
                      'Add Money',
                      style: TextStyle(color: Colors.white, fontSize: 13),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Reward Balance',
                        style: TextStyle(color: Colors.white70, fontSize: 13)),
                    const SizedBox(height: 6),
                    Row(
                      children: List.generate(
                        4,
                        (i) => Container(
                          margin: const EdgeInsets.only(right: 5),
                          width: 9,
                          height: 9,
                          decoration: const BoxDecoration(
                              color: Colors.white, shape: BoxShape.circle),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('Gift Balance',
                        style: TextStyle(color: Colors.white70, fontSize: 13)),
                    const SizedBox(height: 6),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        4,
                        (i) => Container(
                          margin: const EdgeInsets.only(right: 5),
                          width: 9,
                          height: 9,
                          decoration: const BoxDecoration(
                              color: Colors.white, shape: BoxShape.circle),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: const Icon(Icons.remove_red_eye_outlined,
                      color: Colors.white70, size: 24),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  // ── Services Card ──────────────────────────────────────────────────────────
  Widget _buildServicesCard() {
    final services = [
      {'icon': Iconsax.shop, 'label': 'Merchant\nPayment'},
      {'icon': Iconsax.receipt_2, 'label': 'Bill\nPayment'},
      {'icon': Iconsax.medal_star, 'label': 'Credit &\nSaving'},
      {'icon': Iconsax.send_2, 'label': 'Transfer\nMoney'},
      {'icon': Iconsax.mobile, 'label': 'Airtime/\nPackage'},
      {'icon': Iconsax.more_circle, 'label': 'More\nServices'},
    ];

    Widget item(Map s) => Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(s['icon'] as IconData, color: kRed, size: 28),
              const SizedBox(height: 6),
              Text(
                s['label'] as String,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 10,
                  color: Colors.black87,
                  height: 1.3,
                ),
              ),
            ],
          ),
        );

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(children: [item(services[0]), item(services[1]), item(services[2])]),
          const SizedBox(height: 20),
          Row(children: [item(services[3]), item(services[4]), item(services[5])]),
        ],
      ),
    );
  }

  // ── Transactions Card ──────────────────────────────────────────────────────
  Widget _buildTransactionsCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.06),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Transactions',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              Text(
                'See all',
                style: TextStyle(
                  fontSize: 13,
                  color: kRed,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Transaction 1 — CBE / Aster Merchant
          _txItem(
            iconBg: const Color(0xFF1565C0),
            icon: Icons.account_balance,
            name: 'Aster Merchant',
            sub: 'Bank',
            amount: '+234,500',
            amountColor: Colors.green,
            date: 'Today',
          ),
          const SizedBox(height: 12),

          // Transaction 2 — M-PESA / Henok Chala
          _txItem(
            iconBg: kRed,
            icon: Icons.phone_android,
            name: 'Henok Chala',
            sub: 'Airtime',
            amount: '-1,000.00',
            amountColor: Colors.black87,
            date: 'Today',
          ),
          const SizedBox(height: 12),

          // Transaction 3 — M-PESA / Henok Chala
          _txItem(
            iconBg: kRed,
            icon: Icons.phone_android,
            name: 'Henok Chala',
            sub: 'M-PESA',
            amount: '-100',
            amountColor: Colors.black87,
            date: 'Today',
          ),
        ],
      ),
    );
  }

  Widget _txItem({
    required Color iconBg,
    required IconData icon,
    required String name,
    required String sub,
    required String amount,
    required Color amountColor,
    required String date,
  }) {
    return Row(
      children: [
        // Icon circle
        Container(
          width: 40,
          height: 40,
          child: Center(
            child: Icon(icon, color: iconBg, size: 28),
          ),
        ),
        const SizedBox(width: 12),
        // Name + sub
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w600)),
              const SizedBox(height: 2),
              Text(sub,
                  style: const TextStyle(
                      fontSize: 12, color: Colors.grey)),
            ],
          ),
        ),
        // Amount + date
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              amount,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: amountColor,
              ),
            ),
            const SizedBox(height: 2),
            const Text('Today',
                style: TextStyle(fontSize: 11, color: Colors.grey)),
          ],
        ),
      ],
    );
  }
}
