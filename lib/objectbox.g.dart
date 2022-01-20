// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: camel_case_types

import 'dart:typed_data';

import 'package:objectbox/flatbuffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart';
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

import 'src/repo/b_entities/entities.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <ModelEntity>[
  ModelEntity(
      id: const IdUid(1, 909476690538912085),
      name: 'HangManSubLevelProgressEntity',
      lastPropertyId: const IdUid(5, 1269602883069914495),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 1836397154380166905),
            name: 'id',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 984360972089522946),
            name: 'hangmanSubLevelDomainId',
            type: 6,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 205779387823947683),
            name: 'hangmanLevelDomainId',
            type: 6,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 9059096138373813372),
            name: 'contPlayedTimes',
            type: 6,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 1269602883069914495),
            name: 'stars',
            type: 6,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[])
];

/// Open an ObjectBox store with the model declared in this file.
Future<Store> openStore(
        {String? directory,
        int? maxDBSizeInKB,
        int? fileMode,
        int? maxReaders,
        bool queriesCaseSensitiveDefault = true,
        String? macosApplicationGroup}) async =>
    Store(getObjectBoxModel(),
        directory: directory ?? (await defaultStoreDirectory()).path,
        maxDBSizeInKB: maxDBSizeInKB,
        fileMode: fileMode,
        maxReaders: maxReaders,
        queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
        macosApplicationGroup: macosApplicationGroup);

/// ObjectBox model definition, pass it to [Store] - Store(getObjectBoxModel())
ModelDefinition getObjectBoxModel() {
  final model = ModelInfo(
      entities: _entities,
      lastEntityId: const IdUid(1, 909476690538912085),
      lastIndexId: const IdUid(0, 0),
      lastRelationId: const IdUid(0, 0),
      lastSequenceId: const IdUid(0, 0),
      retiredEntityUids: const [],
      retiredIndexUids: const [],
      retiredPropertyUids: const [],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, EntityDefinition>{
    HangManSubLevelProgressEntity: EntityDefinition<
            HangManSubLevelProgressEntity>(
        model: _entities[0],
        toOneRelations: (HangManSubLevelProgressEntity object) => [],
        toManyRelations: (HangManSubLevelProgressEntity object) => {},
        getId: (HangManSubLevelProgressEntity object) => object.id,
        setId: (HangManSubLevelProgressEntity object, int id) {
          object.id = id;
        },
        objectToFB: (HangManSubLevelProgressEntity object, fb.Builder fbb) {
          fbb.startTable(6);
          fbb.addInt64(0, object.id);
          fbb.addInt64(1, object.hangmanSubLevelDomainId);
          fbb.addInt64(2, object.hangmanLevelDomainId);
          fbb.addInt64(3, object.contPlayedTimes);
          fbb.addInt64(4, object.stars);
          fbb.finish(fbb.endTable());
          return object.id;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);

          final object = HangManSubLevelProgressEntity(
              hangmanLevelDomainId:
                  const fb.Int64Reader().vTableGet(buffer, rootOffset, 8, 0),
              hangmanSubLevelDomainId:
                  const fb.Int64Reader().vTableGet(buffer, rootOffset, 6, 0),
              id: const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0),
              contPlayedTimes:
                  const fb.Int64Reader().vTableGet(buffer, rootOffset, 10, 0),
              stars:
                  const fb.Int64Reader().vTableGet(buffer, rootOffset, 12, 0));

          return object;
        })
  };

  return ModelDefinition(model, bindings);
}

/// [HangManSubLevelProgressEntity] entity fields to define ObjectBox queries.
class HangManSubLevelProgressEntity_ {
  /// see [HangManSubLevelProgressEntity.id]
  static final id = QueryIntegerProperty<HangManSubLevelProgressEntity>(
      _entities[0].properties[0]);

  /// see [HangManSubLevelProgressEntity.hangmanSubLevelDomainId]
  static final hangmanSubLevelDomainId =
      QueryIntegerProperty<HangManSubLevelProgressEntity>(
          _entities[0].properties[1]);

  /// see [HangManSubLevelProgressEntity.hangmanLevelDomainId]
  static final hangmanLevelDomainId =
      QueryIntegerProperty<HangManSubLevelProgressEntity>(
          _entities[0].properties[2]);

  /// see [HangManSubLevelProgressEntity.contPlayedTimes]
  static final contPlayedTimes =
      QueryIntegerProperty<HangManSubLevelProgressEntity>(
          _entities[0].properties[3]);

  /// see [HangManSubLevelProgressEntity.stars]
  static final stars = QueryIntegerProperty<HangManSubLevelProgressEntity>(
      _entities[0].properties[4]);
}
