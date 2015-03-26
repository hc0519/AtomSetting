clangSourceScopeDictionary = {
  'source.c++'    : 'c++' ,
  'source.c'      : 'c' ,
  'source.objc'   : 'objective-c' ,
  'source.objc++' : 'objective-c++' ,
}

module.exports =
  getFirstCursorSourceScopeLang: (editor, scopeDictionary=clangSourceScopeDictionary) ->
    scopes = @getFirstCursorScopes editor
    return @getSourceScopeLang scopes

  getFirstCursorScopes: (editor) ->
    firstCursorPosition = editor.getCursors()[0].getBufferPosition()
    scopes = editor.scopesForBufferPosition firstCursorPosition

  getSourceScopeLang: (scopes, scopeDictionary=clangSourceScopeDictionary) ->
    lang = null
    for scope in scopes
      if scope of scopeDictionary
        return scopeDictionary[scope]
