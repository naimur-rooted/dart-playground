import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

/// The root widget of the app.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter Navigation App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      // The first screen shown when the app starts.
      home: const HomeScreen(),
    );
  }
}

// =====================================================================
// HOME SCREEN (Screen 1)
// =====================================================================

/// Home Screen - a StatefulWidget because it owns the counter value and
/// the TabController. It demonstrates:
///   * StatefulWidget
///   * initState()  -> create the TabController
///   * dispose()    -> dispose the TabController
///   * setState()   -> update the counter
///   * Navigator.push() -> go to the Details Screen
///   * BottomNavigationBar, TabBar and TabBarView
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  // The counter value shown on the Home tab.
  int _counter = 0;

  // Links the TabBar and the TabBarView together.
  late TabController _tabController;

  /// Called once when the State object is created (before build).
  @override
  void initState() {
    super.initState();
    // length = number of tabs. vsync needs SingleTickerProviderStateMixin.
    _tabController = TabController(length: 2, vsync: this);

    // Keep the BottomNavigationBar in sync with the TabBar.
    _tabController.addListener(_onTabChanged);
  }

  /// Called once when the widget is removed from the tree.
  /// Always dispose controllers, streams, tickers, etc.
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  /// Called whenever the active tab changes so the UI rebuilds.
  void _onTabChanged() {
    setState(() {});
  }

  /// Increases the counter by 1. setState() rebuilds the UI.
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  /// Resets the counter back to 0.
  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  /// Opens the Details Screen and passes the current counter value to it.
  void _openDetailsScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailsScreen(counterValue: _counter),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter Navigation App'),
        centerTitle: true,
        // A TabBar placed at the bottom of the AppBar.
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(icon: Icon(Icons.home), text: 'Home'),
            Tab(icon: Icon(Icons.lightbulb), text: 'About'),
          ],
        ),
      ),

      // The page displayed changes with the selected tab.
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildCounterTab(),
          _buildAboutTab(),
        ],
      ),

      // A BottomNavigationBar that switches the same tabs as the TabBar.
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _tabController.index,
        onTap: (index) => _tabController.animateTo(index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.lightbulb), label: 'About'),
        ],
      ),
    );
  }

  /// Builds the Home tab content: the counter UI.
  Widget _buildCounterTab() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Counter Value',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 12),
            // Big number showing the current counter value.
            Text(
              '$_counter',
              key: const Key('counter_text'),
              style: const TextStyle(fontSize: 72, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FilledButton.icon(
                  key: const Key('increment_button'),
                  onPressed: _incrementCounter,
                  icon: const Icon(Icons.add),
                  label: const Text('Increase (+1)'),
                ),
                const SizedBox(width: 12),
                OutlinedButton(
                  key: const Key('reset_button'),
                  onPressed: _resetCounter,
                  child: const Text('Reset'),
                ),
              ],
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: FilledButton.icon(
                key: const Key('view_details_button'),
                onPressed: _openDetailsScreen,
                icon: const Icon(Icons.arrow_forward),
                label: const Text('View Details'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Builds the About tab: a short info page.
  Widget _buildAboutTab() {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(24.0),
        child: Text(
          'This app demonstrates:\n\n'
          '\u2022 StatefulWidget & setState\n'
          '\u2022 initState() and dispose()\n'
          '\u2022 BottomNavigationBar\n'
          '\u2022 TabBar and TabBarView\n'
          '\u2022 Navigator.push() and Navigator.pop()\n\n'
          'Increase the counter, then tap "View Details" '
          'to see the value passed to the Details Screen.',
          style: TextStyle(fontSize: 16, height: 1.6),
        ),
      ),
    );
  }
}

// =====================================================================
// DETAILS SCREEN (Screen 2)
// =====================================================================

/// Details Screen - receives the counter value pushed from Home Screen.
/// Also a StatefulWidget: it uses initState() to store the passed value
/// and dispose() to release a ScrollController.
class DetailsScreen extends StatefulWidget {
  // The counter value received from the Home Screen.
  final int counterValue;

  const DetailsScreen({super.key, required this.counterValue});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  // Controller for the page content, disposed in dispose().
  final ScrollController _scrollController = ScrollController();

  // Holds a copy of the value passed from the Home Screen.
  late int _receivedCounter;

  /// Called once when the State is created.
  @override
  void initState() {
    super.initState();
    _receivedCounter = widget.counterValue;
  }

  /// Called once when the widget is removed from the tree.
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  /// Returns to the Home Screen using Navigator.pop().
  void _goBack() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details Screen'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const SizedBox(height: 40),
            const Icon(Icons.info_outline, size: 80, color: Colors.indigo),
            const SizedBox(height: 24),
            const Text(
              'Counter value passed from Home Screen:',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              decoration: BoxDecoration(
                color: Colors.indigo.shade50,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.indigo.shade200),
              ),
              child: Text(
                '$_receivedCounter',
                style: const TextStyle(
                  fontSize: 60,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo,
                ),
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              '(You arrived here using Navigator.push.)',
              textAlign: TextAlign.center,
              style: TextStyle(fontStyle: FontStyle.italic, color: Colors.grey),
            ),
            const SizedBox(height: 48),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: FilledButton.icon(
                key: const Key('go_back_button'),
                onPressed: _goBack,
                icon: const Icon(Icons.arrow_back),
                label: const Text('Go Back to Home'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
