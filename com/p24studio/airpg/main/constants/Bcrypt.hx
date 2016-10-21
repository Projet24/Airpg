package com.p24studio.airpg.main.constants;

import haxe.extern.Rest;

@:jsRequire("bcrypt-nodejs")
extern class Bcrypt {
  static function compareSync(params:Rest<Dynamic>):Dynamic;
  static function hashSync(params:Rest<Dynamic>):Dynamic;
}
