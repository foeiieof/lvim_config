; ((text) @injection.content
;   (#set! injection.language php)
;   (#set! injection.combined))

; ((php_statement) @injection.content
;   (#set! injection.language php)
;   (#set! injection.combined))
; ((php_statement) @injections.content
;   (#set! injections.language "php")
;   (#set! injections.combined))
; ((php_statement) @injections.content
                   ; (#set! injections.language "php")
                   ;   (#set! injections.combined))

;; Query for Blade to treat text as HTML
; ((text) @injection.content
;    (#match? @injection.content "<.*>")   ;; Match HTML tags
;    (#set! injection.language "html"))

; ;; Query for PHP to treat HTML tags inside PHP statements as HTML
; ((php_statement) @injection.content
;    (#match? @injection.content "<.*>")   ;; Match HTML tags
;    (#set! injection.language "html"))
