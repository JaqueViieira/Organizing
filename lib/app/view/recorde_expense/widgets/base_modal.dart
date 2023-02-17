import 'package:cloud_firestore/cloud_firestore.dart';

abstract class BaseModal {
  BaseModal();

  BaseModal.fromMap(DocumentSnapshot document);
  toMap();
  String documentId();
}
