// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'in_cart_product_ids.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetInCartProductIDCollection on Isar {
  IsarCollection<InCartProductID> get inCartProductIDs => this.collection();
}

const InCartProductIDSchema = CollectionSchema(
  name: r'InCartProductID',
  id: 4913816492132456721,
  properties: {
    r'productID': PropertySchema(
      id: 0,
      name: r'productID',
      type: IsarType.long,
    )
  },
  estimateSize: _inCartProductIDEstimateSize,
  serialize: _inCartProductIDSerialize,
  deserialize: _inCartProductIDDeserialize,
  deserializeProp: _inCartProductIDDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _inCartProductIDGetId,
  getLinks: _inCartProductIDGetLinks,
  attach: _inCartProductIDAttach,
  version: '3.1.0+1',
);

int _inCartProductIDEstimateSize(
  InCartProductID object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _inCartProductIDSerialize(
  InCartProductID object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.productID);
}

InCartProductID _inCartProductIDDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = InCartProductID(
    reader.readLong(offsets[0]),
  );
  object.id = id;
  return object;
}

P _inCartProductIDDeserializeProp<P>(
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

Id _inCartProductIDGetId(InCartProductID object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _inCartProductIDGetLinks(InCartProductID object) {
  return [];
}

void _inCartProductIDAttach(
    IsarCollection<dynamic> col, Id id, InCartProductID object) {
  object.id = id;
}

extension InCartProductIDQueryWhereSort
    on QueryBuilder<InCartProductID, InCartProductID, QWhere> {
  QueryBuilder<InCartProductID, InCartProductID, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension InCartProductIDQueryWhere
    on QueryBuilder<InCartProductID, InCartProductID, QWhereClause> {
  QueryBuilder<InCartProductID, InCartProductID, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<InCartProductID, InCartProductID, QAfterWhereClause>
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

  QueryBuilder<InCartProductID, InCartProductID, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<InCartProductID, InCartProductID, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<InCartProductID, InCartProductID, QAfterWhereClause> idBetween(
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

extension InCartProductIDQueryFilter
    on QueryBuilder<InCartProductID, InCartProductID, QFilterCondition> {
  QueryBuilder<InCartProductID, InCartProductID, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<InCartProductID, InCartProductID, QAfterFilterCondition>
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

  QueryBuilder<InCartProductID, InCartProductID, QAfterFilterCondition>
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

  QueryBuilder<InCartProductID, InCartProductID, QAfterFilterCondition>
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

  QueryBuilder<InCartProductID, InCartProductID, QAfterFilterCondition>
      productIDEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'productID',
        value: value,
      ));
    });
  }

  QueryBuilder<InCartProductID, InCartProductID, QAfterFilterCondition>
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

  QueryBuilder<InCartProductID, InCartProductID, QAfterFilterCondition>
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

  QueryBuilder<InCartProductID, InCartProductID, QAfterFilterCondition>
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

extension InCartProductIDQueryObject
    on QueryBuilder<InCartProductID, InCartProductID, QFilterCondition> {}

extension InCartProductIDQueryLinks
    on QueryBuilder<InCartProductID, InCartProductID, QFilterCondition> {}

extension InCartProductIDQuerySortBy
    on QueryBuilder<InCartProductID, InCartProductID, QSortBy> {
  QueryBuilder<InCartProductID, InCartProductID, QAfterSortBy>
      sortByProductID() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productID', Sort.asc);
    });
  }

  QueryBuilder<InCartProductID, InCartProductID, QAfterSortBy>
      sortByProductIDDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productID', Sort.desc);
    });
  }
}

extension InCartProductIDQuerySortThenBy
    on QueryBuilder<InCartProductID, InCartProductID, QSortThenBy> {
  QueryBuilder<InCartProductID, InCartProductID, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<InCartProductID, InCartProductID, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<InCartProductID, InCartProductID, QAfterSortBy>
      thenByProductID() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productID', Sort.asc);
    });
  }

  QueryBuilder<InCartProductID, InCartProductID, QAfterSortBy>
      thenByProductIDDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'productID', Sort.desc);
    });
  }
}

extension InCartProductIDQueryWhereDistinct
    on QueryBuilder<InCartProductID, InCartProductID, QDistinct> {
  QueryBuilder<InCartProductID, InCartProductID, QDistinct>
      distinctByProductID() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'productID');
    });
  }
}

extension InCartProductIDQueryProperty
    on QueryBuilder<InCartProductID, InCartProductID, QQueryProperty> {
  QueryBuilder<InCartProductID, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<InCartProductID, int, QQueryOperations> productIDProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'productID');
    });
  }
}
