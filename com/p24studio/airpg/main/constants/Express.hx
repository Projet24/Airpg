package com.p24studio.airpg.main.constants;

import haxe.extern.Rest;

@:jsRequire("express")
extern class Express {
    public function new();
    public function use(param1:Rest<Dynamic>):Dynamic;
    public function get(param1:Rest<Dynamic>):Dynamic;
    public function post(param1:Rest<Dynamic>):Dynamic;
}
