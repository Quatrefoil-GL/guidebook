# `buffer-object`

- `buffer-object` based on `BufferGeometry`

and `flat-values` is a macro for turning lists into a flat one.

```
buffer-object $ {}
  :vertices $ flat-values
    0 0 0
    10 0 0
    5 0 8
    5 8 0
  :indices $ flat-values
    0 1 2
    0 2 3
    1 2 3
```
