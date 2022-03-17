# Control Point

move point's visual position on canvas:

```
quatrefoil.comp.control/comp-pin-point
  {}
    :position $ :p0 state
    :speed 0.1
    :color 0xffaaaa
    :opacity 0.8
    :radius 1
    :label |A
    :text-color $ hslx 20 90 80
  fn (next d!)
    d! cursor $ assoc state :p0 next
```

change value using a point:

```
quatrefoil.comp.control/comp-value
  {}
    :radius 1
    :value (:v0 state)
    :position $ [] 10 0 0
    :speed 0.2
    :bound $ [] -2 20
    :color $ hslx 200 90 70
    :text-color $ hslx 20 90 80
    :show-text? false
    :fract-length 2
    :opacity 0.8
    :label |A
  fn (v1 d!)
    d! cursor $ assoc state :v0 v1
```

change a 2d value using a point:

```
quatrefoil.comp.control/comp-value-2d
  {}
    :value $ :v1 state
    :position $ [] 0 10 0
    :speed 0.2
    :color 0xccaaff
    :fract-length 2
    :label |A
  fn (v d!)
    d! cursor $ assoc state :v1 v
```
