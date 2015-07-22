
" syntax highlighting stuff goes in here

if exists("b:current_syntax")
    finish
endif


" Specials {{{

" marks
syntax match ramlSpecial "\v-*"

" highlighting raml version header
syntax match ramlSpecial "\v%^#\%RAML\s+\S+$"

highlight link ramlSpecial Special 

" }}}

" resource highlighting
" ...


syntax match ramlResource "\v^\s*/\{=\S+\}="

highlight link ramlResource  Identifier

syntax match ramlUserItem "\v^\s*\S+:"
highlight link ramlUserItem Identifier
"
" header item highlighting
" ...
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
" ...

syntax match ramlMethodFuncType "\v(get|post|put|delete|patch)"

highlight link ramlMethodFuncType Statement




" constant things

syntax region ramlString start=/\v"/ skip=/\v\\./ end=/\v"/  

highlight link ramlString String

" syntax region ramlTextBlock start=/\v\|\s*$/ end=/\v\_$\ze\_^\s*%[(-\s+)]\S+:\s*$/
" syntax region ramlTextBlock start=/\v\|\s*\n/ skip=/\v[\<\>]{2}/ end=/\v\ze\n\_^\s*(-\s+)=\S+:\s*$/
syntax region ramlTextBlock start=/\v\|\s*\n/  end=/\v\ze\n\_^\s*(-\s+)=\S+:\s*$/

highlight link ramlTextBlock String

syntax match ramlNumber "\v\d+"
syntax match ramlBoolean "\v(true|false)"

highlight link ramlNumber Number
highlight link ramlBoolean Boolean

" example highlighting
" ...




let b:current_syntax = "raml"
