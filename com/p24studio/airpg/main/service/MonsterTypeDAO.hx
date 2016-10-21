package com.p24studio.airpg.main.service;

using thx.promise.Promise;
import thx.Error;

import com.p24studio.airpg.main.domain.MonsterType;

class MonsterTypeDAO {
    public static function add(db, name:String, level:Int, experience:Int, strength:Int, agility:Int, constitution:Int, wisdom:Int) {
        db.serialize(function() {
            var preparedQuery = db.prepare("INSERT INTO MonsterType(name, level, experience, strength, agility, constitution, wisdom) VALUES (?,?,?,?,?,?,?)");
            preparedQuery.run(name, level, experience, strength, agility, constitution, wisdom);
            preparedQuery.finalize();
        });
    }

    public static function findAll(db:Database) {
        return Promise.create(function (resolve: Array<MonsterType> -> Void, reject: Error -> Void) {
            db.all("SELECT rowid AS id, name, level, experience, strength, agility, constitution, wisdom FROM MonsterType", function(err, row:Array<Dynamic>) {
                if (err != null) {
                    throw "error: MonsterTypeDAO.findAll()";
                }
                var monsterTypes = new Array<MonsterType>();
                for (element in row) {
                    var mt = new MonsterType(element.name, element.level, element.experience, element.strength, element.agility, element.constitution, element.wisdom);
                    monsterTypes.push(mt);
                }
                resolve(monsterTypes);
            });
        });
    }
}
