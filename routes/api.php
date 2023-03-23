<?php

use App\Http\Controllers\API\AuthController;
use App\Http\Controllers\API\CartController;
use App\Http\Controllers\API\CategoryController;
use App\Http\Controllers\API\ProductController;
use App\Http\Controllers\API\FrontendController;
use App\Http\Controllers\API\SliderController;
use App\Http\Controllers\API\CheckoutController;
use App\Http\Controllers\API\OrderController;
use App\Models\Category;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;


Route::post('register',[AuthController::class, 'register']);
Route::post('login', [AuthController::class, 'login']);
Route::prefix('view')->group(function () {
    Route::get('getCategory', [FrontendController::class, 'category']);
    Route::get('getCategoryChilde', [FrontendController::class, 'categoryChilde']);


    Route::get('view_productHome', [FrontendController::class, 'viewHome']);
    Route::get('fetchproducts/{slug}', [FrontendController::class, 'product']);
    Route::get('viewproductdetail/{category_slug}/{product_slug}',[FrontendController::class, 'viewproduct']);
    Route::get('getCollectionProduct/{id}',[FrontendController::class, 'collectionsProduct']);

    Route::get('searchProduct/{string}', [FrontendController::class, 'searchProduct']);
});

Route::prefix('cart')->group(function () {
    Route::post('add-to-cart', [CartController::class, 'addtocart']);
    Route::get('cart', [CartController::class, 'viewcart']);
    Route::put('cart-updatequantity/{cart_id}/{scope}',[CartController::class, 'updatequantity']);
    Route::delete('delete-cartitem/{cart_id}',[CartController::class, 'deleteCartitem']);
});


Route::get('get_slider', [SliderController::class, 'index']);

Route::post('validate-order',[OrderController::class, 'validateOrder']);

Route::post('place-order', [OrderController::class, 'placeorder']);


Route::middleware(['auth:sanctum','isAdmin'])->group(function () {
    Route::get('/checkLogin', function(){
        return response()->json(['message' => 'You have been logged in', 'status' => 200], 200);
    });
    // Category
    Route::prefix('category')->group(function(){
        Route::get('view_category',[CategoryController::class, 'index']);
        Route::post('add_Category', [CategoryController::class, 'store']);
        Route::get('edit_category/{id}', [CategoryController::class, 'edit']);
        Route::put('update_category/{id}', [CategoryController::class, 'update']);
        Route::put('delete_category/{id}', [CategoryController::class, 'delete']);
        Route::put('restore_category/{id}', [CategoryController::class, 'restore']);
        Route::put('destroy_category/{id}', [CategoryController::class, 'destroy']);
        Route::get('all_category', [CategoryController::class, 'getAll']);
        Route::get('garbage_category',[CategoryController::class, 'garbageView']);
    });


    
   // product
    Route::prefix('product')->group(function(){
        Route::post('add_product', [ProductController::class, 'store']);
        Route::get('view_product', [ProductController::class, 'index']);
        Route::get('edit_product/{id}', [ProductController::class, 'edit']);
        Route::put('update_product/{id}', [ProductController::class, 'update']);
        Route::put('delete_product/{id}', [ProductController::class, 'delete']);
    }); 


    //slider
    Route::prefix('slider')->group(function(){
        Route::post('add_slider', [SliderController::class, 'store']);
        Route::get('get_viewSlider', [SliderController::class, 'index']);
        Route::get('edit_slider/{id}', [SliderController::class, 'edit']);
        Route::post('update_slider/{id}', [SliderController::class, 'update']);
    });

    // Orders
        Route::get('admin/orders', [OrderController::class, 'index']);
        Route::get('detail_order/{id}', [OrderController::class, 'detailOrder']);


});
Route::middleware(['auth:sanctum'])->group(function () {
    Route::post('logout', [AuthController::class, 'logout']);
});
Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});
