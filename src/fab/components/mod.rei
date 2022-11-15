#*
    Useful Components: Cameras, Event Handlers, AI decision making, Physics, Skeletal Animation, Lights, AI and Procedural Mesh Generation
*#

// either bake textures or use procedural textures
// SDF textures for sharp shapes

/*
    Lighting
    - Point, directional and spot lights
*/

Light: enum {
    Ambient
    Point
    Directional
    Spot
    # has a radius
    Ray
}

/*
    Animation
    - Skeletal deformation, weights of bones causing mesh deformation
*/

Animation: {

}

/*
    Position and Coordinates
*/

Coord3D: [f16; 3]

/*
    Camera
    - A view of the scene in a view format (e.g. perspective) at a location and direction
*/

Camera: {
    position: Coord3D
    forward: Coord3D
    up: Coord3D
    right: Coord3D
}

Direction: enum {
    // default value, infer type as [Numeric; 3]
    Forward = [0 0 0.5]
    Left = [0.5 0 0]
    Right = [-0.5 0 0]
    Backward = [0 0 -0.5]
}

// if the camera can be bound to the player, maybe add an offset to the player to get the camer position?
Camera: impl Arcen::State {
    update_position: (&mut self, key: DirectionalKey) {
        match key {
            W => self.position += Foward()
            A => self.position += Left()
            S => self.position += Right()
            D => self.position += Backward()
        }
    }

    // at least one overload required
    set_state: (&mut self, inputs: &[Input]) {
        inputs.for_each(i => {
            // prob gonna be more complex, need a reducer?
            match i {
                // instead of WASD, put them all under directional so they can handled elsewhere
                DirectionalKey(key) => self.update_position(key)
                // basically, mouse clicks and drags
                // and the same kind of keys like S, R, G
                ClickLMB => ()
                ClickRMB => ()
                HoldLMB => ()
                HoldRMB => ()
                ReleaseLMB => ()
                ReleaseRMB => ()
                // mice movement
                MoveLMB => ()
                MoveRMB => ()
                // other keys
                G => ()
            }
        })
    }
}
