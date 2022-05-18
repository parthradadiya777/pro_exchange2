import 'package:get/get.dart';
import 'package:pro_exchange2/app/modules/profile_page/edit_profile/views/editimage_view.dart';

import '../modules/add_data_page/bikes/bindings/bikes_binding.dart';
import '../modules/add_data_page/bikes/views/bikes_view.dart';
import '../modules/add_data_page/bindings/add_data_page_binding.dart';
import '../modules/add_data_page/car/bindings/car_binding.dart';
import '../modules/add_data_page/car/views/car_view.dart';
import '../modules/add_data_page/electronics/Comuters_Leptop/bindings/comuters_leptop_binding.dart';
import '../modules/add_data_page/electronics/Comuters_Leptop/views/comuters_leptop_view.dart';
import '../modules/add_data_page/furniture/bindings/furniture_binding.dart';
import '../modules/add_data_page/furniture/views/furniture_view.dart';
import '../modules/add_data_page/views/add_data_page_view.dart';
import '../modules/bottom_navigation_bar/bindings/bottom_navigation_bar_binding.dart';
import '../modules/bottom_navigation_bar/views/bottom_navigation_bar_view.dart';
import '../modules/buy_page/bindings/buy_page_binding.dart';
import '../modules/buy_page/views/buy_page_view.dart';
import '../modules/category/electronicscategory/Tv/bindings/tv_binding.dart';
import '../modules/category/electronicscategory/Tv/views/tv_view.dart';
import '../modules/category/electronicscategory/computer/bindings/computer_binding.dart';
import '../modules/category/electronicscategory/computer/views/computer_view.dart';
import '../modules/category/electronicscategory/printers/bindings/printers_binding.dart';
import '../modules/category/electronicscategory/printers/views/printers_view.dart';
import '../modules/category/electronicscategory/washingmachine/bindings/washingmachine_binding.dart';
import '../modules/category/electronicscategory/washingmachine/views/washingmachine_view.dart';
import '../modules/category/flats/bindings/flats_binding.dart';
import '../modules/category/flats/views/flats_view.dart';
import '../modules/google_maps/bindings/google_maps_binding.dart';
import '../modules/google_maps/views/google_maps_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/details/bindings/details_binding.dart';
import '../modules/home/details/views/details_view.dart';
import '../modules/home/views/home_view.dart';

