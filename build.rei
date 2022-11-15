require = {
    // maybe allow version to be overloaded as Version Enum either string
    // or the actual float + any Rc(0.1) or something
    std = { version = 0.1 }
    arcen = { version = 0.1 }
    quanta = { version = 0.1, features = [Minimal] }

    // Rust crates
    Rust = {
        gltf = { version = "1", features = ["extras", "names"] }
    }
}

target = {}
