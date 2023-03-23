<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    use HasFactory;
    protected $table ='categories';
    protected $fillable = ['name','slug','status', 'parent_id'];

    public function product(){
        $this->hasMany(Product::class, 'category_id');
    }

    protected $with = ['children'];
    public function children(){
        return $this->hasMany(Category::class, 'parent_id');
    }
}
