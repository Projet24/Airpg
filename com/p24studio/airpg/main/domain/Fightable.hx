package com.p24studio.airpg.main.domain;

interface Fightable {
    private var name(get,null):String;
    private var level:Int;
    private var strength:Int;
    private var agility:Int;
    private var constitution:Int;
    private var wisdom:Int;
    private var healthPoints:Int;

    public function attack(target:Fightable):Int;
    public function get_name():String;
}
