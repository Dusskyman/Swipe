import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test_pj/models/announcement/announcement.dart';

class AnnouncementToDatabase {
  final String id;
  final String ownerUId;

  final String price;
  final String typeOfRent;
  final String rentStatus;
  final String typeOfHouse;
  final String numberOfRooms;
  final String appointment;
  final String houseCondition;
  final String layout;
  final String houseSpace;
  final String kitchenSpace;
  final String balcony;
  final String heatingType;
  final String paymentOptions;
  final String commission;
  final String description;

  final Timestamp createdAt;
  final Timestamp updatedAt;

  AnnouncementToDatabase(Announcement announcement)
      : id = announcement.id,
        ownerUId = announcement.ownerUId,
        price = announcement.price,
        typeOfRent = announcement.typeOfRent,
        rentStatus = announcement.rentStatus,
        typeOfHouse = announcement.typeOfHouse,
        numberOfRooms = announcement.numberOfRooms,
        appointment = announcement.appointment,
        houseCondition = announcement.houseCondition,
        layout = announcement.layout,
        houseSpace = announcement.houseSpace,
        kitchenSpace = announcement.kitchenSpace,
        balcony = announcement.balcony,
        heatingType = announcement.heatingType,
        paymentOptions = announcement.paymentOptions,
        commission = announcement.commission,
        description = announcement.description,
        createdAt = announcement.createdAt,
        updatedAt = announcement.updatedAt;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'ownerUId': ownerUId,
      'price': price,
      'typeOfRent': typeOfRent,
      'rentStatus': rentStatus,
      'typeOfHouse': typeOfHouse,
      'numberOfRooms': numberOfRooms,
      'appointment': appointment,
      'houseCondition': houseCondition,
      'layout': layout,
      'houseSpace': houseSpace,
      'kitchenSpace': kitchenSpace,
      'balcony': balcony,
      'heatingType': heatingType,
      'paymentOptions': paymentOptions,
      'commission': commission,
      'description': description,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }
}
