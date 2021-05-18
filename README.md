# Getting Started with Hypi cli Flutter

* [Available commands](#available-commands)
* [Getting started](#getting-started)

## Install hypi cli

```$ npm install -g @hypi/cli```

## Available commands


### `hypi login` 

```hypi login``` 
Login with user name and password
```hypi login -d``` 
Login with organization name space and Authorization token from here https://hypi.app/developer-hub

### `hypi init`

```hypi init```

 Initialize your app and instance or refernece an existing domain
.hypi folder will be created with app.yaml, instance.yaml and schema.graphql files

### `hypi sync`

```hypi sync flutter```

will sync your local schema and get the full schema, then generate graphql schema dart file

## Getting started
1. Inside your Flutter project, run ```hypi login``` 
   Afetr login, user config folder will be placed in `~/.config/hypi/config.json`
2. Run ```hypi init``` to initialize your app or refernece an existing domain
.hypi folder will be created with `app.yaml`, `instance.yaml` and `schema.graphql`
3. Write your schema inside `schema.graphql`
4. Write your queries and mutations inside `/graphql`
5. Make sure that following dependecies exists inside your pubspec.yaml in yoru flutter project
   
   ```
   dependencies:
     artemis: ">=6.0.0 <7.0.0"
     json_annotation: ^ 3.1.0
     equatable: ^ 1.2.5
     meta: ">=1.0.0 <2.0.0"
     gql: ">=0.12.3 <1.0.0"
   
   dev_dependencies:
     artemis: ">=6.0.0 <7.0.0"
     build_runner: ^ 1.10.4
     json_serializable: ^ 3.5.0
   ```
   * Run ```flutter pub get``` to get the dependencies you have added
   * create build.yaml file and add the following content
   ```
   targets:
     $default:
       sources:
         - lib/**
         - graphql/**
         - .hypi/generated-schema.graphql
         - generated-schema.graphql
       builders:
         artemis:
           options:
             schema_mapping:
               - schema: .hypi/generated-schema.graphql
                 output: lib/models/graphql/graphql_api.dart
                 queries_glob: graphql/*.graphql
                 naming_scheme: pathedWithFields
             custom_parser_import: 'package:graphbrainz_example/coercers.dart'
             scalar_mapping:
                 - graphql_type: DateTime
                   dart_type: DateTime
                 - graphql_type: Json
                   dart_type: Set
                 - graphql_type: Long
                   dart_type: int
                 - graphql_type: Any
                   dart_type: String
   ```
6. Run `hypi sync` to generate the schema dart files
    * The full generated schema will be inside .hypi folder `/.hypi/generated-schema.graphql`
    * The generated graphql dart file will be inside `/lib/models/graphql/`