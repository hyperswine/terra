#*
    Terra Engine
    by Jasen Q
*#

// ECS API in rei but with more choices of how to organise data
// with std::prelude::Table, std::prelude::SparseSet

// simple addition of characters, building of storylines, scripts (just fns on entities)
// transformations of models bound to an entity

Level: trait ()

/* Example: Super Mario */

GameData: {
    // order matters for simple "play"
    // infer as List[Obj1 | List[Obj2]]
    Levels: [
        {
            label: "Menu"
            ui: MainMenuUI
        }
        [
            {
                label: "1-1"
                entities: [
                    Entity(Goomba, [5 1])
                    Entity(Block, [0 2])
                    Entity(Block, [1 2])
                    Entity(Block, [2 2])
                    Entity(Mario, [0 1])
                    // ground
                    Entity(Block, [0 0])
                ]
                // layout of entities, and a list of systems that run specifically for that level
                systems: [enemy_seek]
            }
        ]
    ]

    // or load level 1 and instead make the UI an overlay option when you respawn
    // no need to parameterise in this case
    MainMenuUI: Box[dir=Vertical center_all=true background=Level11BackgroundTexture] {
        SuperMarioBanner
        PlayerOneSelect
        PlayerTwoSelect
    }

    driver: () {
        // depends how you want to do it. Lazy loading, load the first 2 levels for example
        // just read first 2 levels
        let levels = [read("levels/" + i) for i in 0..2]
        let levels = levels.prepend("levels/menu")

        // play the levels. or levels.first().play()
        levels.play()
    }

    invariants: {
        in_game_ui: () -> Component {
            Health: \Text[color=White alpha=0.5]

            Box[dir=Horizontal font_size=Rem(5)] {
                Health Coins ...
            }
        }
    }

    /*
        How systems work
        - dt triggered
        - event triggered (includes player inputs and game interactions)

        OR just dt triggered and events are pushed into the event queue
        a quick check for each system if it matches, e.g. if event queue or sub event queue is empty, then return
        otherwise it matters because of game tick, like physics (motion of characters)
    */

    // usually a global system once you get into PLAY
    enemy_seek: (player: _, enemies: _, dt: _) {
        enemies.map(e => e.move(a_star_step(player, dt)))
    }

    // can be global or local. Local if you have a lot of differences between
    event_music: (level: _, events: _) {
        // bgm, action music like jump, reaction music like getting hit and dying, interactions with pipes
        // I think you can do overrides with a system too
        // \... is sugar for () => ... or (_) => ... depending on the arity
        events.for_each(\match {
            PlayerJump => play_jump_sound()
            // e.g. hitting a goomba
            PlayerHitSoft => play_hit_soft()
            PlayerDie => play_death_sound()
            // e.g. hitting a brick
            PlayerHitHard => play_hit_hard()
            PlayerGoDownPipe => play_go_down_pipe()
            FlagPoleHit => ...
            RoundWin => ...
            KillEnemy => ...
            PowerUp => ...
            CoinHit => ...
            BrickBreak => ...
        })
    }

    // idk about bgm... it could just be another running system that you play once and thats it
    // or doesnt have a condition so theres no need to match it. Or you can match it but it depends on if event is a level change or new level spawn
    bgm: (level: _) {
        match level {
            // constantly play bgm
            Overworld => play_overworld()
            Underworld => play_underworld()
            BowserCastle => ...
            Sea => ...
        }
    }
}
