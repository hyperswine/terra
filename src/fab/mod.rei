#*
    Terra Fabrication Framework
*#

/*
    Game Level
    - layout of entities (with components)
    - scripted systems that run in the scene or "level"
    - incremental builds are a key thing in high level applications and design like gamedev
    - so as throwaway prototypes, which can be simulated with the flow graph and quick tests like unreal
*/

// NOTE on parenthesis: Whatever the material inside the Parentheses, it must not be syntactically necessary to the encompassing sentence
// also in the code, you want the operators themselves to show you the evaluation order since its not going to change, unless you want to eval something first

export Level: {
    // a level may contain references to other levels (owned by the base game loop or menu or game save context?)
    // level_connections: &[Level]

    // entities: mesh, lighting, etc
    scene: Scene

    // all systems in order
    systems: &[system ()]
}

// the problem with models, stuff like gltf is that "scene graphs" are considered only in the context of materials and meshes (and anims)
