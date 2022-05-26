# `some-object`

It actually renders a `group` element with "value" element inside. If "value" element is not loaded, then nothing got mounted. Actual element is stored in the atom `quatrefoil.globals/*loaded-objects` with a key.

This feature is currently used in rendering GLTF models created via three.js with loaders.

```cirru
some-object $ {} (:key :sakura)
  :loaded? $ some? (get @*loaded-objects :sakura)
  :position $ [] 0 -100 -100
  :scale $ [] 200 200 200
```

the fields

- `key` specifies the key of object inside `*loaded-objects`
- `loaded?` is only used to trigger updates, not really being used
