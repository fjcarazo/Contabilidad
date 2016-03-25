
          TLCDLabel v1.5 - The Electronic looking label for Delphi!
	--------------------------------------------------------------

                    Copyright 1998, Amitron Electronics
                               Peter Czidlina


LCDLabel update for Delphi 3 and 4 - and a bug fix...!

More improvements, but not enough to be 2.0...
The label You will find here is a result of my interest in electronics
and especially the ways to display information on electronic devices.
I think also this label is the first of it's kind - after surfing around
on the Web, I could not find any that works in this way. I have seen similar
ones but they always lacks something.
So, I decided to make one.

What is now so remarkable with this label?
It does not support anyting You normally find in all custom labels - 
3D effects, rotation or shaded colors. It doesn't even supports the system
fonts...
What does it do?
It simulates the well known Alphanumeric dot-matrix LCD displays, commonly
used on lot's of electronic equipments.


What is new comparing to version 1.3?
-------------------------------------

  By demand, a pixel size of 1x1 was requested - this led to a rewrite of the
  display pixel size code so it supports any size possible.
  The number of fixed sizes have been increased: 1x1 - 16x16.
  That wasn't enough - now there is a custom mode where ANY size can be entered -
  the heigth and width could be different for non-square pixels.

  The version is moved to 1.5 due to a large rewrite to fix some bugs in the
  code. It seems to they have been there from the beginning, but with the changes
  in 1.4 they made them to show up more directly.
  Version 1.4 is now obselete and have been totally removed - 1.5 replaces it now!
 

How to install it?
------------------

Following installs are avaiable:

  This install is for Delphi 4 if You use the DCU's. The source code is also
  included so it can be used for any Delphi except for 1.X. 
  OBJ-files are also in the archive (created with Delphi 4).

  In \Source are the source code for the component.

First of all find or create a directory for this component and copy following
files to that place:

		LCD_LAB.DCU			(LCD Engine)
		LCD_LAB.DCR			(Palette icon)
		LCD_PED.DCU         (File Name property editor)
		MATRIX.DCU			(Character definitions)

With Delphi 4, use menu "Component->Install Component". As Unit file name,
select LCD_LAB.DCU and leave rest as default. Press OK to finish the
installation.
A new palette tab will be created for the component.

There are no DCU's for Delphi 3 - just use the source instead.
OBJ-files generated for C++ by Delphi 4 are included.


FontEd
------

If You have downloaded the big version (FontEd included), copy the FontEd.exe
(found in \FontEd directory) to anywhere You like it. No additional DLL's or other
files are required (Win95 or NT4.0 are required of course :-)...
When a help file are released, it must be placed in same place as the exe-file.

NOTE: Download FontEd separately or the 1.3 version of the label to get it - it
is not included in this upgrade release.


How to use it.
--------------

The use of this label is simple - it works in the way all Delphi components
works. Every change done are shown at design time.
A lot of new properties are avaiable to control the appearance of the label.

