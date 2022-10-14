#*
    The mini applet launcher for Terra
*#

use pkg::components::Card

// everything is integrated into the system ui applet
// if using arcen on neutron with default configs

export default Index: () -> Component {
    @arcen Flex {
        Card[page={Fab::Index} title="Fab"]
        Card[page={Chem::Index} title="Chem"]
        Card[page={Eng::Index} title="Eng"]
    }
}
