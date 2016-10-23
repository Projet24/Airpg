package com.p24studio.airpg.test;

class UnitTestMain {
    static function main() {
        var r = new haxe.unit.TestRunner();

        r.add(new FightCase());

        r.run();
    }
}
