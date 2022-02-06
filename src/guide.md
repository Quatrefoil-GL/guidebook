## Quatrefoil

> Render Three.js with Respo style code(experimental).

Demo(Chrome with a touch screen) http://r.tiye.me/Quatrefoil-GL/quatrefoil/

### Shortcuts for viewport movememnt

Keyword shortcuts for viewport moving:

- `w` move forward
- `s` move backward
- `a` move left
- `d` move left
- "Up" move up
- "Down" move down
- "Shift Up" rotate to view up
- "Shift Down" rotate to view down
- "Left" rotate to view left
- "Right" rotate to view right

### JS methods

some helpers are split in npm package:

```bash
yarn add @quamolit/quatrefoil-utils
```

### Develop

Relies on https://github.com/calcit-lang/calcit_runner.rs .

```bash
yarn

# also get calcit deps in `~/.config/calcit/modules/`

cr --emit-js -1
yarn vite
```

### License

MIT
