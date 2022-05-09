
{} (:package |docs-workflow)
  :configs $ {} (:init-fn |app.main/main!) (:reload-fn |app.main/reload!) (:version |0.0.1)
    :modules $ [] |respo.calcit/ |lilac/ |memof/ |respo-ui.calcit/ |respo-markdown.calcit/ |reel.calcit/ |respo-router.calcit/ |alerts.calcit/ |docs-workflow/
  :entries $ {}
  :files $ {}
    |app.config $ {}
      :defs $ {}
        |dev? $ quote
          def dev? $ = "\"dev" (get-env "\"mode")
        |site $ quote
          def site $ {} (:storage-key "\"workflow")
      :ns $ quote (ns app.config)
    |app.main $ {}
      :defs $ {}
        |*reel $ quote
          defatom *reel $ -> reel-schema/reel (assoc :base schema/store) (assoc :store schema/store)
        |dispatch! $ quote
          defn dispatch! (op op-data)
            when
              and config/dev? $ not= op :states
              println "\"Dispatch:" op
            reset! *reel $ reel-updater updater @*reel op op-data
        |main! $ quote
          defn main! () (register-languages!)
            println "\"Running mode:" $ if config/dev? "\"dev" "\"release"
            if config/dev? $ load-console-formatter!
            render-app!
            add-watch *reel :changes $ fn (reel prev) (render-app!)
            listen-devtools! |k dispatch!
            js/window.addEventListener |beforeunload $ fn (event) (persist-storage!)
            flipped js/setInterval 60000 persist-storage!
            ; let
                raw $ js/localStorage.getItem (:storage-key config/site)
              when (some? raw)
                dispatch! :hydrate-storage $ parse-cirru-edn raw
            println "|App started."
        |mount-target $ quote
          def mount-target $ .!querySelector js/document |.app
        |persist-storage! $ quote
          defn persist-storage! () (js/console.log "\"persist")
            js/localStorage.setItem (:storage-key config/site)
              format-cirru-edn $ :store @*reel
        |reload! $ quote
          defn reload! () $ if (nil? build-errors)
            do (remove-watch *reel :changes) (clear-cache!)
              add-watch *reel :changes $ fn (reel prev) (render-app!)
              reset! *reel $ refresh-reel @*reel schema/store updater
              hud! "\"ok~" "\"Ok"
            hud! "\"error" build-errors
        |render-app! $ quote
          defn render-app! () $ render! mount-target (comp-container @*reel schema/docs) dispatch!
      :ns $ quote
        ns app.main $ :require
          respo.core :refer $ render! clear-cache!
          docs-workflow.comp.container :refer $ comp-container
          app.updater :refer $ updater
          app.schema :as schema
          reel.util :refer $ listen-devtools!
          reel.core :refer $ reel-updater refresh-reel
          reel.schema :as reel-schema
          app.config :as config
          "\"./calcit.build-errors" :default build-errors
          "\"bottom-tip" :default hud!
          docs-workflow.config :refer $ register-languages!
    |app.schema $ {}
      :defs $ {}
        |docs $ quote
          def docs $ []
            {} (:title "\"Guide") (:key :guide)
              :content $ load-doc "\"guide.md"
              :children $ []
            {} (:title "\"Touch Control") (:key :touch-control)
              :content $ load-doc "\"touch-control.md"
              :children $ []
            {} (:title "\"Materials") (:key :materials)
              :content $ load-doc "\"materials.md"
              :children $ []
            {} (:title "\"Color") (:key :color)
              :content $ load-doc "\"color.md"
              :children $ []
            {} (:title "\"Geometries") (:key :geometries)
              :content $ load-doc "\"geometries.md"
              :children $ []
                {} (:title "\"Box") (:key :box)
                  :content $ load-doc "\"geometries/box.md"
                {} (:title "\"Buffer Object") (:key :buffer-object)
                  :content $ load-doc "\"geometries/buffer-object.md"
                {} (:title "\"Group") (:key :group)
                  :content $ load-doc "\"geometries/group.md"
                {} (:title "\"Line") (:key :line)
                  :content $ load-doc "\"geometries/line.md"
                {} (:title "\"MeshLine") (:key :mesh-line)
                  :content $ load-doc "\"geometries/mesh-line.md"
                {} (:title "\"Line Segments") (:key :line-segments)
                  :content $ load-doc "\"geometries/line-segments.md"
                {} (:title "\"Sphere") (:key :sphere)
                  :content $ load-doc "\"geometries/sphere.md"
                {} (:title "\"Parametric") (:key :parametric)
                  :content $ load-doc "\"geometries/parametric.md"
                {} (:title "\"Plane Reflector") (:key :plane-reflector)
                  :content $ load-doc "\"geometries/plane-reflector.md"
                {} (:title "\"Polyhedron") (:key :polyhedron)
                  :content $ load-doc "\"geometries/polyhedron.md"
                {} (:title "\"Scene") (:key :scene)
                  :content $ load-doc "\"geometries/scene.md"
                {} (:title "\"Shape") (:key :shape)
                  :content $ load-doc "\"geometries/shape.md"
                {} (:title "\"Spline") (:key :spline)
                  :content $ load-doc "\"geometries/spline.md"
                {} (:title "\"Text") (:key :text)
                  :content $ load-doc "\"geometries/text.md"
                {} (:title "\"Torus") (:key :torus)
                  :content $ load-doc "\"geometries/torus.md"
                {} (:title "\"Tube") (:key :tube)
                  :content $ load-doc "\"geometries/tube.md"
                {} (:title "\"ShaderMesh") (:key :shader-mesh)
                  :content $ load-doc "\"geometries/shader-mesh.md"
            {} (:title "\"Components") (:key :components)
              :content $ load-doc "\"components.md"
              :children $ []
                {} (:title "\"Control Point") (:key :control-point)
                  :content $ load-doc "\"components/control-point.md"
            {} (:title "\"Lights") (:key :lights)
              :content $ load-doc "\"lights.md"
              :children $ []
                {} (:title "\"Ambient Light") (:key :ambient-light)
                  :content $ load-doc "\"lights/ambient-light.md"
                {} (:title "\"Point Light") (:key :point-light)
                  :content $ load-doc "\"lights/point-light.md"
                {} (:title "\"Rect Area Light") (:key :rect-area-light)
                  :content $ load-doc "\"lights/rect-area-light.md"
            {} (:title "\"Camera") (:key :camera)
              :content $ load-doc "\"camera.md"
              :children $ []
            {} (:title "\"Math") (:key :math)
              :content $ load-doc "\"math.md"
              :children $ []
                {} (:title "\"Quaternions") (:key :quaternions)
                  :content $ load-doc "\"math/quaternions.md"
        |load-doc $ quote
          defmacro load-doc (filename)
            read-file $ str "\"docs/" filename
        |store $ quote
          def store $ {}
            :states $ {}
              :cursor $ []
      :ns $ quote (ns app.schema)
    |app.updater $ {}
      :defs $ {}
        |updater $ quote
          defn updater (store op data op-id op-time)
            case-default op
              do (println "\"unknown op:" op) store
              :states $ update-states store data
              :hydrate-storage data
      :ns $ quote
        ns app.updater $ :require
          respo.cursor :refer $ update-states
