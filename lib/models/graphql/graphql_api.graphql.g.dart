// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'graphql_api.graphql.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductsData$Query$Find$Edges$Node$Product$Hypi
    _$ProductsData$Query$Find$Edges$Node$Product$HypiFromJson(
        Map<String, dynamic> json) {
  return ProductsData$Query$Find$Edges$Node$Product$Hypi()
    ..typeName = json['__typename'] as String
    ..hypi = json['hypi'] == null
        ? null
        : ProductsData$Query$Find$Edges$Node$Product$Hypi.fromJson(
            json['hypi'] as Map<String, dynamic>)
    ..title = json['title'] as String
    ..description = json['description'] as String
    ..id = json['id'] as String;
}

Map<String, dynamic> _$ProductsData$Query$Find$Edges$Node$Product$HypiToJson(
        ProductsData$Query$Find$Edges$Node$Product$Hypi instance) =>
    <String, dynamic>{
      '__typename': instance.typeName,
      'hypi': instance.hypi?.toJson(),
      'title': instance.title,
      'description': instance.description,
      'id': instance.id,
    };

ProductsData$Query$Find$Edges$Node$Product
    _$ProductsData$Query$Find$Edges$Node$ProductFromJson(
        Map<String, dynamic> json) {
  return ProductsData$Query$Find$Edges$Node$Product()
    ..typeName = json['__typename'] as String
    ..hypi = json['hypi'] == null
        ? null
        : ProductsData$Query$Find$Edges$Node$Product$Hypi.fromJson(
            json['hypi'] as Map<String, dynamic>)
    ..title = json['title'] as String
    ..description = json['description'] as String;
}

Map<String, dynamic> _$ProductsData$Query$Find$Edges$Node$ProductToJson(
        ProductsData$Query$Find$Edges$Node$Product instance) =>
    <String, dynamic>{
      '__typename': instance.typeName,
      'hypi': instance.hypi?.toJson(),
      'title': instance.title,
      'description': instance.description,
    };

ProductsData$Query$Find$Edges$Node _$ProductsData$Query$Find$Edges$NodeFromJson(
    Map<String, dynamic> json) {
  return ProductsData$Query$Find$Edges$Node()
    ..typeName = json['__typename'] as String;
}

Map<String, dynamic> _$ProductsData$Query$Find$Edges$NodeToJson(
        ProductsData$Query$Find$Edges$Node instance) =>
    <String, dynamic>{
      '__typename': instance.typeName,
    };

ProductsData$Query$Find$Edges _$ProductsData$Query$Find$EdgesFromJson(
    Map<String, dynamic> json) {
  return ProductsData$Query$Find$Edges()
    ..node = json['node'] == null
        ? null
        : ProductsData$Query$Find$Edges$Node.fromJson(
            json['node'] as Map<String, dynamic>);
}

Map<String, dynamic> _$ProductsData$Query$Find$EdgesToJson(
        ProductsData$Query$Find$Edges instance) =>
    <String, dynamic>{
      'node': instance.node?.toJson(),
    };

ProductsData$Query$Find _$ProductsData$Query$FindFromJson(
    Map<String, dynamic> json) {
  return ProductsData$Query$Find()
    ..edges = (json['edges'] as List)
        ?.map((e) => e == null
            ? null
            : ProductsData$Query$Find$Edges.fromJson(e as Map<String, dynamic>))
        ?.toList();
}

Map<String, dynamic> _$ProductsData$Query$FindToJson(
        ProductsData$Query$Find instance) =>
    <String, dynamic>{
      'edges': instance.edges?.map((e) => e?.toJson())?.toList(),
    };

ProductsData$Query _$ProductsData$QueryFromJson(Map<String, dynamic> json) {
  return ProductsData$Query()
    ..find = json['find'] == null
        ? null
        : ProductsData$Query$Find.fromJson(
            json['find'] as Map<String, dynamic>);
}

Map<String, dynamic> _$ProductsData$QueryToJson(ProductsData$Query instance) =>
    <String, dynamic>{
      'find': instance.find?.toJson(),
    };

ProductsDataArguments _$ProductsDataArgumentsFromJson(
    Map<String, dynamic> json) {
  return ProductsDataArguments(
    arcql: json['arcql'] as String,
  );
}

Map<String, dynamic> _$ProductsDataArgumentsToJson(
        ProductsDataArguments instance) =>
    <String, dynamic>{
      'arcql': instance.arcql,
    };
