package com.p24studio.airpg.main.domain;

import haxe.ds.Vector;
import com.p24studio.airpg.main.constants.Rules;

class Fighter implements Fightable {
	private var name(get,null):String;
	private var level:Int;
	private var strength:Int;
	private var agility:Int;
	private var constitution:Int;
	private var wisdom:Int;
	private var healthPoints:Int;

	public function new(name:String, level:Int, strength:Int, agility:Int, constitution:Int, wisdom:Int) {
		initialize(name, level, strength, agility, constitution, wisdom);
	}

	private function initialize(name:String, level:Int, strength:Int, agility:Int, constitution:Int, wisdom:Int) {
		this.name = name;
		this.level = level;
		this.strength = strength;
		this.agility = agility;
		this.constitution = constitution;
		this.wisdom = wisdom;
		healthPoints = Rules.playerDefaultLife + constitution;
	}

	public function attack(target:Fightable):Int {
		trace('$name frappe ${target.get_name()}');
		return strength;
	}

	public function get_name() {
		return name;
	}
}
