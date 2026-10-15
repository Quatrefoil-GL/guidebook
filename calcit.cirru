
{}
  :about "|Machine-generated snapshot. Do not edit directly — changes will be overwritten. Use `calcit query` to inspect and `calcit edit`/`calcit tree` to modify. Run `calcit docs agents --contract` before mutations; use `--full` for first orientation or changed contract digest. Manual edits must follow format and schema conventions, then run `calcit edit format`."
  :package |app
  :entries $ {} $ :default
    {} (:description |) (:init-fn 'app.main/main!) (:mode :js) (:reload-fn 'app.main/reload!) (:target :browser)
      :feature-policy $ {}
      :modules $ [] |respo.calcit/ |respo-ui.calcit/ |respo-markdown.calcit/ |reel.calcit/ |respo-router.calcit/ |alerts.calcit/ |docs-workflow/ |js-ffi/
      :type-slots $ {}
  :files $ {}
    'app.config $ %{} 'FileEntry
      :defs $ {}
        'dev? $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def dev?
            = |dev $
              get-env |mode
              , .unwrap-or |
          :examples $ []
          :schema $ :: 'Bool
        'site $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def site (docs-schema/SiteConfig :storage-key |workflow)
          :examples $ []
          :schema $ :: 'docs-workflow.schema/SiteConfig
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns app.config
          :require $ docs-workflow.schema :as docs-schema
    'app.main $ %{} 'FileEntry
      :defs $ {}
        '*reel $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defref *reel (typed/new-reel schema/store)
          :examples $ []
          :schema $ :: 'Ref $ :: 'reel.typed/State 'docs-workflow.schema/Op 'docs-workflow.schema/Store
        'dispatch! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn dispatch! (op)
            when
              and config/dev? $ match op
                (:states cursor data) false
                _ true
              println |Dispatch: op
            reset! *reel $ match (typed/decode-control op)
              (:some action) (typed/apply-control updater @*reel action)
              (:none)
                typed/record-op updater @*reel
                  match op
                    (:states cursor data)
                      match
                        try-decode-map-as cursor $ :: 'List 'Dynamic
                        (:ok checked-cursor) (docs-schema/Op :states checked-cursor data)
                        (:err message) (raise message)
                    (:hydrate-storage data)
                      match
                        try-decode-map-as
                          if (struct? data) (&struct:to-map data) data
                          , 'docs-workflow.schema/Store
                        (:ok checked-store) (docs-schema/Op :hydrate-storage checked-store)
                        (:err message) (raise message)
                    _ $ raise "|Unknown Guidebook operation"
                  generate-id!
                  :timestamp $ shared/date-now-snapshot
            , &unit
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ [] 'Enum
            :features $ #{} :js-ffi
        'main! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn main! () (register-languages!)
            println "|Running mode:" $ if config/dev? |dev |release
            if config/dev? $ load-console-formatter!
            render-app!
            add-watch! *reel :changes $ fn (reel prev) (render-app!)
            listen-devtools! |k dispatch!
            browser/add-event-listener! |beforeunload $ fn (event) (persist-storage!)
            browser/set-interval! persist-storage! 60000
            ; let
              (raw (js/localStorage.getItem (:storage-key config/site)))
              when (some? raw)
                dispatch! :hydrate-storage $ parse-cirru-edn raw
            println "|App started."
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ []
            :features $ #{} :js-ffi
        'mount-target $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def mount-target (browser/query-selector |.app)
          :examples $ []
          :schema $ :: 'Option 'js-ffi.browser/DomElementHost
        'persist-storage! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn persist-storage! () (println |persist)
            browser/storage-set! (:storage-key config/site)
              format-cirru-edn $ :store @*reel
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ []
            :features $ #{} :js-ffi
        'reload! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn reload! ()
            if (nil? build-errors)
              do (remove-watch! *reel :changes) (clear-cache!)
                add-watch! *reel :changes $ fn (reel prev) (render-app!)
                reset! *reel $ typed/refresh updater (deref *reel) schema/store
                hud! |ok~ |Ok
              hud! |error build-errors
            , &unit
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ []
            :features $ #{} :js-ffi
        'render-app! $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defn render-app! ()
            match mount-target
              (:some element)
                render! (narrow-element element) (comp-container @*reel schema/docs) dispatch!
              (:none) (raise "|Missing .app mount element")
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'Unit)
            :args $ []
            :features $ #{} :js-ffi
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns app.main
          :require
            respo.core :refer $ render! clear-cache!
            docs-workflow.comp.container :refer $ comp-container
            app.updater :refer $ updater
            app.schema :as schema
            reel.util :refer $ listen-devtools!
            app.config :as config
            |./calcit.build-errors :default build-errors
            |bottom-tip :default hud!
            docs-workflow.config :refer $ register-languages!
            reel.typed :as typed
            docs-workflow.schema :as docs-schema
            js-ffi.browser :as browser
            js-ffi.shared :as shared
            respo.ffi.browser :refer $ narrow-element
    'app.schema $ %{} 'FileEntry
      :defs $ {}
        'docs $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def docs
            []
              docs-schema/DocNode :title |Guide :key :guide :content (load-doc |guide.md) :children $ []
              docs-schema/DocNode :title "|Touch Control" :key :touch-control :content (load-doc |touch-control.md) :children $ []
              docs-schema/DocNode :title |Materials :key :materials :content (load-doc |materials.md) :children $ []
              docs-schema/DocNode :title |Color :key :color :content (load-doc |color.md) :children $ []
              docs-schema/DocNode :title |Geometries :key :geometries :content (load-doc |geometries.md) :children $ []
                docs-schema/DocNode :title |Box :key :box :content (load-doc |geometries/box.md) :children $ []
                docs-schema/DocNode :title "|Buffer Object" :key :buffer-object :content (load-doc |geometries/buffer-object.md) :children $ []
                docs-schema/DocNode :title |Group :key :group :content (load-doc |geometries/group.md) :children $ []
                docs-schema/DocNode :title |Line :key :line :content (load-doc |geometries/line.md) :children $ []
                docs-schema/DocNode :title |MeshLine :key :mesh-line :content (load-doc |geometries/mesh-line.md) :children $ []
                docs-schema/DocNode :title "|Line Segments" :key :line-segments :content (load-doc |geometries/line-segments.md) :children $ []
                docs-schema/DocNode :title |Sphere :key :sphere :content (load-doc |geometries/sphere.md) :children $ []
                docs-schema/DocNode :title |Parametric :key :parametric :content (load-doc |geometries/parametric.md) :children $ []
                docs-schema/DocNode :title "|Plane Reflector" :key :plane-reflector :content (load-doc |geometries/plane-reflector.md) :children $ []
                docs-schema/DocNode :title |Polyhedron :key :polyhedron :content (load-doc |geometries/polyhedron.md) :children $ []
                docs-schema/DocNode :title |Scene :key :scene :content (load-doc |geometries/scene.md) :children $ []
                docs-schema/DocNode :title |Shape :key :shape :content (load-doc |geometries/shape.md) :children $ []
                docs-schema/DocNode :title |Spline :key :spline :content (load-doc |geometries/spline.md) :children $ []
                docs-schema/DocNode :title |Text :key :text :content (load-doc |geometries/text.md) :children $ []
                docs-schema/DocNode :title |Torus :key :torus :content (load-doc |geometries/torus.md) :children $ []
                docs-schema/DocNode :title |Tube :key :tube :content (load-doc |geometries/tube.md) :children $ []
                docs-schema/DocNode :title |ShaderMesh :key :shader-mesh :content (load-doc |geometries/shader-mesh.md) :children $ []
                docs-schema/DocNode :title "|Some Object" :key :some-object :content (load-doc |geometries/some-object.md) :children $ []
              docs-schema/DocNode :title |Components :key :components :content (load-doc |components.md) :children $ [] $ docs-schema/DocNode :title "|Control Point" :key :control-point :content (load-doc |components/control-point.md) :children ([])
              docs-schema/DocNode :title |Lights :key :lights :content (load-doc |lights.md) :children $ []
                docs-schema/DocNode :title "|Ambient Light" :key :ambient-light :content (load-doc |lights/ambient-light.md) :children $ []
                docs-schema/DocNode :title "|Point Light" :key :point-light :content (load-doc |lights/point-light.md) :children $ []
                docs-schema/DocNode :title "|Rect Area Light" :key :rect-area-light :content (load-doc |lights/rect-area-light.md) :children $ []
              docs-schema/DocNode :title |Camera :key :camera :content (load-doc |camera.md) :children $ []
              docs-schema/DocNode :title |Math :key :math :content (load-doc |math.md) :children $ [] $ docs-schema/DocNode :title |Quaternions :key :quaternions :content (load-doc |math/quaternions.md) :children ([])
          :examples $ []
          :schema $ :: 'List 'docs-workflow.schema/DocNode
        'load-doc $ %{} 'CodeEntry (:doc |)
          :code $ quote $ defmacro load-doc (filename)
            read-file $ str |docs/ filename
          :examples $ []
          :schema $ :: 'Macro $ {}
            :capabilities $ #{} :fs-read
            :expansion $ :: 'Expr 'String
            :required $ [] $ :: 'Expr 'String
        'store $ %{} 'CodeEntry (:doc |)
          :code $ quote $ def store
            docs-schema/Store :states $ {} $ :cursor ([])
          :examples $ []
          :schema $ :: 'docs-workflow.schema/Store
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns app.schema
          :require $ docs-workflow.schema :as docs-schema
    'app.updater $ %{} 'FileEntry
      :defs $ {} $ 'updater
        %{} 'CodeEntry (:doc |)
          :code $ quote $ defn updater (store op op-id op-time)
            match op
              (:states cursor data)
                match
                  try-decode-map-as
                    update-state-tree (:states store) cursor data
                    , 'Map
                  (:ok states) (docs-schema/Store :states states)
                  (:err message) (raise message)
              (:hydrate-storage data) data
              _ $ do (println "|unknown op:" op) store
          :examples $ []
          :schema $ :: 'Fn $ {} (:return 'docs-workflow.schema/Store)
            :args $ [] 'docs-workflow.schema/Store 'docs-workflow.schema/Op 'String 'Number
            :features $ #{} :js-ffi
      :ns $ %{} 'NsEntry (:doc |)
        :code $ quote $ ns app.updater
          :require
            respo.cursor :refer $ update-state-tree
            docs-workflow.schema :as docs-schema
