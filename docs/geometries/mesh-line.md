# MeshLine

Based on https://github.com/spite/THREE.MeshLine

Extra npm module is required:

```bash
yarn add meshline
```

to render mesh line:

```cirru
mesh-line $ {}
  :points $ [] ([] 0 0 0) ([] 3 3 4) ([] 1 4 6) ([] -2 8 0) ([] 2 5 1)
  :position $ [] 5 -10 0
  :material $ {} (:kind :mesh-line) (:color 0xaaaaff)
    :transparent true
    :opacity 0.4
    :depthTest true
    :lineWidth 0.5
```

> implemented with module [meshline](https://github.com/pmndrs/meshline).

