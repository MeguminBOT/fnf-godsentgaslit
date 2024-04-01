package states.stages;

import states.stages.objects.*;
import flixel.FlxSprite;
import flixel.math.FlxMath;
import flixel.math.FlxPoint;

class CatnapStage extends BaseStage
{
	static var isCritterActive:Bool = false;
	static var isCritterEntering:Bool = false;
	var camMech:FlxCamera;
	var critterMech1:FlxSprite;
	var critterMech2:FlxSprite;
	var critterMech3:FlxSprite;

	override function create()
	{
		FlxG.mouse.visible = true;

		camMech = new FlxCamera();
		camMech.bgColor.alpha = 0;
		FlxG.cameras.add(camMech, false);
	
		createCritters();

	}

	function createCritters()
	{
		critterMech1 = new FlxSprite();
		critterMech1.loadGraphic(Paths.image('mechanics/critter1'));
		critterMech1.frames = Paths.getSparrowAtlas('mechanics/critter1');
		critterMech1.antialiasing = ClientPrefs.data.antialiasing;
		critterMech1.x = 0;
		critterMech1.y = 210;
		critterMech1.cameras = [camMech];
		critterMech1.animation.addByPrefix('idle', 'idle', 24, true);
		critterMech1.animation.addByPrefix('enter', 'enter', 24, false);
		critterMech1.animation.addByPrefix('gone', 'gone', 24, false);
		add(critterMech1);

		critterMech2 = new FlxSprite();
		critterMech2.loadGraphic(Paths.image('mechanics/critter2'));
		critterMech2.frames = Paths.getSparrowAtlas('mechanics/critter2');
		critterMech2.antialiasing = ClientPrefs.data.antialiasing;
		critterMech2.x = 0; 
		critterMech2.y = 210;
		critterMech2.cameras = [camMech];
		critterMech2.animation.addByPrefix('idle', 'idle', 24, true);
		critterMech2.animation.addByPrefix('enter', 'enter', 24, false);
		critterMech2.animation.addByPrefix('gone', 'gone', 24, false);
		add(critterMech2);

		critterMech3 = new FlxSprite();
		critterMech3.loadGraphic(Paths.image('mechanics/critter3'));
		critterMech3.frames = Paths.getSparrowAtlas('mechanics/critter3');
		critterMech3.antialiasing = ClientPrefs.data.antialiasing;
		critterMech3.x = 0; 
		critterMech3.y = 210;
		critterMech3.cameras = [camMech];
		critterMech3.animation.addByPrefix('idle', 'idle', 24, true);
		critterMech3.animation.addByPrefix('enter', 'enter', 24, false);
		critterMech3.animation.addByPrefix('gone', 'gone', 24, false);
		add(critterMech3);

		critterMech1.visible = false;
		critterMech2.visible = false;
		critterMech3.visible = false;
	}

	override function update(elapsed:Float)
	{
		handleCritterOne();
		handleCritterTwo();
		handleCritterThree();
	}

	override function eventCalled(eventName:String, value1:String, value2:String, flValue1:Null<Float>, flValue2:Null<Float>, strumTime:Float) {
		switch(eventName) {
			case "Critters":
				if (isCritterActive) {
					return;
				} else {
					isCritterActive = true;
					switch(value1) {
						case '1':
							critterMech1.x = game.playerStrums.members[0].x +- 240;
							critterMech1.visible = true;
							critterMech1.animation.play('enter', true);
						case '2':
							critterMech2.x = game.playerStrums.members[0].x +- 240;
							critterMech2.visible = true;
							critterMech2.animation.play('enter', true);
						case '3':	
							critterMech3.x = game.playerStrums.members[0].x +- 240;
							critterMech3.visible = true;
							critterMech3.animation.play('enter', true);
						default:
							isCritterActive = false;
					}
				}
		}
	}
	
	override function eventPushed(event:objects.Note.EventNote)
	{
		switch(event.event)
		{
			case "Critters":
				Paths.cacheBitmap('mechanics/critter1');
				Paths.cacheBitmap('mechanics/critter2');
				Paths.cacheBitmap('mechanics/critter3');
		}
	}

	function handleCritterOne() {
		if (!isCritterActive) {
			return;
		}

		if (critterMech1.visible == true) {
			var mousePosCritter:FlxPoint = FlxG.mouse.getScreenPosition(camMech);
		
			if (critterMech1.overlapsPoint(mousePosCritter) && FlxG.mouse.justPressed) {
				if (critterMech1.animation.curAnim.name == 'idle') {
					critterMech1.animation.finish();
				}
			}
		
			critterMech1.animation.finishCallback = function(name:String) {
				switch (name) {
					case 'enter':
						critterMech1.animation.play('idle');
					case 'idle':
						critterMech1.animation.play('gone');
					case 'gone':
						critterMech1.visible = false;
						isCritterActive = false;
				}
			};
		}
	}

	function handleCritterTwo() {
		if (!isCritterActive) {
			return;
		}
		
		if (critterMech2.visible == true) {
			var mousePosCritter:FlxPoint = FlxG.mouse.getScreenPosition(camMech);

			if (critterMech2.overlapsPoint(mousePosCritter) && FlxG.mouse.justPressed) {
				if (critterMech2.animation.curAnim.name == 'idle') {
					critterMech2.animation.finish();
				}
			}

			critterMech2.animation.finishCallback = function(name:String) {
				switch (name) {
					case 'enter':
						critterMech2.animation.play('idle');
					case 'idle':
						critterMech2.animation.play('gone');
					case 'gone':
						critterMech2.visible = false;
						isCritterActive = false;
				}
			};
		}
	}

	function handleCritterThree() {
		if (!isCritterActive) {
			return;
		}

		if (critterMech3.visible == true) {
			var mousePosCritter:FlxPoint = FlxG.mouse.getScreenPosition(camMech);

			if (critterMech3.overlapsPoint(mousePosCritter) && FlxG.mouse.justPressed) {
				if (critterMech3.animation.curAnim.name == 'idle') {
					critterMech3.animation.finish();
				}
			}
		
			critterMech3.animation.finishCallback = function(name:String) {
				switch (name) {
					case 'enter':
						critterMech3.animation.play('idle');
					case 'idle':
						critterMech3.animation.play('gone');
					case 'gone':
						critterMech3.visible = false;
						isCritterActive = false;
				}
			};
		}
	}
}