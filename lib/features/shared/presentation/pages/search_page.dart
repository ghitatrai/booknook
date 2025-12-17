import 'package:flutter/material.dart';
import 'package:booknoke/core/theme/color_manager.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  List<String> _searchResults = [];
  List<String> _recentSearches = ['Harry Potter', 'Science Fiction', 'Romance'];
  List<String> _popularSearches = ['Mystery', 'Fantasy', 'Biography', 'Self Help'];
  bool _isSearching = false;

  void _performSearch(String query) {
    setState(() {
      _isSearching = true;
    });

    // Simulate API call delay
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _searchResults = [
          'Harry Potter and the Sorcerer\'s Stone',
          'Harry Potter and the Chamber of Secrets',
          'Harry Potter Fan Fiction',
          'The Harry Potter Wizarding Almanac',
        ].where((book) => book.toLowerCase().contains(query.toLowerCase())).toList();
        
        _isSearching = false;
        
        // Add to recent searches if not already present
        if (!_recentSearches.contains(query) && query.isNotEmpty) {
          _recentSearches.insert(0, query);
          if (_recentSearches.length > 5) {
            _recentSearches.removeLast();
          }
        }
      });
    });
  }

  void _clearSearch() {
    setState(() {
      _searchController.clear();
      _searchResults.clear();
      _isSearching = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.darkBackground,
      appBar: AppBar(
        title: const Text('Search'),
        backgroundColor: ColorsManager.darkSurface,
        foregroundColor: ColorsManager.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search Bar
            _buildSearchBar(),
            const SizedBox(height: 20),
            
            // Content based on search state
            Expanded(
              child: _isSearching
                  ? _buildLoadingIndicator()
                  : _searchController.text.isEmpty
                      ? _buildInitialState()
                      : _buildSearchResults(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      decoration: BoxDecoration(
        color: ColorsManager.darkSurface,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          hintText: 'Search for books, authors, or genres...',
          hintStyle: TextStyle(color: Colors.grey[400]),
          border: InputBorder.none,
          prefixIcon: Icon(Icons.search, color: ColorsManager.white),
          suffixIcon: _searchController.text.isNotEmpty
              ? IconButton(
                  icon: Icon(Icons.clear, color: ColorsManager.white),
                  onPressed: _clearSearch,
                )
              : null,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        ),
        style: const TextStyle(color: ColorsManager.white),
        onChanged: (value) {
          if (value.length > 2) {
            _performSearch(value);
          } else {
            setState(() {
              _searchResults.clear();
            });
          }
        },
        onSubmitted: _performSearch,
      ),
    );
  }

  Widget _buildLoadingIndicator() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(),
          SizedBox(height: 16),
          Text(
            'Searching...',
            style: TextStyle(color: ColorsManager.white),
          ),
        ],
      ),
    );
  }

  Widget _buildInitialState() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Recent Searches
          if (_recentSearches.isNotEmpty) ...[
            _buildSectionTitle('Recent Searches'),
            _buildChipList(_recentSearches, onTap: (query) {
              _searchController.text = query;
              _performSearch(query);
            }),
            const SizedBox(height: 24),
          ],
          
          // Popular Searches
          _buildSectionTitle('Popular Categories'),
          _buildChipList(_popularSearches, onTap: (query) {
            _searchController.text = query;
            _performSearch(query);
          }),
          
          const SizedBox(height: 24),
          
          // Trending Books
          _buildSectionTitle('Trending Now'),
          _buildTrendingBooks(),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        color: ColorsManager.white,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildChipList(List<String> items, {required Function(String) onTap}) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: items.map((item) {
        return GestureDetector(
          onTap: () => onTap(item),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: ColorsManager.darkSurface,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: ColorsManager.darkAccent),
            ),
            child: Text(
              item,
              style: const TextStyle(color: ColorsManager.white),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildTrendingBooks() {
    final trendingBooks = [
      {'title': 'The Midnight Library', 'author': 'Matt Haig'},
      {'title': 'Project Hail Mary', 'author': 'Andy Weir'},
      {'title': 'The Invisible Life', 'author': 'Addie Larue'},
    ];

    return Column(
      children: trendingBooks.map((book) {
        return ListTile(
          leading: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: ColorsManager.darkAccent,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(Icons.book, color: ColorsManager.white),
          ),
          title: Text(
            book['title']!,
            style: const TextStyle(color: ColorsManager.white),
          ),
          subtitle: Text(
            book['author']!,
            style: TextStyle(color: Colors.grey[400]),
          ),
          onTap: () {
            // Navigate to book details
          },
        );
      }).toList(),
    );
  }

  Widget _buildSearchResults() {
    if (_searchResults.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.search_off, size: 64, color: Colors.grey),
            SizedBox(height: 16),
            Text(
              'No books found',
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
            Text(
              'Try different keywords',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      itemCount: _searchResults.length,
      itemBuilder: (context, index) {
        return Card(
          color: ColorsManager.darkSurface,
          margin: const EdgeInsets.symmetric(vertical: 4),
          child: ListTile(
            leading: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: ColorsManager.darkAccent,
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(Icons.book, color: ColorsManager.white),
            ),
            title: Text(
              _searchResults[index],
              style: const TextStyle(color: ColorsManager.white),
            ),
            subtitle: Text(
              'By Author Name',
              style: TextStyle(color: Colors.grey[400]),
            ),
            trailing: Icon(Icons.arrow_forward_ios, 
                color: ColorsManager.white, size: 16),
            onTap: () {
              // Navigate to book details page
              // Navigator.push(context, MaterialPageRoute(
              //   builder: (context) => BookDetailsPage(book: _searchResults[index]),
              // ));
            },
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}