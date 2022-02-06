# `comp-position-point`

move point's visual position on canvas:

```
quatrefoil.comp.control/comp-position-point (:p0 state)
  , 0.1 0xffaaaa
  fn (next d!)
    d! cursor $ assoc state :p0 next
```

change value using a point:

```
quatrefoil.comp.control/comp-value (:v0 state)
  [] 10 0 0
  , 0.2 ([] -2 20) 0xccaaff $ fn (v1 d!)
    d! cursor $ assoc state :v0 v1
```

change a 2d value using a point:

```
quatrefoil.comp.control/comp-value-2d (:v1 state)
  [] 0 10 0
  , 0.2 0xccaaff $ fn (v d!)
    d! cursor $ assoc state :v1 v
```
