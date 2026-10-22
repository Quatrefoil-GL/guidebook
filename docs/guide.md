## Quatrefoil

> Render Three.js with Respo style code(experimental).

Demo(Chrome with a touch screen) http://r.tiye.me/Quatrefoil-GL/quatrefoil/

### JS methods

This site is documentation, not a standalone Quatrefoil application. For a new
application use the maintained [Quatrefoil workflow](https://github.com/Quatrefoil-GL/quatrefoil-workflow)
and its paired formal `deps.cirru` / `@calcit/procs` versions. The current
workflow uses Calcit 0.30.1 and published Quatrefoil 0.1.10.

Some host helpers live in npm packages; use the versions from that template's
manifest and lockfile instead of adding the historical `@quatrefoil/utils@0.0.3`
pin from this page. Calcit modules and JS packages are separate dependencies.

### Develop this documentation site

Relies on <https://calcit-lang.org> .

```bash
corepack enable

caps --strict --ci # get the formal deps from deps.cirru into .calcit/modules/

yarn install --immutable
caps verify --toolchain

calcit js # compile calcit.cirru once with the version in deps.cirru

yarn vite
```

Edit `calcit.cirru` through official structured Calcit commands, not raw Snapshot
text. Preserve the existing `hud!` page error/success display during hot reload.
The remaining API fragments are reference material, not independently compiled
complete application examples; check the maintained library's actual contracts.

### License

MIT
