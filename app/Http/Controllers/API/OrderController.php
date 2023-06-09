<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Cart;
use App\Models\Order;
use App\Models\Orders;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Validator;


class OrderController extends Controller
{
    public function index()
    {
        $orders = Orders::all();
        return response()->json([
            'status' => 200,
            'orders' => $orders,
        ]);
    }
    public function detailOrder($id){
        $data = DB::table('orderitems')
        ->join('orders', 'orderitems.order_id', '=', 'orders.id')
        ->join('products', 'orderitems.product_id', '=', 'products.id')
        ->select('orderitems.id as idOrder','orderitems.quantity', 'orderitems.price', 'products.name as pro_name', 'products.color as pro_color', 'orders.*')
        ->where('orderitems.order_id', $id)
        ->get();

        // 'orderitems.quantity', 'orderitems.price', 'products.name as pro_name', 'products.color as pro_color', 'orders.*'
        return response()->json([
            'status' => 200,
            'orders' =>  $data,
        ]);
    }
    public function placeorder(Request $request)
    {
        if(auth('sanctum')->check())
        {
            $validator = Validator::make($request->all(), [
                'firstname' => 'required|max:191',
                'lastname' => 'required|max:191',
                'phone' => 'required|max:191',
                'email' => 'required|max:191',
                'address' => 'required|max:191',
                'city' => 'required|max:191',
                'state' => 'required|max:191',
                'zipcode' => 'required|max:191',

            ]);

            if($validator->fails())
            {
                return response()->json([
                    'status'=>422,
                    'errors'=>$validator->messages(),
                ]);
            }
            else
            {
                $user_id = auth('sanctum')->user()->id;
                $order = new Orders();
                $order->user_id = $user_id;
                $order->firstname = $request->firstname;
                $order->lastname = $request->lastname;
                $order->phone = $request->phone;
                $order->email = $request->email;
                $order->address = $request->address;
                $order->city = $request->city;
                $order->state = $request->state;
                $order->zipcode = $request->zipcode;

                $order->payment_mode = $request->payment_mode;
                $order->payment_id = $request->payment_id;
                $order->tracking_no= 'BKShop' .rand(1111,9999);
                $order->save();

                $cart = Cart::where('user_id', $user_id)->get();

                $orderitems = [];
                foreach($cart as $item){
                    $orderitems[] = [
                        'product_id'=>$item->product_id,
                        'quantity'=>$item->product_quantity,
                        'price'=>$item->product->seller_price,
                    ];

                    $item->product->update([
                        'quantity'=> $item->product->quantity - $item->product_quantity
                    ]);
                }

                $order->orderitems()->createMany($orderitems);
                Cart::destroy($cart);

                return response()->json([
                    'status' => 200,
                    'message' => 'Order Placed Successfully',
                ]);
            }
        }
        else
        {
            return response()->json([
                'status' => 401,
                'message' => ' Login to Continue',
            ]);
        }
    }

    public function validateOrder(Request $request)
    {
        if(auth('sanctum')->check())
        {
            $validator = Validator::make($request->all(), [
                'firstname' => 'required|max:191',
                'lastname' => 'required|max:191',
                'phone' => 'required|max:191',
                'email' => 'required|max:191',
                'address' => 'required|max:191',
                'city' => 'required|max:191',
                'state' => 'required|max:191',
                'zipcode' => 'required|max:191',

            ]);

            if($validator->fails())
            {
                return response()->json([
                    'status'=>422,
                    'errors'=>$validator->messages(),
                ]);
            }
            else
            {
                return response()->json([
                    'status' => 200,
                    'message' => 'Form Validated Successfully',
                ]);
            }
        }
        else
        {
            return response()->json([
                'status' => 401,
                'message' => ' Login to Continue',
            ]);
        }
            
    }
}
