// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'graphql_api.graphql.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductsData$Query$Find$Edges$Node _$ProductsData$Query$Find$Edges$NodeFromJson(
    Map<String, dynamic> json) {
  return ProductsData$Query$Find$Edges$Node()
    ..hypi = json['hypi'] == null
        ? null
        : ProductMixin$Hypi.fromJson(json['hypi'] as Map<String, dynamic>)
    ..title = json['title'] as String
    ..description = json['description'] as String
    ..typeName = json['__typename'] as String;
}

Map<String, dynamic> _$ProductsData$Query$Find$Edges$NodeToJson(
        ProductsData$Query$Find$Edges$Node instance) =>
    <String, dynamic>{
      'hypi': instance.hypi?.toJson(),
      'title': instance.title,
      'description': instance.description,
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

ProductMixin$Hypi _$ProductMixin$HypiFromJson(Map<String, dynamic> json) {
  return ProductMixin$Hypi()..id = json['id'] as String;
}

Map<String, dynamic> _$ProductMixin$HypiToJson(ProductMixin$Hypi instance) =>
    <String, dynamic>{
      'id': instance.id,
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
