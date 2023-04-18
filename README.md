# Zest-Framework
Zest which was named by ChatGPT is a light version of the OryUI framework that only manages image buttons, sprites, text, and basic touch tracking.

Unlike OryUI, Zest aimed more at game development.

Zest is to be used with AGK (AppGameKit) Tier 1

A copy of AGK2 is required to use Zest. For more information on AGK2 check out: https://www.appgamekit.com

## Installation
To include it in your project add the following line to the top of your script

```
#insert "..\Zest-Framework\Zest.agc"
#insert "..\Zest-Framework\ZestImageButton.agc"
#insert "..\Zest-Framework\ZestSprite.agc"
#insert "..\Zest-Framework\ZestText.agc"
#insert "..\Zest-Framework\ZestTouch.agc"

do
	// Your game code here...
	
	ZestSync()
loop
```

## Documentation
Documentation can be found here in the Wiki section: https://github.com/KevinCrossDCL/Zest-Framework/wiki

## License
The Zest Framework is open-source software licensed under the [MIT license](https://opensource.org/licenses/MIT).