(defproject brainfrack "0.1.0-SNAPSHOT"
  :description "A brainfrack interpreter"
  :url "https://github.com/Wilfred/Brainfrack"
  :license {:name "Gnu Public License"
            :url "http://www.gnu.org/licenses/gpl-2.0.html"}
  :dependencies [[org.clojure/clojure "1.7.0"]]
  :plugins [[lein-kibit "0.1.2"]
            [cider/cider-nrepl "0.10.1"]]
  :main brainfrack.core)
