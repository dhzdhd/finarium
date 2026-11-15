import 'package:finarium/src/categories/daos/categories_dao.dart';
import 'package:finarium/src/categories/models/category.dart';
import 'package:finarium/src/core/database_provider.dart';
import 'package:logging/logging.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'categories_controller.g.dart';

final _log = Logger('CategoriesController');

@riverpod
CategoriesDao categoriesDao(Ref ref) =>
    ref.watch(appDatabaseProvider).categoriesDao;

@riverpod
class CategoriesController extends _$CategoriesController {
  @override
  Stream<List<Category>> build() {
    return ref.watch(categoriesDaoProvider).watchAll();
  }

  Future<void> save(Category category, {String? previousName}) async {
    try {
      await ref
          .read(categoriesDaoProvider)
          .save(category, previousName: previousName);
    } catch (error, stackTrace) {
      _log.severe('Could not save category ${category.name}', error, stackTrace);
      rethrow;
    }
  }

  Future<void> reorder(List<Category> ordered) async {
    try {
      await ref.read(categoriesDaoProvider).reorder(ordered);
    } catch (error, stackTrace) {
      _log.severe('Could not reorder categories', error, stackTrace);
      rethrow;
    }
  }

  /// Returns false, and deletes nothing, while transactions or budgets use it.
  Future<bool> delete(Category category) async {
    final dao = ref.read(categoriesDaoProvider);
    try {
      final usage = await dao.usage(category.name);
      if (usage.transactions > 0 || usage.budgets > 0) return false;
      await dao.deleteById(category.id);
      return true;
    } catch (error, stackTrace) {
      _log.severe('Could not delete category ${category.name}', error, stackTrace);
      rethrow;
    }
  }
}
