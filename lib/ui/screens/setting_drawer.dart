import 'package:flutter/material.dart';

class SettingDrawer extends StatelessWidget {
  const SettingDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Center(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 400),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: const [
                  SizedBox(height: 16),
                  _DrawerHeader(),
                  SizedBox(height: 16),
                  _PremiumCard(),
                  SizedBox(height: 8),
                  _SettingsSection(),
                  SizedBox(height: 8),
                  _SupportSection(),
                  SizedBox(height: 8),
                  _Footer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _DrawerHeader extends StatelessWidget {
  const _DrawerHeader();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          'assets/images/icon_flutter.png',
          height: 48,
          width: 48,
        ),
        const SizedBox(width: 8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'SquareFit',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple.shade700,
                  ),
            ),
            Text(
              'Make Every Post Shine!',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.grey.shade500,
                  ),
            ),
          ],
        ),
      ],
    );
  }
}

class _PremiumCard extends StatelessWidget {
  const _PremiumCard();

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.indigo.shade600,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.workspace_premium, size: 30, color: Colors.white),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'SquareFit Premium',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'Ad-free experience & exclusive features! 7-day free trial.',
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: Colors.white70,
                  ),
              textAlign: TextAlign.left,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Navigate to billing screen
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.indigo.shade600,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              ),
              child: const Text('Upgrade Now'),
            ),
          ],
        ),
      ),
    );
  }
}

class _SupportSection extends StatelessWidget {
  const _SupportSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            'Support',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Colors.grey.shade600,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        _SupportTile(
          icon: Icons.email_outlined,
          text: 'Contact Us',
          onTap: () {
            // Handle contact action
          },
        ),
        _SupportTile(
          icon: Icons.star_rate_outlined,
          text: 'Rate Us',
          onTap: () {
            // Handle rate action
          },
        ),
        _SupportTile(
          icon: Icons.info_outline_rounded,
          text: 'About SquareFit',
          onTap: () {
            // Show app information
          },
        ),
      ],
    );
  }
}

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
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.indigo.shade400,
        size: 24,
      ),
      title: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 14,
          color: Colors.grey.shade800,
        ),
      ),
      onTap: onTap,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      tileColor: Colors.grey.shade50,
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      trailing: const Icon(Icons.chevron_right, size: 20),
    );
  }
}

class _SettingsSection extends StatelessWidget {
  const _SettingsSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            'Settings',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: Colors.grey.shade600,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
        SwitchListTile(
          title: const Text('Dark Mode'),
          value: Theme.of(context).brightness == Brightness.dark,
          onChanged: (bool value) {
            // Handle theme toggle
          },
        ),
        _SettingTile(
          icon: Icons.high_quality_outlined,
          text: 'Image Quality',
          onTap: () {
            // Handle image quality settings
          },
          premiumIcon: Icons.lock,
        ),
        _SettingTile(
          icon: Icons.save_outlined,
          text: 'Save Location',
          onTap: () {
            // Handle save location settings
          },
        ),
      ],
    );
  }
}

class _SettingTile extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final IconData? icon;
  final IconData? premiumIcon;

  const _SettingTile({
    required this.text,
    required this.onTap,
    required this.icon,
    this.premiumIcon,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.indigo.shade400,
        size: 24,
      ),
      title: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 14,
          color: Colors.grey.shade800,
        ),
      ),
      onTap: onTap,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      tileColor: Colors.grey.shade50,
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (premiumIcon != null)
            Padding(
              padding: const EdgeInsets.only(right: 4.0),
              child: Icon(premiumIcon, size: 16, color: Colors.amber),
            ),
          const Icon(Icons.chevron_right, size: 20),
        ],
      ),
    );
  }
}

class _Footer extends StatelessWidget {
  const _Footer();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        const Text('Version 1.0.0', style: TextStyle(color: Colors.grey)),
        const SizedBox(height: 20),
      ],
    );
  }
}
