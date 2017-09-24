# Contribution Guidelines

Please ensure your pull request adheres to the following guidelines:

- Search previous extensions before making a new one, as yours may be a duplicate with a different name.
- Make an individual pull request for each file changed. PULL REQUESTS WITH LOTS OF UNRELATED BUNCH OF FILES WILL BE REJECTED INSTANTLY. 
- Update the readme.md with your addition with clear and fun examples. 
- Add a short documentation before your function describing what your code does:

```swift
    /// EZSE: Prints "Awesome!"
    func myAwesomeFunction() {
        print("Awesome!")
    }
```

- Check your spelling and grammar.
- Look at how other parts of the code are written, mimic what you see in terms of style and conventions. 

```swift
  //All other code:
  /// EZSE: This function does cool stuff
  func myCoolFunction() -> Bool {
      let isItCool: Bool = doCoolStuff()
      return isItCool
  }
  
  //Don't write something like this:
  /// ThiS funcTion doEs cool sTuff
  func MY_COOL_FUNC()->Bool {
      var Very_Cool_Var:Bool = doCoolStuff()
      return Very_Cool_Var
  }
  //The problems with the above examples are, function name has capital letters & underscores and there no spaces between "()->{", 
  //var instead of let, variable name retarded, :Bool no space, etc.. Don't be that guy!
  //Check this out: https://github.com/raywenderlich/swift-style-guide
```

- Make sure your text editor is set to remove trailing whitespace.
- Make sure swiftlint warnings do not increase.
- Add a unit test for your function.
- When adding new files make sure to include it in the /Sources folder and make sure its referenced in both EZSwiftExtensionsExamples and EZSwiftExtensions projects.
- If you are not sure ask in our chat room https://gitter.im/EZSwiftExtensions/Lobby
- Also check this: https://github.com/goktugyil/EZSwiftExtensions/issues/183

PR ettiquette

- When you submit a PR, ensure that you rebase and replay mainline on top of your branch and submit only the commits that represent you change. 
- Do not submit multiple commits that represent one particular feature. Squash your contributions into one commit before submitting. 
- If you are submitting a feature request, a new test or refactoring existing extensions, ensure only one extension class is changed.  
- After submitting a PR for a new extension, update the CHANGELOG.md Unreleased section to include your extension. 
- No merge commits please.

Your contributions are always welcome!  Thank you for your contributions!
