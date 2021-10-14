// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:meta/meta.dart';
import 'package:artemis/artemis.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
part 'graphql.graphql.g.dart';

mixin ProductMixin {
  ProductMixin$Hypi hypi;
  String title;
  String description;
}

@JsonSerializable(explicitToJson: true)
class ProductsData$Query$Find$Edges$Node with EquatableMixin, ProductMixin {
  ProductsData$Query$Find$Edges$Node();

  factory ProductsData$Query$Find$Edges$Node.fromJson(
          Map<String, dynamic> json) =>
      _$ProductsData$Query$Find$Edges$NodeFromJson(json);

  @override
  @JsonKey(name: '__typename')
  String typeName;

  @override
  List<Object> get props => [hypi, title, description, typeName];
  Map<String, dynamic> toJson() =>
      _$ProductsData$Query$Find$Edges$NodeToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ProductsData$Query$Find$Edges with EquatableMixin {
  ProductsData$Query$Find$Edges();

  factory ProductsData$Query$Find$Edges.fromJson(Map<String, dynamic> json) =>
      _$ProductsData$Query$Find$EdgesFromJson(json);

  ProductsData$Query$Find$Edges$Node node;

  @override
  List<Object> get props => [node];
  Map<String, dynamic> toJson() => _$ProductsData$Query$Find$EdgesToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ProductsData$Query$Find with EquatableMixin {
  ProductsData$Query$Find();

  factory ProductsData$Query$Find.fromJson(Map<String, dynamic> json) =>
      _$ProductsData$Query$FindFromJson(json);

  List<ProductsData$Query$Find$Edges> edges;

  @override
  List<Object> get props => [edges];
  Map<String, dynamic> toJson() => _$ProductsData$Query$FindToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ProductsData$Query with EquatableMixin {
  ProductsData$Query();

  factory ProductsData$Query.fromJson(Map<String, dynamic> json) =>
      _$ProductsData$QueryFromJson(json);

  ProductsData$Query$Find find;

  @override
  List<Object> get props => [find];
  Map<String, dynamic> toJson() => _$ProductsData$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ProductMixin$Hypi with EquatableMixin {
  ProductMixin$Hypi();

  factory ProductMixin$Hypi.fromJson(Map<String, dynamic> json) =>
      _$ProductMixin$HypiFromJson(json);

  String id;

  @override
  List<Object> get props => [id];
  Map<String, dynamic> toJson() => _$ProductMixin$HypiToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ProductsDataArguments extends JsonSerializable with EquatableMixin {
  ProductsDataArguments({@required this.arcql});

  factory ProductsDataArguments.fromJson(Map<String, dynamic> json) =>
      _$ProductsDataArgumentsFromJson(json);

  final String arcql;

  @override
  List<Object> get props => [arcql];
  Map<String, dynamic> toJson() => _$ProductsDataArgumentsToJson(this);
}

class ProductsDataQuery
    extends GraphQLQuery<ProductsData$Query, ProductsDataArguments> {
  ProductsDataQuery({this.variables});

  @override
  final DocumentNode document = DocumentNode(definitions: [
    OperationDefinitionNode(
        type: OperationType.query,
        name: NameNode(value: 'ProductsData'),
        variableDefinitions: [
          VariableDefinitionNode(
              variable: VariableNode(name: NameNode(value: 'arcql')),
              type: NamedTypeNode(
                  name: NameNode(value: 'String'), isNonNull: true),
              defaultValue: DefaultValueNode(value: null),
              directives: [])
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: 'find'),
              alias: null,
              arguments: [
                ArgumentNode(
                    name: NameNode(value: 'type'),
                    value: EnumValueNode(name: NameNode(value: 'Product'))),
                ArgumentNode(
                    name: NameNode(value: 'arcql'),
                    value: VariableNode(name: NameNode(value: 'arcql')))
              ],
              directives: [],
              selectionSet: SelectionSetNode(selections: [
                FieldNode(
                    name: NameNode(value: 'edges'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: SelectionSetNode(selections: [
                      FieldNode(
                          name: NameNode(value: 'node'),
                          alias: null,
                          arguments: [],
                          directives: [],
                          selectionSet: SelectionSetNode(selections: [
                            FragmentSpreadNode(
                                name: NameNode(value: 'product'),
                                directives: [])
                          ]))
                    ]))
              ]))
        ])),
    FragmentDefinitionNode(
        name: NameNode(value: 'product'),
        typeCondition: TypeConditionNode(
            on: NamedTypeNode(
                name: NameNode(value: 'Product'), isNonNull: false)),
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
              name: NameNode(value: 'hypi'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: SelectionSetNode(selections: [
                FieldNode(
                    name: NameNode(value: 'id'),
                    alias: null,
                    arguments: [],
                    directives: [],
                    selectionSet: null)
              ])),
          FieldNode(
              name: NameNode(value: 'title'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null),
          FieldNode(
              name: NameNode(value: 'description'),
              alias: null,
              arguments: [],
              directives: [],
              selectionSet: null)
        ]))
  ]);

  @override
  final String operationName = 'ProductsData';

  @override
  final ProductsDataArguments variables;

  @override
  List<Object> get props => [document, operationName, variables];
  @override
  ProductsData$Query parse(Map<String, dynamic> json) =>
      ProductsData$Query.fromJson(json);
}
