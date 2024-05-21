part of 'stores_cubit.dart';

sealed class StoresState {}

final class StoresInitial extends StoresState {}

final class StoresLoading extends StoresState {}

final class StoresSuccess extends StoresState {
  final List<StoreModel> stores;

  StoresSuccess(this.stores);
}

final class StoresFailed extends StoresState {
  final String message;

  StoresFailed(this.message);
}

final class GetStoreItemsLoading extends StoresState {}

final class GetStoreItemsSuccess extends StoresState {
  final List<ItemModel> storeItems;

  GetStoreItemsSuccess(this.storeItems);
}

final class GetStoreItemsFailed extends StoresState {
  final String message;

  GetStoreItemsFailed(this.message);
}

final class AddStoreLoading extends StoresState {}

final class AddStoreSuccess extends StoresState {
  final String message;

  AddStoreSuccess(this.message);
}

final class AddStoreFailed extends StoresState {
  final String message;

  AddStoreFailed(this.message);
}

final class AddItemLoading extends StoresState {}

final class AddItemSuccess extends StoresState {
  final String message;

  AddItemSuccess(this.message);
}

final class AddItemFailed extends StoresState {
  final String message;

  AddItemFailed(this.message);
}