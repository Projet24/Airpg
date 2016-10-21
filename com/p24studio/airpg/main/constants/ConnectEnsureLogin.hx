package com.p24studio.airpg.main.constants;

import haxe.extern.Rest;

@:jsRequire("connect-ensure-login")
extern class ConnectEnsureLogin {
  public static function ensureLoggedIn():Dynamic;
}
