package com.p24studio.airpg.main.constants;

import haxe.extern.Rest;

@:jsRequire("passport")
extern class Passport {
  public static function use(object:Dynamic):Dynamic;
  public static function authenticate(params:Rest<Dynamic>):Dynamic;
  public static function initialize():Dynamic;
  public static function session():Dynamic;
  public static function serializeUser(object:Dynamic):Dynamic;
  public static function deserializeUser(object:Dynamic):Dynamic;
}
