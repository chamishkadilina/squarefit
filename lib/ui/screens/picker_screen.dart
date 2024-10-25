import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:squarefit/models/media.dart';
import 'package:squarefit/services/fetch_albums.dart';
import 'package:squarefit/services/fetch_medias.dart';
import 'package:squarefit/ui/components/import_button.dart';
import 'package:squarefit/ui/components/medias_grid_view.dart';
import 'package:squarefit/ui/screens/setting_drawer.dart';

class PickerScreen extends StatefulWidget {
  final List<Media> selectedMedias;

  const PickerScreen({super.key, required this.selectedMedias});

  @override
  State<PickerScreen> createState() => _PickerScreenState();
}

class _PickerScreenState extends State<PickerScreen> {
  final ScrollController _scrollController = ScrollController();
  AssetPathEntity? _currentAlbum;
  List<AssetPathEntity> _albums = [];
  final List<Media> _medias = [];
  int _lastPage = 0;
  int _currentPage = 0;
  final List<Media> _selectedMedias = [];
  bool _isSelectAll = false; // State for Select All button

  @override
  void initState() {
    super.initState();
    _selectedMedias.addAll(widget.selectedMedias);
    _loadAlbums();
    _scrollController.addListener(_loadMoreMedias);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_loadMoreMedias);
    _scrollController.dispose();
    super.dispose();
  }

  // Method to load albums asynchronously
  void _loadAlbums() async {
    List<AssetPathEntity> albums = await fetchAlbums();
    if (albums.isNotEmpty) {
      setState(() {
        _currentAlbum = albums.first;
        _albums = albums;
      });
      _loadMedias();
    }
  }

  // Method to load media items asynchronously
  void _loadMedias() async {
    _lastPage = _currentPage;
    if (_currentAlbum != null) {
      List<Media> medias =
          await fetchMedias(album: _currentAlbum!, page: _currentPage);
      setState(() {
        _medias.addAll(medias);
      });
    }
  }

  // Method to load more media items when scrolling
  void _loadMoreMedias() {
    if (_scrollController.position.pixels /
            _scrollController.position.maxScrollExtent >
        0.33) {
      if (_currentPage != _lastPage) {
        _loadMedias();
      }
    }
  }

  // Method to select or deselect a media item
  void _selectMedia(Media media) {
    bool isSelected = _selectedMedias
        .any((element) => element.assetEntity.id == media.assetEntity.id);
    setState(() {
      if (isSelected) {
        _selectedMedias.removeWhere(
            (element) => element.assetEntity.id == media.assetEntity.id);
      } else {
        _selectedMedias.add(media);
      }
    });
  }

  // Method to handle Select All/Unselect All button
  void _toggleSelectAll() {
    setState(() {
      _isSelectAll = !_isSelectAll; // Toggle the state

      if (_isSelectAll) {
        // Select all media
        _selectedMedias.clear();
        _selectedMedias.addAll(_medias);
      } else {
        // Deselect all media
        _selectedMedias.clear();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: SettingDrawer(),
      appBar: AppBar(
        // Dropdown button for albums
        title: DropdownButton<AssetPathEntity>(
          borderRadius: BorderRadius.circular(16.0),
          value: _currentAlbum,
          items: _albums
              .map(
                (e) => DropdownMenuItem<AssetPathEntity>(
                  value: e,
                  child: Text(e.name.isEmpty ? "0" : e.name),
                ),
              )
              .toList(),
          onChanged: (AssetPathEntity? value) {
            setState(() {
              _currentAlbum = value;
              _currentPage = 0;
              _lastPage = 0;
              _medias.clear();
            });
            _loadMedias();
            _scrollController.jumpTo(0.0);
          },
        ),
        // Import button
        actions: [ImportButton(selectedMedias: _selectedMedias)],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: MediasGridView(
          medias: _medias,
          selectedMedias: _selectedMedias,
          selectMedia: _selectMedia,
          scrollController: _scrollController,
        ),
      ),
      floatingActionButton: GestureDetector(
        onTap: _toggleSelectAll, // Call method to toggle Select All
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Transform.scale(
                scale: 0.8,
                child: Checkbox(
                  value:
                      _isSelectAll, // Checkbox state reflects if all are selected
                  onChanged: (value) {
                    _toggleSelectAll(); // Toggle selection when checkbox is clicked
                  },
                ),
              ),
              Text(
                _isSelectAll
                    ? 'Unselect All     '
                    : 'Select All     ', // Update label
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
