import 'package:cloud_firestore/cloud_firestore.dart';

class Announcement {
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

  Announcement._({
    this.id,
    this.ownerUId,
    this.price,
    this.typeOfRent,
    this.rentStatus,
    this.typeOfHouse,
    this.numberOfRooms,
    this.appointment,
    this.houseCondition,
    this.layout,
    this.houseSpace,
    this.kitchenSpace,
    this.balcony,
    this.heatingType,
    this.paymentOptions,
    this.commission,
    this.description,
    this.createdAt,
    this.updatedAt,
  });

  Announcement.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        ownerUId = map['ownerUid'],
        price = map['price'],
        typeOfRent = map['typeOfRent'],
        rentStatus = map['rentStatus'],
        typeOfHouse = map['typeOfHouse'],
        numberOfRooms = map['numberOfrooms'],
        appointment = map['appointment'],
        houseCondition = map['houseCondition'],
        layout = map['layout'],
        houseSpace = map['houseSpace'],
        kitchenSpace = map['kitchenSpace'],
        balcony = map['balcony'],
        heatingType = map['heatingType'],
        paymentOptions = map['paymentOptions'],
        commission = map['commission'],
        description = map['description'],
        createdAt = map['createdAt'],
        updatedAt = map['updatedAt'];

  Announcement copyWith({
    String id,
    String ownerUId,
    String price,
    String typeOfRent,
    String rentStatus,
    String typeOfHouse,
    String numberOfRooms,
    String appointment,
    String houseCondition,
    String layout,
    String houseSpace,
    String kitchenSpace,
    String balcony,
    String heatingType,
    String paymentOptions,
    String commission,
    String description,
    Timestamp createdAt,
    Timestamp updatedAt,
  }) =>
      Announcement._(
        id: id ?? this.id,
        ownerUId: ownerUId ?? this.ownerUId,
        price: price ?? this.price,
        typeOfRent: typeOfRent ?? this.typeOfRent,
        rentStatus: rentStatus ?? this.rentStatus,
        typeOfHouse: typeOfHouse ?? this.typeOfHouse,
        numberOfRooms: numberOfRooms ?? this.numberOfRooms,
        appointment: appointment ?? this.appointment,
        houseCondition: houseCondition ?? this.houseCondition,
        layout: layout ?? this.layout,
        houseSpace: houseSpace ?? this.houseSpace,
        kitchenSpace: kitchenSpace ?? this.kitchenSpace,
        balcony: balcony ?? this.balcony,
        heatingType: heatingType ?? this.heatingType,
        paymentOptions: paymentOptions ?? this.paymentOptions,
        commission: commission ?? this.commission,
        description: description ?? this.description,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
}
