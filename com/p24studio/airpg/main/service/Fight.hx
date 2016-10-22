package com.p24studio.airpg.main.service;

import com.p24studio.airpg.main.domain.*;
import haxe.Json;

class Fight {
    private var attacker:Fighter;
    private var defender:Fighter;
    private var fighted:Bool;
    private var log(get,null):Json;

    public function new(attacker:Fighter, defender:Fighter) {
        this.attacker = attacker;
        this.defender = defender;
    }

    public function isPossible():Bool {
        return !fighted;
    }

    public function begin():Fighter {
        if (!isPossible()) {
            throw "Fight already unfolded";
        }

        var fighterA = attacker; // TODO : get the best agility
        var fighterB = defender; // TODO : get the worst agility

        // TODO : While ... round...
            // TODO : A.attack(B), B.attack(A)..., update log
        // And the winner is..., update log
        return fighterA;
    }

    public function get_log():Json {
        if (fighted) {
            throw "Fight not unfolded yet";
        }
        return log;
    }
}
