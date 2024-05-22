import 'package:fixer_admin_panel_app/features/stores/data/models/item_model.dart';
import 'package:fixer_admin_panel_app/features/stores/data/models/store_model.dart';
import 'package:fixer_admin_panel_app/features/stores/data/repos/stores_repo_impl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'stores_state.dart';

class StoresCubit extends Cubit<StoresState> {
  final StoresRepoImpl repo;
  StoresCubit(this.repo) : super(StoresInitial());
  static StoresCubit get(context) => BlocProvider.of(context);

  List<StoreModel> stores = [];

  void getStores() async {
    emit(StoresLoading());
    final response = await repo.getStores();
    response.fold(
      (l) {
        emit(StoresFailed(l.message));
      },
      (r) {
        stores = r;
        emit(StoresSuccess(r));
      },
    );
  }

  List<ItemModel> storeItems = [];

  void getStoreItems(int id) async {
    emit(GetStoreItemsLoading());
    final response = await repo.getStoreItems(id);
    response.fold(
      (l) {
        emit(GetStoreItemsFailed(l.message));
      },
      (r) {
        storeItems = r;
        emit(GetStoreItemsSuccess(r));
      },
    );
  }

  Future<void> addStore(
      String name, String location, String description) async {
    emit(AddStoreLoading());
    final response = await repo.addStore(name, location, description);
    response.fold(
      (l) {
        emit(AddStoreFailed(l.message));
      },
      (r) {
        emit(AddStoreSuccess(r));
      },
    );
  }

  Future<void> addItem(
      String name, String price, int quantity, String store) async {
    emit(AddItemLoading());
    final response = await repo.addItem(name, price, quantity, store);
    response.fold(
      (l) {
        emit(AddItemFailed(l.message));
      },
      (r) {
        emit(AddItemSuccess(r));
      },
    );
  }
}
