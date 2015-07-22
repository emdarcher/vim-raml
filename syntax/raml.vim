
" syntax highlighting stuff goes in here

if exists("b:current_syntax")
    finish
endif


" marks
syntax match ramlSpecial "\v-*"

" highlighting raml version header
syntax match ramlSpecial "\v%^#\%RAML\s+\S+$"

highlight link ramlSpecial Special 

" for user defined 'resources' (correct term?)
" that start with a '/' and may have curly braces '{' around name '}'
syntax match ramlResource "\v^\s*/\{=\S+\}="

highlight link ramlResource  Identifier

" for user defined 'items' (correct term?) that end in ':'
syntax match ramlUserItem "\v^\s*\S+:"

highlight link ramlUserItem Identifier

" header item highlighting
syntax keyword ramlHeadItem title baseUri version

highlight link ramlHeadItem PreProc



syntax keyword ramlType string boolean integer float 
syntax keyword ramlType number 

highlight link ramlType Type

syntax match ramlItem "\v^\s*(description|responses|body|example):"
syntax match ramlItem "\v^\s*(queryParameters|required|type|enum|default):"
syntax match ramlItem "\v^\s*(formParameters|pattern):"

highlight link ramlItem Type


" method highlighting

syntax match ramlMethodFuncType "\v(get|post|put|delete|patch)"

highlight link ramlMethodFuncType Statement

" constant things {{{

" handling strings (this region regex definition may be incomplete
" but works in almost all cases)
syntax region ramlString start=/\v"/ skip=/\v\\./ end=/\v"/  

highlight link ramlString String

" highlighting a text region that starts with a '|' character and newline:
" This regex pattern works in *most* cases, but doesn't work correctly
" sometimes, so that will have to be fixed somehow
syntax region ramlTextBlock start=/\v\|\s*\n/ end=/\v\ze\n\_^\s*(-\s+)=\S+:\s*$/

highlight link ramlTextBlock String

" an unfinished attempt to select a curly-brace region (json, etc.)
" syntax region ramlBracedRegion start=/\v\{/ skip=/\v((:\s*\{)|(:\_.))/ end=/\v\}/

" numbers and booleans
syntax match ramlNumber "\v\d+"
syntax match ramlBoolean "\v(true|false)"

highlight link ramlNumber Number
highlight link ramlBoolean Boolean


" }}}

let b:current_syntax = "raml"
