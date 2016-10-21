package com.p24studio.airpg.main.domain;

import haxe.ds.Vector;
import com.p24studio.airpg.main.constants.Rules;

class Monster extends Fighter {
		private var experience:Int;

		public function new(name="", level=1, strength=1, agility=1, constitution=1, wisdom=1, experience=100) {
				super(name, level, strength, agility, constitution, wisdom);
				this.experience = experience;
		}

		public function initializeWithType(type:MonsterType) {
			initialize(type.get_name(), type.get_level(), type.get_strength(), type.get_agility(), type.get_constitution(), type.get_wisdom());
			experience = type.get_experience();
		}

		public function die():Int {
				var lootedExperience = Std.int(10*(experience/100));
				return lootedExperience > 0 ? lootedExperience : 1;
		}
}
