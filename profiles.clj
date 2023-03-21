{:user {:plugins [[lein-ancient "0.7.0"]
                  [lein-count "1.0.9"]
                  [lein-cljfmt "0.9.2"]]
        :aliases {"anc" ^{:doc "Check all dependencies for updates"}
                  ["do"
                   ["ancient" "check-profiles" ":all" ":check-clojure"]
                   ["ancient" ":all" ":check-clojure"]]
                  "anc-up" ^{:doc "Upgrade all dependencies interactively"}
                  ["do"
                   ["ancient" "upgrade" ":interactive" ":all" ":check-clojure"]
                   ["ancient" "upgrade-profiles" ":interactive" ":all" ":check-clojure"]]
                  "anc-snapshot" ^{:doc "Check all dependencies for updates, allow snapshots"}
                  ["ancient" ":allow-all" ":all" ":check-clojure"]
                  "dev" ^{:doc "Run development repl"}
                  ["repl" ":headless"]
                  "dev-clean" ^{:doc "Run fully clean development repl"}
                  ["-U" "do" "clean" ["repl" ":headless"]]
                  "deps-dev" ^{:doc "Run lein deps with repl profile"}
                  ["-U" "with-profile" "repl" "deps"]}
        :dependencies [[nrepl "1.0.0"]
                       [thheller/shadow-cljs "2.22.5"]]}
 :repl {:injections [(require '[shadow.cljs.devtools.server :as server])
                     (server/start! {:nrepl false})]
        :middleware [cider-nrepl.plugin/middleware
                     refactor-nrepl.plugin/middleware]
        :plugins [[cider/cider-nrepl "0.30.0"]
                  [mx.cider/enrich-classpath "1.9.0"]
                  [refactor-nrepl "3.6.0"]]}}

;;}
