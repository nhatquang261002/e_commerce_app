// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favourite_product_ids.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetFavouriteProductIDCollection on Isar {
  IsarCollection<FavouriteProductID> get favouriteProductIDs =>
      this.collection();
}

const FavouriteProductIDSchema = CollectionSchema(
  name: r'FavouriteProductID',
  id: -6056910123254652301,
  properties: {
    r'productID': PropertySchema(
      id: 0,
      name: r'productID',
      type: IsarType.long,
    )
  },
  estimateSize: _favouriteProductIDEstimateSize,
  serialize: _favouriteProductIDSerialize,
  deserialize: _favouriteProductIDDeserialize,
  deserializeProp: _favouriteProductIDDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _favouriteProductIDGetId,
  getLinks: _favouriteProductIDGetLinks,
  attach: _favouriteProductIDAttach,
  version: '3.1.0+1',
);

int _favouriteProductIDEstimateSize(
  FavouriteProductID object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _favouriteProductIDSerialize(
  FavouriteProductID object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.productID);
}

FavouriteProductID _favouriteProductIDDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = FavouriteProductID(
    reader.readLong(offsets[0]),
  );
  object.id = id;
  return object;
}

P _favouriteProductIDDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _favouriteProductIDGetId(FavouriteProductID object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _favouriteProductIDGetLinks(
    FavouriteProductID object) {
  return [];
}

void _favouriteProductIDAttach(
    IsarCollection<dynamic> col, Id id, FavouriteProductID object) {
  object.id = id;
}

extension FavouriteProductIDQueryWhereSort
    on QueryBuilder<FavouriteProductID, FavouriteProductID, QWhere> {
  QueryBuilder<FavouriteProductID, FavouriteProductID, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension FavouriteProductIDQueryWhere
    on QueryBuilder<FavouriteProductID, FavouriteProductID, QWhereClause> {
  QueryBuilder<FavouriteProductID, FavouriteProductID, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<FavouriteProductID, FavouriteProductID, QAfterWhereClause>
      idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<FavouriteProductID, FavouriteProductID, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<FavouriteProductID, FavouriteProductID, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<FavouriteProductID, FavouriteProductID, QAfterWhereClause>
      idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension FavouriteProductIDQueryFilter
    on QueryBuilder<FavouriteProductID, FavouriteProductID, QFilterCondition> {
  QueryBuilder<FavouriteProductID, FavouriteProductID, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<FavouriteProductID, FavouriteProductID, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<FavouriteProductID, FavouriteProductID, QAfterFilterCondition>
      idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<FavouriteProductID, FavouriteProductID, QAfterFilterCondition>
      idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<FavouriteProductID, FavouriteProductID, QAfterFilterCondition>
      productIDEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'productID',
        value: value,
      ));
    });
  }

  QueryBuilder<FavouriteProductID, FavouriteProductID, QAfterFilterCondition>
      productIDGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'productID',
        value: value,
      ));
    });
  }

  QueryBuilder<FavouriteProductID, FavouriteProductID, QAfterFilterCondition>
      productIDLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'productID',
        value: value,
      ));
    });
  }

  QueryBuilder<FavouriteProductID, FavouriteProductID, QAfterFilterCondition>
      productIDBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'productID',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension FavouriteProductIDQueryObject
    on QueryBuilder<FavouriteProductID, FavouriteProductID, QFilterCondition> {}

extension FavouriteProductIDQueryLinks
    on QueryBuilder<FavouriteProductID, FavouriteProductID, QFilterCondition> {}

extension FavouriteProductIDQuerySortBy
    on QueryBuilder<FavouriteProductID, FavouriteProductID, QSortBy> {
  QueryBuilder<FavouriteProductID, FavouriteProductID, QAfterSortBy>
      sortByProductID() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productID', Sort.asc);
    });
  }

  QueryBuilder<FavouriteProductID, FavouriteProductID, QAfterSortBy>
      sortByProductIDDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productID', Sort.desc);
    });
  }
}

extension FavouriteProductIDQuerySortThenBy
    on QueryBuilder<FavouriteProductID, FavouriteProductID, QSortThenBy> {
  QueryBuilder<FavouriteProductID, FavouriteProductID, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<FavouriteProductID, FavouriteProductID, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<FavouriteProductID, FavouriteProductID, QAfterSortBy>
      thenByProductID() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productID', Sort.asc);
    });
  }

  QueryBuilder<FavouriteProductID, FavouriteProductID, QAfterSortBy>
      thenByProductIDDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productID', Sort.desc);
    });
  }
}

extension FavouriteProductIDQueryWhereDistinct
    on QueryBuilder<FavouriteProductID, FavouriteProductID, QDistinct> {
  QueryBuilder<FavouriteProductID, FavouriteProductID, QDistinct>
      distinctByProductID() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'productID');
    });
  }
}

extension FavouriteProductIDQueryProperty
    on QueryBuilder<FavouriteProductID, FavouriteProductID, QQueryProperty> {
  QueryBuilder<FavouriteProductID, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<FavouriteProductID, int, QQueryOperations> productIDProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'productID');
    });
  }
}
