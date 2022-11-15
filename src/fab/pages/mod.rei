#*
    Blender like 3D fabricator software
*#
use pkg::components::Card

export default Index: () -> Component {
    let workspaces, set_workspaces = use_state(Vec[Workspace]())

    @arcen Flex[dir=Col] {
        Menu
        workspaces.map(w => @arcen MaxBox[...w])
    }
}

Menu: () -> Component {
    let open_clicked, set_open_clicked = use_state(false)
    let menu_open, set_menu_open = use_state(true)

    menu_open? @arcen Flex[alpha=50% bg_color=Grey] {
        Button[on_click=set_menu_open(false)] { XIcon }
        MenuCard[title="New"]
        // oh instead of "content" use the implicit children? content: Component...
        MenuCard[title="Open" on_click=set_state(!state)] {
            state? Card[title="Open Recent"] : ()
        }
    }: ()
}

Workspace: () -> Component {
    let inputs, set_inputs = use_state(Vec[Input]())

    // calculate the new camera position and status from the input
    let camera, set_camera = use_state(Camera())

    // maybe a use_effect or use_hook or something?
    use_effect((inputs) => {
        set_camera(inputs)
    })

    @arcen Flex {
        // stuff like the scene, current camera angle, position, etc
        // inside the workspace (when it is foregrounded), listen to a specific set of inputs
    }
}
