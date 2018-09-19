# Setup
Framer.Defaults.Animation =
	curve: Bezier.ease
	time: .2
Framer.Device.background.backgroundColor = "#000"
Framer.Defaults.Layer.backgroundColor = 'tomato'
Framer.Extras.Hints.disable()
sketch = Framer.Importer.load("imported/ex-menu-v05@2x", scale: 1)
Utils.globalLayers sketch
nothingHappens = () -> null

Utils.loadWebFontConfig
	custom:
		families: ['Sanomat-Regular', 'Sanomat-Medium']
		urls: ['framer/fonts.css']

# GrabTextLayer
class GrabTextLayer extends TextLayer
	constructor: (options = {}) ->
		super _.defaults options,
			text: 'Hello Grab'
			fontFamily: 'Sanomat-Regular'



menuSimple_content.states =
	added:
		scale: 0
		y: 120
		blur: 10
		
menuSimple_bg_prog = new Layer
	parent: menuSimple
	backgroundColor: 'white'
	size: menuSimple_bg.size
	x: menuSimple_bg.x, y: menuSimple_bg.y
menuSimple_bg_prog.sendToBack()

menuSimple_bg.destroy()

menuSimple_bg_prog.states =
	added: y: 180
menuSimple_btn_add.states =
	added: scale: 1.1
	hidden: opacity: 0

menuSimple_btn_view.states = hidden: opacity: 0
menuSimple_btn_view.stateSwitch 'hidden'

menuSimple_btn_add.onTap ->
	menuSimple_content.animate 'added'
	Utils.delay .075, ->
		menuSimple_bg_prog.animate 'added'
		menuSimple_btn_add.animate 'added'
	menuSimple_btn_add.onAnimationEnd ->
		menuSimple_btn_add.onTap ->
	menuSimple_content.animate 'added'
	Utils.delay .075, ->
		menuSimple_bg_prog.animate 'added'
		menuSimple_btn_add.animate 'added'
	menuSimple_btn_add.onAnimationEnd ->
		menuSimple_btn_view.animate 'default'
		menuSimple_btn_add.animate 'default'
		Utils.delay .2, ->
			menuSimple_btn_add.animate 'hidden'
			menuSimple_btn_add.destroy()
			
menuSimple_stepper_textNum_prog = new GrabTextLayer
	parent: menuSimple_stepper_textNum
	fontSize: 20
	fontFamily: 'Sanomat-Medium'
	textAlign: 'center'
	color: "#000000"
	text: 1
menuSimple_stepper_textNum_content.destroy()

menuSimple_btn_view_textItem_prog = new GrabTextLayer
	parent: menuSimple_btn_view_textItem
	color: 'white'
	fontSize: 17
	y: -2
	text: "1 Item"
menuSimple_btn_view_textItem_content.destroy()
	
menuSimple_btn_view_textPrice_prog = new GrabTextLayer
	parent: menuSimple_btn_view_textPrice
	color: 'white'
	fontSize: 17
	fontFamily: 'Sanomat-Medium'
	x: -24, y: -2
	textAlign: 'right'
	text: "Rp56.000"
menuSimple_btn_view_textPrice_content.destroy()
	
menuSimple_stepper_btn_inc.onTap ->
	count = parseInt(menuSimple_stepper_textNum_prog.text)
	menuSimple_stepper_textNum_prog.text = count + 1
	menuSimple_btn_view_textItem_prog.text = count + 1 + " Items"
	menuSimple_btn_view_textPrice_prog.text = "Rp" + (count + 1) * 56 + ".000"
	
menuSimple_stepper_btn_dec.onTap ->
	count = parseInt(menuSimple_stepper_textNum_prog.text)	
	if count > 1
		menuSimple_stepper_textNum_prog.text = count - 1
		menuSimple_btn_view_textItem_prog.text = count - 1 + " Items"