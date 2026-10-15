## Quatrefoil

> Render Three.js with Respo style code(experimental).

Demo(Chrome with a touch screen) http://r.tiye.me/Quatrefoil-GL/quatrefoil/

### JS methods

some helpers are split in npm package:

```bash
yarn add @quatrefoil/utils@0.0.3
```

### Develop

Relies on <https://calcit-lang.org> .

```bash
corepack enable

caps --strict # get the formal deps from deps.cirru into .calcit/modules/

yarn install --immutable

calcit js # compile calcit.cirru once with the version in deps.cirru

yarn vite
```

### License

MIT
