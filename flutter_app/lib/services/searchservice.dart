import 'package:cloud_firestore/cloud_firestore.dart';

class SearchService {
  searchByName(String searchField) {
    return Firestore.instance
        .collection('Search')
        .where('searchkey', isEqualTo: searchField.substring(0,1).toUpperCase())
        .getDocuments();
  }
}