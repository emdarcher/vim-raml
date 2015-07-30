" VIM syntax file
" Language: RAML
" Maintainer: Ethan Durrant

" syntax highlighting stuff goes in here

if exists("b:current_syntax")
    finish
endif


" highlight comments
syntax match ramlComment "\v#.*$"
highlight link ramlComment Comment

" '-' marks
syntax match ramlSpecial "\v-*"

" highlighting raml version header, only at top of file
syntax match ramlSpecial "\v%^#\%RAML\s+\S+$"

highlight link ramlSpecial Special 

" highlight comments
syntax match ramlComment "\v#.*$"
highlight link ramlComment Comment

" for user defined 'items' (correct term?) that end in ':'
"syntax match ramlUserItem "\v^\s*%[(-\s+)]\S+:"
syntax match ramlUserItem "\v^\s*(-\s+)=\S+:"

highlight link ramlUserItem Identifier

" for user defined 'resources' (correct term?)
" that start with a '/' and may have curly braces '{' around name '}'
"syntax match ramlResource "\v^\s*/\{=\S+\}=%[(/\S+)]:"
syntax match ramlResource "\v^\s*/\{=\S+\}=(/\S+)=:"

highlight link ramlResource Tag

" header item highlighting
syntax match ramlHeadItem "\v^\s*(title|baseUri|version|resourceTypes):"
syntax match ramlHeadItem "\v^\s*(securitySchemes|traits|schemas|mediaType):" 

highlight link ramlHeadItem PreProc

syntax match ramlInclude "\v!include"

highlight link ramlInclude Include

" types
syntax keyword ramlType string boolean integer float 
syntax keyword ramlType number file 

highlight link ramlType Type

" different 'items'
syntax match ramlItem "\v^\s*(description|responses|body|example|is):"
syntax match ramlItem "\v^\s*(queryParameters|required|type|enum|default):"
syntax match ramlItem "\v^\s*(formParameters|pattern|schema|settings|headers):"

highlight link ramlItem Type

" mediatypes 'application/json' 'binary/octet-stream' etc.
" something with test split by a single forward slash '/' ending with ':'
syntax match ramlMediaType "\v^\s*\S+/\S+:"

highlight link ramlMediaType Type

" for HTTP code responses (3 digits and ':')
syntax match ramlMethodFuncType "\v^\s*\d{3}:"

" method highlighting
syntax match ramlMethodFuncType "\v^\s*(get|post|put|delete|patch)\??:"

highlight link ramlMethodFuncType Statement

" constant things {{{

" highlighting a text region that starts with a '|' character and newline:
" BUG: This regex pattern works in *most* cases, but sometimes it highlights 
" a few lines that follow the text region which shouldn't be highlighted.
syntax region ramlTextBlock start=/\v\|\s*\n/ end=/\v\ze\n(\s*\n)*\_^\s*(-\s+)=\S+:\s*\|=$/
highlight link ramlTextBlock String

" handling strings (this region regex definition may be incomplete
" but works in almost all cases)
syntax region ramlString start=/\v"/ skip=/\v\\./ end=/\v"/  

highlight link ramlString String

" numbers and booleans
syntax match ramlNumber "\v\d+"
syntax match ramlBoolean "\v(true|false)"

highlight link ramlNumber Number
highlight link ramlBoolean Boolean

" filenames
syntax match ramlFilename "\v\S+\.\S+"

highlight link ramlFilename Constant 

" urls highlighting underlined
syntax match ramlUrl "\v\a+://\S+"

highlight link ramlUrl Underlined 


" version numbers 'v2' 'v0.1.1' 'a1.5.6' 'b3.4.5' etc.
"syntax match ramlHeadItem "\v(v|b|a|s)\d+%[(\.\w+)]+"
syntax match ramlHeadItem "\v(v|b|a|s)\d+(\.\w+)*"

" }}}

let b:current_syntax = "raml"