import '../modules/order/bindings/order_binding.dart';
import '../modules/order/chat_screen/bindings/chat_screen_binding.dart';
import '../modules/order/chat_screen/views/chat_screen.dart';
import '../modules/order/purchase_product/bindings/purchase_product_binding.dart';
import '../modules/order/purchase_product/views/purchase_product_view.dart';
import '../modules/order/views/order_view.dart';
import '../modules/order/wishlist_page/bindings/wishlist_page_binding.dart';
import '../modules/order/wishlist_page/views/wishlist_page_view.dart';
import '../modules/profile_page/bindings/profile_page_binding.dart';
import '../modules/profile_page/edit_profile/bindings/edit_profile_binding.dart';
import '../modules/profile_page/edit_profile/views/edit_profile_view.dart';
import '../modules/profile_page/views/profile_page_view.dart';
import '../modules/profile_page/views/profile_product_details.dart';
import '../modules/signUp_page/bindings/sign_up_page_binding.dart';
import '../modules/signUp_page/views/sign_up_page_view.dart';
import '../modules/verifiers/bindings/verifiers_binding.dart';
import '../modules/verifiers/views/verifiers_view.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SIGN_UP_PAGE;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
      children: [
        GetPage(
          name: _Paths.DETAILS,
          page: () => DetailsView(),
          binding: DetailsBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.SIGN_UP_PAGE,
      page: () => SignUpPageView(),
      binding: SignUpPageBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE_PAGE,
      page: () => ProfilePageView(),
      binding: ProfilePageBinding(),
      children: [
        GetPage(
          name: _Paths.EDIT_PROFILE,
          page: () => EditProfileView(),
          binding: EditProfileBinding(),
        ),
        GetPage(
          name: _Paths.EDIT_IMAGE,
          page: () => EditimageView(),
        ),
        GetPage(
          name: _Paths.PROFILE_PRODUCT_DETAILS,
          page: () => profile_product_details(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.VERIFIERS,
      page: () => VerifiersView(),
      binding: VerifiersBinding(),
      children: [
        GetPage(
          name: _Paths.VERIFIERS,
          page: () => VerifiersView(),
          binding: VerifiersBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.ORDER,
      page: () => OrderView(),
      binding: OrderBinding(),
      children: [
        GetPage(
          name: _Paths.CHAT_SCREEN,
          page: () => ChatScreenView(),
          binding: ChatScreenBinding(),
        ),
        GetPage(
          name: _Paths.WISHLIST_PAGE,
          page: () => WishlistPageView(),
          binding: WishlistPageBinding(),
        ),
        GetPage(
          name: _Paths.PURCHASE_PRODUCT,
          page: () => PurchaseProductView(),
          binding: PurchaseProductBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.BUY_PAGE,
      page: () => BuyPageView(),
      binding: BuyPageBinding(),
    ),
    GetPage(
      name: _Paths.BOTTOM_NAVIGATION_BAR,
      page: () => BottomNavigationBarView(),
      binding: BottomNavigationBarBinding(),
    ),
    // GetPage(
    //   name: _Paths.SEARCH_PAGE,
    //   page: () => SearchPageView(),
    //   binding: SearchPageBinding(),
    // ),
    GetPage(
      name: _Paths.ADD_DATA_PAGE,
      page: () => AddDataPageView(),
      binding: AddDataPageBinding(),
      children: [
        GetPage(
          name: _Paths.CAR,
          page: () => CarView(),
          binding: CarBinding(),
          children: [
            GetPage(
              name: _Paths.CAR,
              page: () => CarView(),
              binding: CarBinding(),
            ),
          ],
        ),
        GetPage(
          name: _Paths.FURNITURE,
          page: () => FurnitureView(),
          binding: FurnitureBinding(),
        ),
        // GetPage(
        //   name: _Paths.MOBILES,
        //   page: () => MobileView(),
        //   binding: MobilesBinding(),
        // ),
        GetPage(
          name: _Paths.BIKES,
          page: () => BikesView(),
          binding: BikesBinding(),
        ),
        // GetPage(
        //   name: _Paths.FRIDGE,
        //   page: () => FridgeView(),
        //   binding: FridgeBinding(),
        //   children: [
        //     GetPage(
        //       name: _Paths.FRIDGE,
        //       page: () => FridgeView(),
        //       binding: FridgeBinding(),
        //     ),
        //   ],
        // ),
        // GetPage(
        //   name: _Paths.CAMERA,
        //   page: () => CameraView(),
        //   binding: CameraBinding(),
        //   children: [
        //     GetPage(
        //       name: _Paths.CAMERA,
        //       page: () => CameraView(),
        //       binding: CameraBinding(),
        //     ),
        //   ],
        // ),
        GetPage(
          name: _Paths.COMUTERS_LEPTOP,
          page: () => ComutersLeptopView(),
          binding: ComutersLeptopBinding(),
        ),
        // GetPage(
        //   name: _Paths.OTHERS,
        //   page: () => OthersView(),
        //   binding: OthersBinding(),
        //   children: [
        //     GetPage(
        //       name: _Paths.OTHERS,
        //       page: () => OthersView(),
        //       binding: OthersBinding(),
        //     ),
        //   ],
        // ),
      ],
    ),
    GetPage(
      name: _Paths.FLATS,
      page: () => FlatsView(),
      binding: FlatsBinding(),
    ),
    GetPage(
      name: _Paths.PRINTERS,
      page: () => PrintersView(),
      binding: PrintersBinding(),
    ),
    GetPage(
      name: _Paths.WASHINGMACHINE,
      page: () => WashingmachineView(),
      binding: WashingmachineBinding(),
    ),
    GetPage(
      name: _Paths.TV,
      page: () => TvView(),
      binding: TvBinding(),
    ),
    GetPage(
      name: _Paths.COMPUTER,
      page: () => ComputerCategoryView(),
      binding: ComputerBinding(),
    ),
    // GetPage(
    //   name: _Paths.MOBILE,
    //   page: () => MobileView(),
    //   binding: MobileBinding(),
    // ),
    GetPage(
      name: _Paths.GOOGLE_MAPS,
      page: () => GoogleMapsView(),
      binding: GoogleMapsBinding(),
    ),
  ];
}
