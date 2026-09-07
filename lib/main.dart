import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home_page.dart';

const Color kRed = Color(0xFFD90000);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Safaricom',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      ),
      home: const SignInPage(),
    );
  }
}

// ─── Sign In Page ───────────────────────────────────────────────────────────

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const PinPage()),
                );
              },
              child: const Text(
                'Sign in',
                style: TextStyle(
                  color: kRed,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'M-PESA NO.',
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
            const SizedBox(height: 16),
            const Text(
              'SIGNING IN',
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}

// ─── PIN Entry Page ──────────────────────────────────────────────────────────

class PinPage extends StatefulWidget {
  const PinPage({super.key});

  @override
  State<PinPage> createState() => _PinPageState();
}

class _PinPageState extends State<PinPage> {
  String _pin = '';

  void _onKey(String value) {
    setState(() {
      if (value == 'x') {
        if (_pin.isNotEmpty) _pin = _pin.substring(0, _pin.length - 1);
      } else if (_pin.length < 4) {
        _pin += value;
      }
    });
  }

  Widget _buildPinDots() {
    // active = the next empty box (cursor position)
    final int activeIndex = _pin.length < 4 ? _pin.length : 3;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(4, (i) {
        final filled = i < _pin.length;
        final isActive = i == activeIndex && _pin.length < 4;
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: isActive ? kRed : Colors.grey.shade400,
              width: isActive ? 2 : 1.5,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Center(
            child: filled
                ? Container(
                    width: 14,
                    height: 14,
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                    ),
                  )
                : isActive
                    ? const Text(
                        '|',
                        style: TextStyle(
                          color: kRed,
                          fontSize: 22,
                          fontWeight: FontWeight.w300,
                        ),
                      )
                    : null,
          ),
        );
      }),
    );
  }

  Widget _buildKey(String label) {
    return Expanded(
      child: GestureDetector(
        onTap: () => _onKey(label),
        child: Container(
          margin: const EdgeInsets.all(4),
          height: 56,
          child: Center(
            child: label == 'x'
                ? const Icon(Icons.backspace_outlined, size: 22)
                : Text(
                    label,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
          ),
        ),
      ),
    );
  }

  Widget _buildKeyboard() {
    final rows = [
      ['1', '2', '3'],
      ['4', '5', '6'],
      ['7', '8', '9'],
    ];

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade200,
            blurRadius: 8,
            spreadRadius: 2,
          ),
        ],
        border: Border.all(color: Colors.grey.shade200),
      ),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
      child: Column(
        children: [
          ...rows.map((row) {
            return Row(
              children: row.map(_buildKey).toList(),
            );
          }),
          // last row: empty | 0 | x
          Row(
            children: [
              const Expanded(child: SizedBox()),
              _buildKey('0'),
              _buildKey('x'),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
        children: [
          // Red header
          Container(
            width: double.infinity,
            color: kRed,
            padding: const EdgeInsets.only(top: 40, bottom: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Language switcher — top left
                Padding(
                  padding: const EdgeInsets.only(left: 16, bottom: 16),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(Icons.language, color: Colors.white, size: 16),
                      SizedBox(width: 4),
                      Text(
                        'English',
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                      SizedBox(width: 2),
                      Icon(Icons.keyboard_arrow_down, color: Colors.white, size: 16),
                    ],
                  ),
                ),
                // M-PESA centered
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'M',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2,
                            ),
                          ),
                          SizedBox(width: 2),
                          Icon(Iconsax.mobile, color: Colors.white, size: 18),
                          SizedBox(width: 2),
                          Text(
                            'PESA',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'ለሁሉም',
                        style: GoogleFonts.notoSansEthiopic(
                          color: Colors.white70,
                          fontSize: 8,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                // Profile row
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 2),
                      ),
                      child: CircleAvatar(
                        radius: 32,
                        backgroundImage: AssetImage('assets/zemedkun.jpeg'),
                      ),
                    ),
                    const SizedBox(width: 14),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome Back',
                          style: TextStyle(fontSize: 13, color: Colors.white70),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Zemedkun Kidane',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          '+251711234577',
                          style: TextStyle(fontSize: 13, color: Colors.white70),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Lock icon + label
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.lock, color: Colors.black87, size: 16),
              SizedBox(width: 8),
              Text(
                'ENTER YOUR M-PESA PIN',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.normal,
                  color: Colors.black87,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          // PIN dots
          _buildPinDots(),

          const SizedBox(height: 32),

          // Keyboard
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: _buildKeyboard(),
          ),

          const SizedBox(height: 24),

          // Continue button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: kRed,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const HomePage()),
                  );
                },
                child: const Text(
                  'Continue',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 24),

          // Footer links
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Text(
                  'Forgot PIN?',
                  style: TextStyle(
                    color: kRed,
                    fontSize: 12,
                  ),
                ),
                Text('|', style: TextStyle(color: Colors.grey)),
                Text(
                  'Contact Us',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 12,
                  ),
                ),
                Text('|', style: TextStyle(color: Colors.grey)),
                Text(
                  'Terms & Conditions',
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 32),
        ],
      ),
    ),
    );
  }
}
