
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

"syntax match ramlUserItem "\v^\s*\S+:"
"highlight link ramlUserItem Identifier

syntax match ramlResource "\v^\s*/\{=\S+\}="

highlight link ramlResource  Identifier



" header item highlighting
" ...
syntax keyword ramlHeadItem title baseUri version

highlight link ramlHeadItem PreProc



syntax keyword ramlType string boolean integer float 
syntax keyword ramlType number 

syntax match ramlType "\vcollection%[(-item)]" 

highlight link ramlType Type

syntax keyword ramlItem description responses body example
syntax keyword ramlItem queryParameters required type enum default
syntax keyword ramlItem formParameters pattern

highlight link ramlItem Type


" method highlighting
" ...

syntax keyword ramlMethodFuncType get post put delete patch

highlight link ramlMethodFuncType Statement


" constant things

syntax region ramlString start=/\v"/ skip=/\v\\./ end=/\v"/  

highlight link ramlString String

" syntax region ramlTextBlock start=/\v\|\s*$/ end=/\v\_$\ze\_^\s*%[(-\s+)]\S+:\s*$/
" syntax region ramlTextBlock start=/\v\|\s*\n/ skip=/\v[\<\>]{2}/ end=/\v\ze\n\_^\s*(-\s+)=\S+:\s*$/
syntax region ramlTextBlock start=/\v\|\s*\n/  end=/\v\ze\n\_^\s*(-\s+)=\S+:\s*$/

highlight link ramlTextBlock String



" example highlighting
" ...




let b:current_syntax = "raml"
