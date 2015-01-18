jQuery Glow Me Hinter 1.0
Author: Alan Fall & Digital Grief
jQuery glowMe Hinter 1.0 is released under the MIT & GPL licenses

===========
DESCRIPTION
===========

Glow Me Hinter is a very SIMPLE and EASY to use jquery plugin 
that can be used to add informative hints on your input textboxes.
It can also simulate the twitter login textboxes by adding a 
border glow and animate the background color on hover.

Important!

To make sure that the background color animation work you need to
include the jquery color animation plugin (www.bitstorm.org/jquery/color-animation/)
in your html <head> otherwise you'll have no color animation when you hover on a textbox.
jQuery color animation plugin comes with the zipped file of Glow Me Hinter!

Glow Me Hinter works great as and without the color animation plugin! 
(Without the animated background color functionality)

Optional:

You can use the jQuery easing plugin (http://gsgd.co.uk/sandbox/jquery/easing/) to have access 
on more easing types.

==============
COMPATABILITY:
==============

This plug-in is tested and WORKS GREAT in:

Firefox: 4.0, 5.0
Chrome: 12.0.742.112
Safari: 5.0.5 (7533.21.1)

Although it works great on the browsers above, IE8 and Opera(11.50) seem to have some incompatibilities.
IE8 doesn't render the glow around the borders (CSS3: box shadow) and opera doesn't animate the background 
color due to incompatability with the color animation plugin. Although it WORKS GREAT as a textbox hinter!

Now that we've got all these clear let's proceed with the installation..

=============
INSTALLATION:
=============

STEP 1

Link the script with your html document 
(if you want the background to animate include the color animation plugin)

<script type="text/javascript" src="js/jquery-glowme-hinter-1.0.js"></script>

STEP 2

Target your input textbox or textarea or any proper element.

$('input:text').glowMe();

And voila!

But what if you want to change the hint color or the glow color?

Glow Me Hinter is extremely customizable and let's you change some of the default parameters!


Default Parameters:


hintColor : #5F5F5F - The default hint color

Advice: Hint color should be a lighter color than the
active(focused) hoverFontColor.


borderColor : #ccc - The border color, both hex and string values are accepted

bgColor : #eee - On hover background color change

bgHoverSpeed : 650 - Mouseover transition speed

bgHoverOutSpeed : 300 - Mouseleave transition speed

bgHoverEase : swing - Mouseover easing type

bgHoverOutEase : linear - Mouseleave easing type

hoverFontColor : #000 - Color of the font when the input box is active/focused

glowThickness : 10px - Thickness of the glow effect (CSS3: box-shadow)
 
glowColor: #D4D4D4 - Color of the glow effect (CSS3: box-shadow)


Passing the parameters:
-----------------------

All parameters are optional!

$('input:text').glowMe({

 'hintColor' : '#5F5F5F',
 'borderColor': '#ccc', 
 'bgColor' : '#eee',
 'bgHoverSpeed' : 650,
 'bgHoverOutSpeed' : 300,
 'bgHoverEase' : "swing",
 'bgHoverOutEase' : "linear",
 'hoverFontColor' : "#000",
 'glowThickness' : "10px",
 'glowColor': "#D4D4D4"

});