Following properties are avaiable (* marks the new ones):

	* BackGround	- Label background color.
	* BorderColor	- Border color.
	* BorderSpace	- Distance in pixels from border to characters.
	* BorderStyle	- Border style - frNone, frLowered, frRaised or frSingle.
	  (changed from 1.2a)
	                  Note: This style are not compatible with the standard
					  label styles AND LCDLabel 1.0/1.1 styles!

	  Caption       - The text shown in the display label. If more than one
			          line is used, the entire label works as a single but
			          broken line.
	* CharSpacing	- Space between characters in the label.
	  Cursor
	* DotMatrix	- Type of "font" used in the display label.
			  This label uses a built in character translation
			  table instead of the system fonts. The reason for it
			  is that I wanted the display look like the real ones.
			  That also means that special characters does not work
			  with this label (like special national characters).

			  Following character matrixes are avaiable:

			    + mat5x7 - 5 x 7 dots characters - this is the
			      "standard" font, both in this label and on the
			      real displays. This one supports ASCII 32-126.

			    + mat5x8 - Same as above but by using a 5 x 8 dot
			      matrix, it makes some characters looking better.

			    + mat7x9 - Larger matrix, 7 x 9, allows nicer
			      character display. ASCII 32-126.

			    + mat9x12- Even more improved character look, but it
			      takes more space on screen. ASCII 32-126.

			    + Hitachi- An exact copy of the font setup used by
			      all 5 x 7 dot matrix LCD's based on the Hitachi
			      HD61830 controller (all 5 x 10 characters are
			      converted to 5 x 7). It includes all strange
			      japanese characters! It allows ASCII 32-223. 

				+ Hitachi2- Same as Hitachi but with extended character
				  height. This makes the special characters looking
				  better.

				+ dos5x7  - A character set with DOS-characters (at least
				  something similar - 5x7 pixels aren't big enough to make
				  the characters looking good.

				+ CustomFont - External font file are used (created with
				  FontEd).

	* filename  - Font file name. Write name directly or use file requester
	              to search for it.
				  This can only be used together with CustomFont, if any other
				  font type are used, this field must be empty.

	  Enabled
	  Height	- Label height
	  Left
	* LineSpacing - Distance between character lines in multi-line
			      labels.
	  Name		- Name of the label.
	* NoOfChars	- Number of characters on a single line.
			      If multiple lines are used, all lines will have the
			      same amount of characters.
	* PixelOff	- Color of pixels in off state. These normally appears
			      invisible or in a dimmed color.
	* PixelOn	- Pixel on color. This is the character color as the
			      text will appear in.
    * PixelShape- LCD Pixel shape. Controls the drawing of the LCD pixels.
	  (changed    Three different shapes are avaiable. To see any effect,
	   from 1.2)  set PixelSize > 3x3. Suitable colors are also needed to
				  see the effect. Following options are avaiable:

                   + spSquare	- Simple square pixels (default).

                   + spShaped - Square pixels with "shaded" corners.

                   + spRound  - circular pixels.

                  Note: Shaped and Round pixels are slower than the Square
				  due to circle drawing!

	* PixelSize	- Size of each character pixel.
	              Fixed sizes from pix1x1 to pix16x16 plus pixCustom - free
				  size entry.
	* PixelSpacing - Space between each character pixel.
	* PixelWidth   - Size parameters for the LCD pixels when PixelSize = pixCustom. 
	* PixelHeight  	 There are no maximum for the sizes except of the limit of
	                 integer variable and the speed of the machine...
	  Tag
	* TextLines	- Number of text lines in the label.
	  Top
	  Visible
	  Width		- Label width

About resizing - This label allows free resizing, but to avoid truncated
characters, the selected size are rounded up to nearest full character.
The same will appear when entering values for Width and Height.
By using the size and distance properties of the label will calculate the
correct Width and Height.

The properties that are missing explanations works as described in the Delphi
help file.


History
-------

 v1.5   - Variables Width and Heigth wasn't updated correctly - this fault
          was a result of using Invalidate in all property changing functions.
		  The values was recalculated in Paint and an Invalidate doesn't always
		  force a direct paint - this is changed. A nice side effect of this
		  is that color changes of the display can be done without flicker...
		  The dissapearing 1x1 character bug was also removed - silly one but
		  very tricky to find. Everything works fine except from 1x1 pixel size,
		  border spacing=0, pixel spacing=1, and a 5x7 font make the display go
		  blank when only one character was shown. The bitmap was too small in
		  this case...
 
 v1.4   - Redesigned the display pixel size functions - now any size
          can be used, not just the predefined ones.

 v1.3   - Added custom fonts + editor to make fonts with (FontEd).
          An other naming bug fixed.
		  Code tuned and border drawing improved.

 v1.2a  - Corrected a bug - the function 'round' did not work due to the
          shape was called 'round' - changed to spRound.

 v1.2   - Updated 32bit version. Delphi 1 are not supported anymore but
          Delphi 3 are.
		  New display options: beveled borders and different pixel shapes.
		  This version isn't avaiable anymore.

 v1.1   - The first 32bit version!
          Appearance updated to prevent flicker during caption change.

 v1.0	- The first and only version of this label yet.

 To make this list long, I need someone to use it and tell me about
 improvements and features missing (or bugs to be corrected).


What to improve?
----------------

	- Help file!
	  If someone knows how to do this, I will make one.

	- More border options (Bevels, shaded, any other ideas?).
	  <- Beveled borders added - border width still to come...

	- Round character pixels - make them look like LED matrixes.
	  <- Shaped pixels are a way to this but it is slow (shame on Windows...).

	- Make a multiple line label work like real multiple line text field.

	- Get the thing to scroll... 

	- Whatever You will find out...


Freeware!
---------

This component is Freeware!
It can be used freely in any application for private use, just put a credit for
me in Your About box...
If You like it, send me a e-mail or a post card. Or if You want some
improvements or have some good ideas, just do the same writing down Your ideas.
If You don't like it or maybe find some bugs, contact me too and tell me what
You have found.
If the component is going to be used in a commersial application, contact me
and we'll make up the deal. More info is also avaiable at my home page.



How to contact me?
------------------

snail-mail:

	Peter Czidlina

	Kanalvaegen 6
	136 73  Haninge
	Sweden

e-mail:	petercz@swipnet.se
WWW   : http://hem2.passagen.se/ebcpecz/
