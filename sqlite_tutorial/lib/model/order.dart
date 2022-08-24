class Order {
  static final List<String> columns = [
    /// Add all fields
    fieldId, fieldSource, fieldDestination, //fieldItemsList
  ];

  static const String tableName = 'orders';

  static const String fieldId = '_id';
  static const String fieldSource = 'source';
  static const String fieldDestination = 'destination';
  //static const String fieldItemsList = 'itemsList';

  final int? id;
  final String source;
  final String destination;
  //final int itemsList;


  const Order ({
      this.id,
      required this.source,
      required this.destination,
      //required this.itemsList,
    });

  Order copy ({
    final int? id,
    final String? source,
    final String? destination,
    //final int? itemsList,

  }) => Order (
    id: id ?? this.id,
    source: source ?? this.source,
    destination: destination ?? this.destination,
    //itemsList: itemsList ?? this.itemsList,

  );

  static Order fromJson(Map<String, Object?> json) => Order(
    id: json[fieldId] as int?,
    source: json[fieldSource] as String,
    destination: json[fieldDestination] as String,
    //itemsList: json[fieldItemsList] as int,
  );

  Map<String, Object?> toJson() => {
    fieldId: id,
    fieldSource: source,
    fieldDestination: destination,
    //fieldItemsList: itemsList,
  };

}
