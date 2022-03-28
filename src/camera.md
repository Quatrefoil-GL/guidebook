# `set-perspective-camera!`

Initialize camera:

```
ns app.main
  :require
    quatrefoil.dsl.object3d-dom :refer $ set-perspective-camera!

set-perspective-camera! $ {} (:fov 45)
  :near 0.1
  :far 1000
  :position $ [] 0 0 100
  :aspect $ / js/window.innerWidth js/window.innerHeight
```
