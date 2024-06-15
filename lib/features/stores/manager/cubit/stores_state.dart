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

final class GetStoreCouponsLoading extends StoresState {}

final class GetStoreCouponsSuccess extends StoresState {
  final List<CopounModel> storeCoupons;

  GetStoreCouponsSuccess(this.storeCoupons);
}

final class GetStoreCouponsFailed extends StoresState {
  final String message;

  GetStoreCouponsFailed(this.message);
}

final class AddCouponLoading extends StoresState {}

final class AddCouponSuccess extends StoresState {
  final CopounModel coupon;

  AddCouponSuccess(this.coupon);
}

final class AddCouponFailed extends StoresState {
  final String message;

  AddCouponFailed(this.message);
}

final class DeleteItemLoading extends StoresState {}

final class DeleteItemSuccess extends StoresState {
  final String message;

  DeleteItemSuccess(this.message);
}

final class DeleteItemFailed extends StoresState {
  final String message;

  DeleteItemFailed(this.message);
}

final class DeleteStoreLoading extends StoresState {}

final class DeleteStoreSuccess extends StoresState {
  final String message;

  DeleteStoreSuccess(this.message);
}

final class DeleteStoreFailed extends StoresState {
  final String message;

  DeleteStoreFailed(this.message);
}

class ImagePickedFromGallerySuccessState extends StoresState {}

class ImagePickedFromGalleryErrorState extends StoresState {}

class UploadImageLoadingState extends StoresState {}

class UploadImageSuccessState extends StoresState {
  final String imageUrl;

  UploadImageSuccessState(this.imageUrl);
}

class UploadImageErrorState extends StoresState {
  final String message;

  UploadImageErrorState(this.message);
}
