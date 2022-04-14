# Quaternions

Based on <https://threejs.org/docs/#api/en/math/Quaternion>

`w` is the factor:

```cirru
[] x y z w
```

Under the scope `quatrefoil.math`:

- `q+` add multiple quaternions
- `q-`
- `q*`
- `&q*` add 2 quaternions
- `&q+`
- `&q-`
- `q-inverse`
- `q-conjugate`
- `q-length`
- `q-length2` length without call sqrt
- `q-scale` takes a quaternion and a scalar
- `v+` add multiple vectors
- `v-`
- `&v+` add 2 vectors
- `&v-`
- `v-scale` takes a vector and a scalar
- `&c+` add 2 complex numbers
- `&c-`
- `&c*`
- `c-length`
- `c-length2`
- `c-conjutate`
