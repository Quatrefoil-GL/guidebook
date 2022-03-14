# Materials

- `Material`, currently `:line-basic`, `:line-dashed`, `:mesh-basic`, `:mesh-lambert`, `:mesh-standard`.

```
{} (:kind :mesh-standard)
  :opacity 0.9
  :transparent true
  :roughness 0.5
  :metalness 0.9
  :color 0x9050c0
```

```
{} (:kind :mesh-lambert)
  :color 0x808080
  :opacity 0.6
```

```
{} (:kind :mesh-basic)
  :color 0xffff55
  :opacity 0.8
  :transparent true
```

```
{} (:kind :line-dashed)
  :color 0xccccff
  :opacity 0.3
  :transparent true
  :linewidth 2
  :gapSize 0.5
  :dashSize 0.5
```

```
{} (:kind :line-basic)
  :color 0xaaaaff
  :opacity 0.9
  :transparent true
```

For MeshLine, there's an extra material.
