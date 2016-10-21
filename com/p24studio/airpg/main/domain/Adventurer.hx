package com.p24studio.airpg.main.domain;

import haxe.ds.Vector;
import com.p24studio.airpg.main.constants.Rules;

class Adventurer extends Fighter {
	private var email:String;
	private var experience:Int;

	public function new(email:String, name:String, level=1, strength=1, agility=1, constitution=2, wisdom=1, experience=0) {
		super(name, level, strength, agility, constitution, wisdom);
		this.experience = experience;
		this.email = email;
	}
}
