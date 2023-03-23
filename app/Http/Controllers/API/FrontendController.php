<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Category;
use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class FrontendController extends Controller
{
    public function viewHome(){
        $product = DB::table('products')
        ->join('categories', 'products.category_id', '=' ,'categories.id')
        ->select('products.*', 'categories.name as nameCate', 'categories.parent_id as idCate', 'categories.slug as slugCate')->get();
        return response()->json([
            'status' => 200,
            'products'=> $product
        ]);
    }
    public function category(){
        $category = Category::where('status','0')->get();
        return response()->json([
            'status'=>200,
            'category'=>$category
        ]);
    }
    public function categoryChilde(){
        $category = Category::where('parent_id', '>', '0')->get();
        return response()->json([
            'status'=>200,
            'category'=>$category
        ]);
    }

    public function product($slug){
        $category = Category::where('slug', $slug)->where('status','0')->first();
        if($category)
        {
            $product = Product::where('category_id', $category->id)->where('status','0')->get();
            if($product)
            {
                return response()->json([
                    'status'=>200,
                    'product_data'=>[
                        'product'=>$product,
                        'category'=>$category,
                    ]
                ]);
            }
            else
            {
                return response()->json([
                    'status'=>400,
                    'message'=>'No Product Available'
                ]);
            } 
        }
        else
        {
            return response()->json([
                'status'=>404,
                'message'=>'No Such Category Found'
            ]);
        }
    }

    public function viewproduct($category_slug, $product_slug){
        $category = Category::where('slug', $category_slug)->where('status','0')->first();
        if($category)
        {
            $product = Product::where('category_id', $category->id)
                                ->where('slug',$product_slug)
                                ->where('status','0')
                                ->first();
            if($product)
            {
                return response()->json([
                    'status'=>200,
                    'product'=>$product,
    
                ]);
            }
            else
            {
                return response()->json([
                    'status'=>400,
                    'message'=>'No Product Available'
                ]);
            } 
        }
        else
        {
            return response()->json([
                'status'=>404,
                'message'=>'No Such Category Found'
            ]);
        }
    }
    public function collectionsProduct($id){
        $product = DB::table('products')
        ->join('categories', 'products.category_id', '=' ,'categories.id')
        ->where('categories.parent_id', $id)
        ->orWhere('categories.id', $id)
        ->select('products.*', 'categories.slug as slugCate')
        ->get();

        return response()->json([
            'status' => 200,
            'products' => $product,
        ]);
    }

    public function searchProduct($string){
        $data = DB::table('products')
        ->join('categories', 'products.category_id', '=' ,'categories.id')
        ->where('products.name', 'like', '%'.$string.'%')
        ->orWhere('products.color', 'like', $string.'%')
        ->orWhere('products.color', 'like', '%'.$string)
        ->orWhere('categories.name', 'like', '$'.$string.'%')
        ->select('products.*', 'categories.slug as slugCate')
        ->get();

        return response()->json([
            'status' => 200,
            'search' => $data,
        ]);
    }
}
