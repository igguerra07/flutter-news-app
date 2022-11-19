import 'package:newsapp/src/app/features/news/data/models/source_model.dart';
import 'package:newsapp/src/app/features/news/domain/entities/source.dart';

extension SourceExtension on Source {
  SourceModel toModel() => SourceModel(name: name);
}

extension SouceModelExtension on SourceModel {
  Source toEntity() => Source(name: name);
}
