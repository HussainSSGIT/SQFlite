class Item {

  static final List<String> columns = [
    /// Add all fields
    fieldId, fieldOrderId, fieldItemName,
  ];

  static const String tableName = 'items';

  static const String fieldId = '_id';
  static const String fieldOrderId = 'orderId';
  static const String fieldItemName = 'itemName';

  final int? id;
  final int orderId;
  final String itemName;


  const Item ({
    this.id,
    required this.orderId,
    required this.itemName,
  });

  Item copy ({
    final int? id,
    final int? orderId,
    final String? itemName,

  }) => Item (
    id: id ?? this.id,
    orderId: orderId ?? this.orderId,
    itemName: itemName ?? this.itemName,

  );

  static Item fromJson(Map<String, Object?> json) => Item(
    id: json[fieldId] as int?,
    orderId: json[fieldOrderId] as int,
    itemName: json[fieldItemName] as String,
  );

  Map<String, Object?> toJson() => {
    fieldId: id,
    fieldOrderId: orderId,
    fieldItemName: itemName,
  };

}
