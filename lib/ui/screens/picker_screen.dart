import 'package:flutter/material.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:squarefit/models/media.dart';
import 'package:squarefit/services/fetch_albums.dart';
import 'package:squarefit/services/fetch_medias.dart';
import 'package:squarefit/ui/components/medias_grid_view.dart';
import 'package:squarefit/ui/screens/editor_screen.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      ),
      body: MediasGridView(
        medias: _medias,
        selectedMedias: _selectedMedias,
        selectMedia: _selectMedia,
        scrollController: _scrollController,
      ),
      floatingActionButton: _selectedMedias.isEmpty
          ? null
          : FloatingActionButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        EditorScreen(selectedMedias: _selectedMedias),
                  ),
                );
              },
              child: const Icon(Icons.check_rounded),
            ),
    );
  }
}
