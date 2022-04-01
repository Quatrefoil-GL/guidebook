# `line-segments`

Based on <https://threejs.org/docs/#api/en/objects/LineSegments>.

Pass points in pairs:

```cirru
line-segments $ {}
  :segments $ []
    [] ([] 0 0 0) ([] 3 3 4)
    [] ([] 1 4 6) ([] -2 8 0)
  :position $ [] 10 -10 0
  :material $ {} (:kind :line-dashed)
    :color 0xaaaaff)
    :opacity 0.9
    :transparent true
    :linewidth 4
    :gapSize 0.5
    :dashSize 0.5
```

or pass even number of points:

```cirru
line-segments $ {}
  :points $ [] ([] 0 0 0) ([] 3 3 4) ([] 1 4 6) ([] -2 8 0)
  :position $ [] 15 -10 0
  :material $ {} (:kind :line-dashed)
    :color 0xaaaaff
    :opacity 0.9
    :transparent true
    :linewidth 4
    :gapSize 0.5
    :dashSize 0.5
```
