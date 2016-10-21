package com.p24studio.airpg.main.constants;
import sys.io.File;
import haxe.Json;

class Rules {
    public static var playerDefaultLife:Int;

    public static function loadRules(configFilePath:String) {
        var rulesString = File.getContent(configFilePath); // TODO: catch file not found exception
        var rules = Json.parse(rulesString);

        isRulesObjectValid(rules); // TODO: catch invalid rules exception
        playerDefaultLife = rules.playerDefaultLife;
    }

    static function isRulesObjectValid(rules:Dynamic) {
        if (rules.playerDefaultLife == null) {
            trace("Invalid rules");
        }
    }
}
