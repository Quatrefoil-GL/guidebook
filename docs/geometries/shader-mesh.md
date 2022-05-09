# `shader-mesh`

Element to render [RawShaderMaterial](https://threejs.org/docs/#api/en/materials/RawShaderMaterial). Inspired by:

- <https://threejs.org/examples/#webgl_buffergeometry_rawshader>
- <https://twitter.com/JimYuan11/status/1523349593496293376>

_This feature is experimental and might require future changes since lack of familiarity to shaders._

### Usage

```cirru
shader-mesh $ {}
  :attributes $ []
    {} (:id :position) (:size 3) (:type :f32)
      :buffer $ concat &
        [] ([] -10 -20 0) ([] 50 0 0) ([] 13 30 0)
    {} (:id :color) (:size 4) (:type :u8)
      :buffer $ concat &
        [] ([] 1 0 0 1) ([] 0 1 0 1) ([] 0 0 1 1 )
  :material $ {} (:kind :raw-shader)
    :uniforms $ {}
    :vertexShader $ inline-shader "\"demo.vert"
    :fragmentShader $ inline-shader "\"demo.frag"
    :wireframe false
    :transparent false
```

Demo of shaders:

```glsl
// vertex

precision mediump float;
precision mediump int;

uniform mat4 modelViewMatrix; // optional
uniform mat4 projectionMatrix; // optional

attribute vec3 position;
attribute vec4 color;

varying vec3 vPosition;
varying vec4 vColor;

void main() {

  vPosition = position;
  vColor = color;

  gl_Position = projectionMatrix * modelViewMatrix * vec4( position, 1.0 );

}

// fragment

precision mediump float;
precision mediump int;

uniform float time;

varying vec3 vPosition;
varying vec4 vColor;

void main() {

  vec4 color = vec4( vColor );
  // color.r += sin( vPosition.x * 10.0 + time ) * 0.5;

  gl_FragColor = color;

  // gl_FragColor = vec4(1.0, 0.0, 0.0, 1.0);

}
```
