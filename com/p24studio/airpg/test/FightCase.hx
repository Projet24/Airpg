package com.p24studio.airpg.test;

import com.p24studio.airpg.main.domain.*;
import com.p24studio.airpg.main.service.Fight;

class FightCase extends haxe.unit.TestCase {
    public function testSimpleFight() {
        // TODO this test
        var adventurer = new Adventurer("name", "mail@mail.com");
        var monster = new Monster();
        var fight = new Fight(adventurer, monster);
        assertEquals("A", "A");
        assertTrue(true);
        assertFalse(false);
    }

}
