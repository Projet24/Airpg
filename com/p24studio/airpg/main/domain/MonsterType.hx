package com.p24studio.airpg.main.domain;

class MonsterType {
    private var name(get,null):String;
    private var level(get,null):Int;
    private var experience(get,null):Int;
    private var strength(get,null):Int;
    private var agility(get,null):Int;
    private var constitution(get,null):Int;
    private var wisdom(get,null):Int;

    public function new(name:String, level:Int, experience:Int, strength:Int, agility:Int, constitution:Int, wisdom:Int) {
        this.name = name;
        this.level = level;
        this.experience = experience;
        this.strength = strength;
        this.agility = agility;
        this.constitution = constitution;
        this.wisdom = wisdom;
    }

    public function get_name() {
        return name;
    }
    public function get_level() {
        return level;
    }
    public function get_experience() {
        return experience;
    }
    public function get_strength() {
        return strength;
    }
    public function get_agility() {
        return agility;
    }
    public function get_constitution() {
        return constitution;
    }
    public function get_wisdom() {
        return wisdom;
    }

    public function toString() {
        return '$name ($level)';
    }
}
