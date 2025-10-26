import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(context),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.menu),
        onPressed: () {},
      ),
      title: const Text(
        "Rare Animes",
        style: TextStyle(
          color: Colors.greenAccent,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      centerTitle: true,
      actions: [
        IconButton(icon: const Icon(Icons.share), onPressed: () {}),
        IconButton(icon: const Icon(Icons.bookmark_border), onPressed: () {}),
        IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
        IconButton(icon: const Icon(Icons.search), onPressed: () {}),
      ],
    );
  }

  Widget _buildBody(BuildContext context) {
    // A simple representation of a starry background
    return Stack(
      children: [
        Container(color: const Color(0xFF0A0A10)),
        // In a real app, this would be a more sophisticated particle effect
        // or a tiled image for performance.
        ...List.generate(
          100,
          (index) => Positioned(
            left: (index * 37) % MediaQuery.of(context).size.width,
            top: (index * 71) % MediaQuery.of(context).size.height,
            child: const CircleAvatar(
              backgroundColor: Colors.white24,
              radius: 0.5,
            ),
          ),
        ),
        SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              _buildFeaturedScrollSection(),
              const SizedBox(height: 24),
              _buildMainContentSection(context),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFeaturedScrollSection() {
    final items = [
      {'name': 'NARUTO', 'color': Colors.orange},
      {'name': 'SPIDERMAN', 'color': Colors.red},
      {'name': 'POKEMON', 'color': Colors.yellow},
      {'name': 'DRAGONBALL', 'color': Colors.deepOrange},
      {'name': 'ONE PIECE', 'color': Colors.lightBlue},
    ];

    return SizedBox(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Column(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: items[index]['color'] as Color,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      (items[index]['name'] as String)[0],
                      style: const TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  items[index]['name'] as String,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildMainContentSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionHeader(),
          const SizedBox(height: 16),
          _buildFeaturedBanner(context),
        ],
      ),
    );
  }

  Widget _buildSectionHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.3),
        borderRadius: BorderRadius.circular(4),
      ),
      child: const Text(
        "CarToons & Animes 🔥",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildFeaturedBanner(BuildContext context) {
    return Card(
      color: Colors.grey.shade900.withOpacity(0.5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 120,
                height: 150,
                color: Colors.orange.shade800,
                child: const Center(
                  child: Icon(Icons.play_circle_outline,
                      color: Colors.white, size: 50),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "RARE ANIMES INDIA",
                        style: TextStyle(color: Colors.white70, fontSize: 10),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "NARUTO SHIPPUDEN SEASON 14",
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Colors.orangeAccent,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  "Naruto Shippuden Season 14 – Episodes Hindi Dubbed Download HD",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    shape: const StadiumBorder(),
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                  child: const Text(
                    "WATCH/DOWNLOAD",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      color: Colors.black.withOpacity(0.3),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
              child: const Text("How To Skip Ads?"),
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
              ),
              child: const Text("Telegram"),
            ),
          ),
        ],
      ),
    );
  }
}
