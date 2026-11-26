class AddressModel {
  final String id;
  final String type; // e.g., 'HOME', 'WORK'
  final String addressLine;
  final String city;
  final String state;
  final String zipCode;
  final String country;
  final String deliveryInstructions;
  final bool isDefault;

  AddressModel({
    required this.id,
    required this.type,
    required this.addressLine,
    this.city = '',
    this.state = '',
    this.zipCode = '',
    this.country = '',
    this.deliveryInstructions = '',
    this.isDefault = false,
  });

  String get fullAddress {
    final parts = [addressLine, city, state, zipCode, country].where((s) => s.trim().isNotEmpty).toList();
    return parts.join(', ');
  }

  AddressModel copyWith({
    String? id,
    String? type,
    String? addressLine,
    String? city,
    String? state,
    String? zipCode,
    String? country,
    String? deliveryInstructions,
    bool? isDefault,
  }) {
    return AddressModel(
      id: id ?? this.id,
      type: type ?? this.type,
      addressLine: addressLine ?? this.addressLine,
      city: city ?? this.city,
      state: state ?? this.state,
      zipCode: zipCode ?? this.zipCode,
      country: country ?? this.country,
      deliveryInstructions: deliveryInstructions ?? this.deliveryInstructions,
      isDefault: isDefault ?? this.isDefault,
    );
  }
}
