package com.p24studio.airpg.main.service;

using thx.promise.Promise;
import thx.Error;
import com.p24studio.airpg.main.constants.*;
import com.p24studio.airpg.main.domain.Adventurer;


class AdventurerDAO {
    public static function add(db, email:String, name:String, password:String) {
        var encryptedPassword = Bcrypt.hashSync(password);

        var level = 1;  // TODO : put the defaults stats in config file
        var experience = 0;
        var strength = 1;
        var agility = 1;
        var constitution = 1;
        var wisdom = 1;
        var healthPoints = 10; // TODO : compute this

        db.serialize(function() {
            var preparedQuery = db.prepare("INSERT INTO Adventurer(email, name, password, level, experience, strength, agility, constitution, wisdom, healthPoints) VALUES (?,?,?,?,?,?,?,?,?,?)");
            preparedQuery.run(email, name, encryptedPassword, level, experience, strength, agility, constitution, wisdom, healthPoints);
            preparedQuery.finalize();
        });
    }

    public static function find(db:Database, email:String) {
        return Promise.create(function (resolve: Adventurer -> Void, reject: Error -> Void) {
            var preparedQuery = db.prepare("SELECT rowid AS id, email, name, level, experience, strength, agility, constitution, wisdom, healthPoints FROM Adventurer where email=?");
            preparedQuery.all(email, function(err, row:Array<Dynamic>) {
                if (err != null) {
                    throw "error: AdventurerDAO.find()";
                }
                var result = row[0];
                trace(result);
                var adventurer = new Adventurer(result.email, result.name, result.level, result.strength, result.agility, result.constitution, result.wisdom, result.experience);
                resolve(adventurer);
            });
        });
    }
}
