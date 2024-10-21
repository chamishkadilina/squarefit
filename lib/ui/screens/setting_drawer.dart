import 'package:flutter/material.dart';

class SettingDrawer extends StatelessWidget {
  const SettingDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: const [
            _DrawerTitle(),
            Divider(),
            _PremiumBanner(),
            Divider(),
            _SupportSection(),
          ],
        ),
      ),
    );
  }
}

// Drawer Title Widget
class _DrawerTitle extends StatelessWidget {
  const _DrawerTitle();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Text(
        'Settings',
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 22,
              color: Colors.black87,
            ),
      ),
    );
  }
}

// Premium Banner Widget with improved UI
class _PremiumBanner extends StatelessWidget {
  const _PremiumBanner();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // goto premium billing screen
      },
      child: Container(
        height: 140,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.orange.shade300, Colors.orange.shade600],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(
                Icons.workspace_premium_rounded,
                size: 48,
                color: Colors.white,
                semanticLabel: 'Premium Icon',
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Go Premium!',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Unlock all features with Square Fit Premium.',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.white70,
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Support Section Widget
class _SupportSection extends StatelessWidget {
  const _SupportSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            'SUPPORT',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          ),
        ),
        const SizedBox(height: 8),
        _SupportTile(
          icon: Icons.email_rounded,
          text: 'Contact Us',
          onTap: () {
            // Handle contact action
          },
        ),
        _SupportTile(
          icon: Icons.star_rate_rounded,
          text: 'Make a Review',
          onTap: () {
            // Handle review action
          },
        ),
      ],
    );
  }
}

// Reusable Support Tile Widget with elevation
class _SupportTile extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;

  const _SupportTile({
    required this.icon,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        leading: Icon(
          icon,
          color: Colors.blueGrey.shade600,
        ),
        title: Text(
          text,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}
