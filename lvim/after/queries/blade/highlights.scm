
(directive) @constant
(directive_start) @constant
(directive_end) @constant

(parameter) @string


(bracket_start) @bracket_start
(bracket_end) @bracket_start


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
; (((text)) @string)
