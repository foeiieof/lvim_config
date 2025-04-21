(directive) @constant
; (directive_start) @constant
; (directive_end) @constant
(parameter) @string
; (parameter
;     (text) @string)

(section
  (directive_start) @constant
  (parameter 
    (text) @string))

(comment) @comment
(php_statement) @php_statement
((php_only) @function)
((php_statement) @function
  (#match? @function "<[^>]+>"))
((text) @module
  (#match? @module "<[^>]+>"))
(php_statement
  (bracket_start) @string
  (bracket_end) @string)
