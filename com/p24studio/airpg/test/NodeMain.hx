package com.p24studio.airpg.test;

import js.Node;
import js.node.Http;
import js.node.Path;
import js.Node.console;

using thx.promise.Promise;
import thx.Error;
import thx.Result;

import com.p24studio.airpg.main.domain.*;
import com.p24studio.airpg.main.service.*;
import com.p24studio.airpg.main.constants.*;

using Lambda;
@:jsRequire("fs") // TODO: delete this. Replace it with the native haxe file lib
extern class FS {
    static function existsSync(path:String):Bool;
}

class NodeMain {
    private var PORT = 8089;

    function new() {
        var app = new Express();
        var server = js.node.Http.createServer(cast app);
        var io = new js.npm.socketio.Server(server); // sockets
        var db = new Database("sqlite.db"); // TODO put the db name in config file

        initializeDatabase(db);
        demoDatabase(db);
        demoFighter(db);

        /** Authentication **/
        var ensureLoggedIn = ConnectEnsureLogin.ensureLoggedIn();

        Passport.serializeUser(function(user, done) {
            done(null, user);
        });
        Passport.deserializeUser(function(user, done) {
            done(null, user);
        });

        var strategy = new LocalStrategy(
            function(username, password, done) {
                var user = {
                    'email' : "myMail@zilot.ddns.com",
                    'nickname':"myName"
                };
                done(null, user);
                // User.findOne({ username: username }, function(err, user) {
                //   if (err) { return done(err); }
                //   if (!user) {
                //     return done(null, false, { message: 'Incorrect username.' });
                //   }
                //   if (!user.validPassword(password)) {
                //     return done(null, false, { message: 'Incorrect password.' });
                //   }
                //   return done(null, user);
                // });
            });

            app.use(Passport.initialize());
            app.use(Passport.session());

            Passport.use(strategy);

            /** ROUTING */
            app.get('/',
            function (req, res) {
                res.sendfile(Node.__dirname + '/public/index.html');
            });

//            app.post('/login', Passport.authenticate('local', {}), function(req, res) { // TODO
            app.post('/login', function(req, res) {
                // res.sendfile(Node.__dirname + '/public/auth/index.html');
                res.redirect('/airpg');
            });

            app.get('/resources/:resource', function(req, res) {
                res.sendfile(Node.__dirname + '/public/auth/resources/'+req.params.resource);
            });

            app.get('/js/:js', function(req, res) {
                res.sendfile(Node.__dirname + '/public/auth/js/'+req.params.js);
            });

            app.get('/css/:css', function(req, res) {
                res.sendfile(Node.__dirname + '/public/auth/css/'+req.params.css);
            });

            app.get('/lib/:lib', function(req, res) {
                res.sendfile(Node.__dirname + '/public/auth/lib/'+req.params.lib);
            });

            app.get('/airpg',
            function (req, res) {
                res.sendfile(Node.__dirname + '/public/auth/index.html');
            });



            /** SOCKETS */
            io.on('connection', function (socket) {
                trace("New connection");
                socket.emit('server_message', { message: 'Welcome' });
                socket.on('client_ping', function (data) {
                    trace("Ping received, emitting pong...");
                    io.sockets.emit('pong', data);
                });
            });

            trace("Listening on port " + PORT);
            server.listen(PORT);
        }

        static public function main() {
            var main = new NodeMain();
        }

        static function initializeDatabase(db:Database) {
            /** TEST DATABASE */
            var exists = FS.existsSync("sqlite.db"); // TODO put the db name in config file

            db.serialize(function() {
                if (!exists) {
                    db.run("CREATE TABLE MonsterType (name TEXT, level INTEGER, experience INTEGER, strength INTEGER, agility INTEGER, constitution INTEGER, wisdom INTEGER)");
                    MonsterTypeDAO.add(db, "Terrifiant pantin inerte", 1, 10, 1, 1, 1, 1);
                    MonsterTypeDAO.add(db, "Redoutable mouton", 1, 100, 1, 1, 1, 2);
                    MonsterTypeDAO.add(db, "Chaise vétuste ensorcelée", 2, 100, 1, 3, 1, 2);
                    MonsterTypeDAO.add(db, "Gobelin aveugle", 5, 80, 2, 0, 10, 0);

                    db.run("CREATE TABLE Adventurer (email TEXT, name TEXT, password TEXT, level INTEGER, experience INTEGER, strength INTEGER, agility INTEGER, constitution INTEGER, wisdom INTEGER, healthPoints INTEGER)");
                    var encryptedPassword = Bcrypt.hashSync("password");
                    AdventurerDAO.add(db, "new@zilot.ddns.com", "Nouvel Aventurier", encryptedPassword);
                }
            });
        }

        static function demoDatabase(db:Database) {
            MonsterTypeDAO.findAll(db).success(function(monsterTypes: Array<MonsterType>) {
                for (mt in monsterTypes) {
                    trace(mt);
                }
            });
        }

        static function demoFighter(db:Database) {

            AdventurerDAO.find(db, "new@zilot.ddns.com").success(function(character: Adventurer) {
                MonsterTypeDAO.findAll(db).success(function(monsterTypes: Array<MonsterType>) {
                    var monster = new Monster();
                    var fight = new Fight(character, monster);

                    monster.initializeWithType(monsterTypes[3]);
                    character.attack(monster);
                });
            });
        }
    }
