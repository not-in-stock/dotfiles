(require '[clojure.java.shell :refer [sh]]
         '[clojure.string :as str])

(defn force-changes []
  (sh "/System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings" "-u"))

(def modifier->code
  {:shift 131072
   :control 262144
   :option 524288
   :command 1048576})

(def ^:private
  no-ascii-code
  65535)

(def key->data
  {:b {:keycode 33}
   :space {:ascii 32
           :keycode 49}})

(def action->data
  {:previous-input-method {:id 60
                           :descr "Select the previous input source"}
   :next-input-method {:id 61
                       :descr "Select the next source in the Input Menu"}
   :show-spotlight-search {:id 64
                           :descr "Show Spotlight search field"}
   :show-finder-search {:id 65
                        :descr "Show Finder search window"} })

(def domain->path
  {:global-shortcuts ["com.apple.symbolichotkeys.plist"
                      "AppleSymbolicHotKeys"]})

(def prpoperty-template
  "<dict>
    <key>enabled</key><true/>
    <key>value</key><dict>
      <key>type</key><string>standard</string>
      <key>parameters</key>
      <array>
        <integer>%d</integer>
        <integer>%d</integer>
        <integer>%d</integer>
      </array>
    </dict>
  </dict>")

(def disable-property
  "<dict><key>enabled</key><false/></dict>")

(defn- pseudoname->mod [pseudoname]
  (case pseudoname
    ("cmd" "command" "gui" "super") :command
    ("ctrl" "control") :control
    ("opt" "option" "alt" "meta") :option
    "shift" :shift
    ("space" "spc") :space
    (keyword pseudoname)))

(defn- parse-shortcut [shortcut]
  (let [key-tokens (-> shortcut
                       str/lower-case
                       (str/split #"-"))]
    (->> key-tokens
         (map pseudoname->mod)
         (group-by #(if (contains? modifier->code %)
                      :mods
                      :keys)))))

(defn- format-shortcut-setting [key mods]
  (let [key-data (key->data key)
        {:keys [ascii keycode]
         :or {ascii no-ascii-code}} key-data
        mods-sum (apply + (vals (select-keys modifier->code mods)))]
    (assert (some? keycode) (format "Keycode is not found for key: %s" (str key)))
    (format prpoperty-template
            ascii
            keycode
            mods-sum)))

(defn surround [s1 s2]
  (str s1 s2 s1))

(defn set-shortcut [domain action shortcut]
  (let [{:keys [mods keys]} (parse-shortcut shortcut)
        [key] keys
        shortcut-setting (format-shortcut-setting key mods)
        action-data (action->data action)
        {:keys [id descr]} action-data
        action-id (str id)
        domain-path (domain->path domain)]
    (assert (some? domain-path) (format "Domain %s not found" (str domain)))
    (assert (some? id) (format "Action %s not found" (str action)))
    (assert (pos? (count keys)) "At least one non modifier key should be used in a shortcut.")
    (assert (not (< 1 (count keys))) "Only one non modifier key could be used in a shortcut.")
    (println "\nSetting shortcut" (surround "'" shortcut)
             "\nfor action" (surround "'" descr)
             "\nin" (surround "'" domain-path) "domain")
    (apply sh
           (concat ["defaults" "write"]
                   domain-path
                   ["-dict-add"
                    action-id
                    shortcut-setting]))))

(defn disable-shortcut [domain action]
  (let [shortcut-setting disable-property
        action-data (action->data action)
        {:keys [id descr]} action-data
        action-id (str id)
        domain-path (domain->path domain)]
    (assert (some? domain-path) (format "Domain %s not found" (str domain)))
    (assert (some? id) (format "Action %s not found" (str action)))
    (println "\nDisabling shortcut for action" (surround "'" descr)
             "\nin" (surround "'" domain-path) "domain")
    (apply sh (concat ["defaults" "write"]
             domain-path
             ["-dict-add"
              action-id
              shortcut-setting]))))

 (set-shortcut :global-shortcuts :next-input-method "cmd-space")
 (set-shortcut :global-shortcuts :previous-input-method "cmd-opt-space")
 (set-shortcut :global-shortcuts :show-spotlight-search  "ctrl-space")
 (disable-shortcut :global-shortcuts :show-finder-search)

(force-changes)
