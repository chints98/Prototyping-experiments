# Import file "Apple Music"
$ = Framer.Importer.load("imported/Apple Music@2x", scale: 1)


#make scrollable via scroll component's wrap feature
scroll_library = ScrollComponent.wrap $.Library_content
scroll_library.scrollHorizontal = false

#create space at the end of the page


scroll_library.contentInset = 
	bottom: $.Tabs.height + 80

#making only the first tab active using a for each loop (we know this :) )

for tab in $.Tabs.children
	tab.saturate = 0
	tab.opacity = 0.6

$.Tab_Library.saturate = 100
$.Tab_Library.opacity = 1

$.For_you.x = 0 #Brings screen over to our canvas 

scroll_for_you = ScrollComponent.wrap $.For_you

#use props here instead of writing code for each single property, making it scrollable

scroll_for_you.props = 
	scrollHorizontal: false
	contentInset: 
		bottom: $.Tabs.height + 20
	directionLock: true #lock direction

#make tab bars appear everywhere by orphaning them

$.Status_Bar.bringToFront()
$.Tabs.bringToFront()

#make recently played section horizontally scrollable
recentlyPlayed = ScrollComponent.wrap $.Recently_Played_albums
recentlyPlayed.props = 
	scrollVertical: false
	contentInset:
		right: 20 #align with see all
	directionLock: false #lock direction


#Component for New Music and Favorites (top of For you)

mixes = new PageComponent
		frame: $.New_Music_mix.frame #reusing this card's frame
		parent: $.For_you
		scrollVertical: false
		directionLock: true
#add page functionality

#needs affordance however! 

#the wrapper is a layer that serves as a mask, with each card placed inside.
wrapper1 = new Layer 
	width: $.New_Music_mix.width - 15 
	height: $.New_Music_mix.height 
	backgroundColor: null
	clip: true

$.New_Music_mix.parent = wrapper1 #make wrapper1 the parent of New_Music_mix
$.New_Music_mix.y = 0 

mixes.addPage wrapper1

#2nd wrapper for favorites_mix, aliging everything together. 
wrapper2 = new Layer 
	width: $.Favourites_mix.width - 15 
	height: $.Favourites_mix.height 
	backgroundColor: null
	clip: true

$.Favourites_mix.parent = wrapper2
$.Favourites_mix.y = 0 #resets the y position
$.Favourites_mix.x = -15  #shift to the left to give affordance

mixes.addPage wrapper2

#Do the date stuff later :) 

#Switching between tabs 

#Event for tapping library
$.Tab_Library.onTap -> 
	scroll_library.visible = true
	scroll_for_you.visible = false
	for tab in $.Tabs.children
		tab.saturate = 0
		tab.opacity = 0.6
	@saturate = 100
	@opacity = 1

#event for tapping for-you
$.Tab_For_You.onTap -> 
	scroll_library.visible = false
	scroll_for_you.visible = true
	for tab in $.Tabs.children
		tab.saturate = 0
		tab.opacity = 0.6
	@saturate = 100
	@opacity = 1

scroll_for_you.visible = false #to make it invisible at the beginning of a prototype.

#Tab bar fix for now playing
$.Tabs.y = Screen.height

#Now playing screen

scroll_now_playing = new ScrollComponent
	width: Screen.width
	height: Screen.height - 28
	y: 28
	scrollHorizontal: false
	directionLock: true
	contentInset: 
		bottom: -150 #ensures overdrag
	borderRadius: 
		topLeft: 8
		topRight: 8

#Give the background a card-like look
scroll_library.props = 
	borderRadius: 8
	y: 20
	scaleX: 0.96

$.Now_Playing.x = 0 
$.Now_Playing.parent = scroll_now_playing.content #need to do this when not using wrap()

#Transparent gray overlay behind playingnow

overlay = new Layer
	frame: Screen.frame
	backgroundColor: "rgba(0,0,0,0.3)"

overlay.placeBehind scroll_now_playing

Screen.backgroundColor = "#9D9D9D"
$.Status_Bar.invert = 100

#No need to do voice UI for now 

$.Button_Play.visible = true
$.Button_Pause.visible = false

$.Status_Bar.parent = null
$.Tabs.parent = null 




