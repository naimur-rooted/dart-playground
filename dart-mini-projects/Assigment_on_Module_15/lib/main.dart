import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

/// ---------------------------------------------------------------------------
/// Root widget — a StatelessWidget that configures the Material app theme.
/// ---------------------------------------------------------------------------
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Profile Card',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const ProfileScreen(),
    );
  }
}

/// A simple, immutable data class that holds the profile information shown
/// throughout the app. Keeping the data in one place makes it easy to reuse
/// in both the card and the detail dialog.
class ProfileData {
  const ProfileData({
    required this.name,
    required this.profession,
    required this.bio,
    required this.email,
    required this.phone,
    required this.interests,
  });

  final String name;
  final String profession;
  final String bio;
  final String email;
  final String phone;
  final List<InterestItem> interests;
}

/// Represents a single interest with an icon shown next to its label.
class InterestItem {
  const InterestItem({required this.icon, required this.label});

  final IconData icon;
  final String label;
}

/// The single profile information used to populate every widget. The values
/// are curated from the developer's file history (Flutter assignments, user
/// folder name, etc.).
const kProfile = ProfileData(
  name: 'Nahid',
  profession: 'Flutter Developer',
  bio:
      'Passionate Flutter & Dart developer building cross-platform mobile '
      'applications. Currently sharpening skills in state management, '
      'clean architecture, and responsive UI design through hands-on '
      'projects and module assignments.',
  email: 'nahid.dev@example.com',
  phone: '+1 (555) 123-4567',
  interests: [
    InterestItem(icon: Icons.flutter_dash, label: 'Flutter'),
    InterestItem(icon: Icons.code, label: 'Dart'),
    InterestItem(icon: Icons.phone_iphone, label: 'Mobile Dev'),
    InterestItem(icon: Icons.design_services, label: 'UI/UX Design'),
    InterestItem(icon: Icons.architecture, label: 'Clean Architecture'),
  ],
);

/// ---------------------------------------------------------------------------
/// Profile Screen — a StatefulWidget because it owns the `_isFollowing`
/// boolean that toggles via setState() when the Follow button is tapped.
/// ---------------------------------------------------------------------------
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _isFollowing = false;

  /// Toggles the follow state and shows a SnackBar with the result.
  void _toggleFollow() {
    setState(() {
      _isFollowing = !_isFollowing;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Icon(
              _isFollowing ? Icons.favorite : Icons.favorite_border,
              color: Colors.redAccent,
            ),
            const SizedBox(width: 8),
            Text(
              _isFollowing
                  ? '${kProfile.name} followed!'
                  : '${kProfile.name} unfollowed.',
            ),
          ],
        ),
        duration: const Duration(seconds: 1),
        backgroundColor: _isFollowing
            ? Colors.green.shade700
            : Colors.red.shade700,
      ),
    );
  }

  /// Shows an AlertDialog containing the full user details.
  void _showProfileDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Row(
            children: [
              Icon(Icons.person, size: 28),
              SizedBox(width: 8),
              Text('Profile Details'),
            ],
          ),
          content: SizedBox(
            width: double.maxFinite,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _detailRow(Icons.badge_outlined, 'Name', kProfile.name),
                _detailRow(Icons.work, 'Profession', kProfile.profession),
                _detailRow(Icons.email, 'Email', kProfile.email),
                _detailRow(Icons.phone, 'Phone', kProfile.phone),
                const SizedBox(height: 12),
                const Text(
                  'Bio',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(kProfile.bio),
                const SizedBox(height: 12),
                const Text(
                  'Interests',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  children:
                      [
                            'Flutter',
                            'Dart',
                            'Mobile Dev',
                            'UI/UX Design',
                            'Clean Architecture',
                          ]
                          .map(
                            (label) => Chip(
                              avatar: CircleAvatar(
                                backgroundColor: Colors.indigo.shade100,
                                child: const Icon(Icons.star, size: 14),
                              ),
                              label: Text(label),
                              visualDensity: VisualDensity.compact,
                            ),
                          )
                          .toList(),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              key: const Key('dialog_close_button'),
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  /// Convenience widget that renders a labelled icon/text row used inside the
  /// detail dialog.
  Widget _detailRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 18, color: Colors.indigo),
          const SizedBox(width: 8),
          Text('$label:', style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(width: 4),
          Expanded(child: Text(value)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personal Profile Card'),
        centerTitle: true,
      ),
      body: Center(child: SingleChildScrollView(child: _buildProfileCard())),
    );
  }

  /// Builds the entire profile Card widget.
  Widget _buildProfileCard() {
    return Card(
      elevation: 8,
      margin: const EdgeInsets.all(24),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(28),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // ---- Profile picture (CircleAvatar) ----
            CircleAvatar(
              radius: 56,
              backgroundColor: Colors.indigo.shade100,
              child: const CircleAvatar(
                radius: 48,
                backgroundColor: Colors.indigo,
                child: Icon(Icons.person, size: 56, color: Colors.white),
              ),
            ),
            const SizedBox(height: 16),

            // ---- Name & profession ----
            Text(
              kProfile.name,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.indigo.shade800,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              kProfile.profession,
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(color: Colors.indigo.shade700),
            ),
            const SizedBox(height: 16),

            // ---- Short bio ----
            Text(
              kProfile.bio,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 20),

            // ---- Email & phone ----
            _infoRow(Icons.email, kProfile.email),
            const SizedBox(height: 10),
            _infoRow(Icons.phone, kProfile.phone),
            const SizedBox(height: 20),

            // ---- Interests ----
            _buildInterests(),
            const SizedBox(height: 24),

            // ---- Action buttons ----
            Row(
              children: [
                // Follow button — shows SnackBar when pressed
                Expanded(
                  child: ElevatedButton.icon(
                    key: const Key('follow_button'),
                    onPressed: _toggleFollow,
                    icon: Icon(
                      _isFollowing ? Icons.favorite : Icons.favorite_border,
                    ),
                    label: Text(_isFollowing ? 'Following' : 'Follow'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _isFollowing
                          ? Colors.red
                          : Colors.indigo,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                // View Profile button — opens AlertDialog
                Expanded(
                  child: ElevatedButton.icon(
                    key: const Key('view_profile_button'),
                    onPressed: _showProfileDialog,
                    icon: const Icon(Icons.visibility),
                    label: const Text('View Profile'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.indigo,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// Renders a labelled icon + text row for email and phone.
  Widget _infoRow(IconData icon, String text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: Colors.indigo, size: 20),
        const SizedBox(width: 8),
        Text(text, style: Theme.of(context).textTheme.bodyLarge),
      ],
    );
  }

  /// Renders the interests as a wrap of chips with icons.
  Widget _buildInterests() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Interests',
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 10),
        Wrap(
          spacing: 10,
          runSpacing: 8,
          alignment: WrapAlignment.center,
          children: kProfile.interests
              .map(
                (item) => Chip(
                  avatar: CircleAvatar(
                    backgroundColor: Colors.indigo.shade100,
                    child: Icon(item.icon, color: Colors.indigo, size: 16),
                  ),
                  label: Text(item.label),
                  backgroundColor: Colors.indigo.shade50,
                  side: const BorderSide(color: Colors.indigo),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
