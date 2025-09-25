class SignupReqParams {
  final String name;
  final String email;
  final String password;
  final String role;
  final String phoneNumber;
  final String? profileImage;
  final Address? address;
  final Location? location;
  final List<String>? specialties;
  final int? experience;
  final Rating? rating;
  final String? fcmToken;
  final bool isActive;
  final DateTime? lastActive;

  SignupReqParams({
    required this.name,
    required this.email,
    required this.password,
    required this.role,
    required this.phoneNumber,
    this.profileImage,
    this.address,
    this.location,
    this.specialties,
    this.experience,
    this.rating,
    this.fcmToken,
    this.isActive = true,
    this.lastActive,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'role': role,
      'phoneNumber': phoneNumber,
      'profileImage': profileImage,
      'address': address?.toMap(),
      'location': location?.toMap(),
      'specialties': specialties,
      'experience': experience,
      'rating': rating?.toMap(),
      'fcmToken': fcmToken,
      'isActive': isActive,
      'lastActive': lastActive?.toIso8601String(),
    }..removeWhere((key, value) => value == null);
  }

  factory SignupReqParams.fromMap(Map<String, dynamic> json) {
    return SignupReqParams(
      name: json['name'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      role: json['role'] as String,
      phoneNumber: json['phoneNumber'] as String,
      profileImage: json['profileImage'] as String?,
      address: json['address'] != null ? Address.fromMap(json['address']) : null,
      location: json['location'] != null ? Location.fromMap(json['location']) : null,
      specialties: (json['specialties'] as List<dynamic>?)?.cast<String>(),
      experience: json['experience'] as int?,
      rating: json['rating'] != null ? Rating.fromMap(json['rating']) : null,
      fcmToken: json['fcmToken'] as String?,
      isActive: json['isActive'] as bool? ?? true,
      lastActive: json['lastActive'] != null ? DateTime.parse(json['lastActive']) : null,
    );
  }
}

class Address {
  final String? street;
  final String? city;
  final String? state;
  final String? postalCode;
  final String? country;

  Address({
    this.street,
    this.city,
    this.state,
    this.postalCode,
    this.country,
  });

  Map<String, dynamic> toMap() {
    return {
      'street': street,
      'city': city,
      'state': state,
      'postalCode': postalCode,
      'country': country,
    }..removeWhere((key, value) => value == null);
  }

  factory Address.fromMap(Map<String, dynamic> json) {
    return Address(
      street: json['street'] as String?,
      city: json['city'] as String?,
      state: json['state'] as String?,
      postalCode: json['postalCode'] as String?,
      country: json['country'] as String?,
    );
  }
}

class Location {
  final String type;
  final List<double> coordinates;

  Location({
    this.type = 'Point',
    required this.coordinates,
  });

  Map<String, dynamic> toMap() {
    return {
      'type': type,
      'coordinates': coordinates,
    };
  }

  factory Location.fromMap(Map<String, dynamic> json) {
    return Location(
      type: json['type'] as String? ?? 'Point',
      coordinates: (json['coordinates'] as List<dynamic>).map((e) => e as double).toList(),
    );
  }
}

class Rating {
  final double average;
  final int count;

  Rating({
    this.average = 0,
    this.count = 0,
  });

  Map<String, dynamic> toMap() {
    return {
      'average': average,
      'count': count,
    };
  }

  factory Rating.fromMap(Map<String, dynamic> json) {
    return Rating(
      average: (json['average'] as num).toDouble(),
      count: json['count'] as int,
    );
  }
}
