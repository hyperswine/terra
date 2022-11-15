---
layout: default
title: Design
---

## Terra3D

Terra3D is a complete game development framework built with a minimalist UI based on HUDs and the general quanta-minimal theme.

### Comparison with other Game Engines

Terra3D vs Unreal 5:

- terra3d is a batteries included, meta game engine meant to just work once you've set everything up and support incremental compilation as a first class citizen. While unreal 5 is a batteries included, generalist engine that attempts to support as many different styles and applications as possible
- terra3d has an integrated 3d modeler, texture painter, sculptor, skeletal and motion capture animator
- unreal 5 has a greater library of assets and easily scales well with complex 3D applications, but requires royalties if your game gets popular. Backed by a pretty big company epic games
- unreal 5 has more refined AI functionality out of the box, terra3d requires more configuration and refinement for your specific use case

Terra3D vs Godot 4:

- terra3d is built and scripted in rei, godot is built in c++ and gdscript
- terra3d focuses on reusable components and functions via ECS paradigms while godot has an intuitive node based system for managing scenes and assets
- terra3d is built for high efficiency and performance with strong compile time guarentees and safety while godot focuses on ease of use and setup
- godot, like other big engines have a bunch of menus and options as well as a big library of assets, while terra3d focuses on minimalism and incremental generation and refinement of assets via concepts
- terra3d and godot are both fully open source, royalty free software

Terra3D vs Unity:

- terra3d and unity both have an ECS and encourage ECS style of programming and resource management where possible
- unity has a ton of assets, 2d and 3d and is built to scale quite well (albeit not as well as unreal for 3D)
- terra3d is built as a capable meta engine to allow a building of a more specific API for your general uses. It supports a wide range of meta config
- unity is backed by unity technologies, a pretty big company and requires royalties when you games gets big enough
