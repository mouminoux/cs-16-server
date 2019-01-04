/***************************************************************************************
 * roll_the_dice.sma			Version: 2.5 RC 4		Date: 05/01/2006
 *
 *   Idea by Ludwig van
 *   Developed by Striker
 *   
 *   Offical Thread: http://www.amxmodx.org/forums/viewtopic.php?t=18554
 *
 *  ------------------------------------------------------------------------------------
 *
 *  This is another roll the dice plugin with some different and more advanced options. 
 *  There are gambling limits, admin controls, lots of FX and new features.
 *
 *  Prizes include:
 *
 *    - The Wild Ride
 *    - A Lightsabre
 *    - Smoking Drunkard
 *    - Slap Disease (possible death)
 *    - Zeusmode (Godmode,Maxspeed,Noclip combined, antistuck-teleport if you get stuck you will be teleported)
 *    - Old Man (makes you slow)
 *    - Race Car in The Red (makes you fast, very fast, beep beep!!)
 *    - Invisible Man (invisble, maxspeed)
 *    - Invisible God (invisble, maxspeed, and godmode)
 *    - 100 Chickens (if u have Chicken model, but headcrabs if u haven't it)
 *    - Win Health
 *    - Timebomb
 *    - Noclip (antistuck-kill: if you get stuck you will die)
 *    - Godmode
 *    - NightClub
 *    - Burning
 *    - Win XP (war3ft mod or superhero mod)
 *    - Lose XP (war3ft mod or superhero mod)
 *    - Win Money (random)
 *    - Lose Money ($0)
 *    - Headcrab Monsters
 *    - Full Equipment
 *    - Hit by Lightning
 *    - Unlimited Ammo
 *    - Go Blind
 *    - Rambo (Para, Unlimited Ammo)
 *
 *  CVARs:
 *
 *    amx_dice_delay <180> 	: (CVAR) 	(Default = 180)			Sets the time players have to wait before gambling again
 *										(Set either in amxx.cfg or by amx_cvar command)
 *    amx_dice_monstermod <1|0>	: (CVAR)	(Default = 0)			Enable/Disable Monstermod support
 *										(You need activate monstermod to use this option)
 *    amx_dice_admin <1|0>	: (CVAR)	(Default = 0)			Enable/Disable amx_dice_delay for admins
 *										(use ADMIN_ACCESS to set the flag)
 *    amx_dice_statictimes <1|0>: (CVAR)	(Default = 0)			Switch between static- and random-times for prizes
 *    amx_dice_debug <0|1|2>:	  (CVAR)	(Default = 0)			Enable/Disable Debug Mode
 *											0 = No Debug
 *											1 = Normal Debug
 *											2 = Advanced Debug
 *
 *
 *  Use this CVARS when 'amx_dice_statictimes' is ENABLED:
 *
 *    amx_dice_nightclubtime <15>	(Default = 15)		Sets the prize-time of NightClub
 *    amx_dice_slaptime <12>		(Default = 12) 		Sets the prize-time of Slap Disease
 *    amx_dice_oldmantime <10>		(Default = 10)		Sets the prize-time of Old Man
 *    amx_dice_humanbombtime <15>	(Default = 15)		Sets the prize-time of Human TimeBomb
 *    amx_dice_drunkardtime <20>	(Default = 20)		Sets the prize-time of Smoking Drunkard
 *    amx_dice_nocliptime <10>		(Default = 10)		Sets the prize-time of Noclip
 *    amx_dice_godmodetime <15>		(Default = 15)		Sets the prize-time of Godmode
 *    amx_dice_zeusmodetime <20>	(Default = 20)		Sets the prize-time of Zeusmode
 *    amx_dice_lukeskywalkertime <20>	(Default = 20)		Sets the prize-time of Luke Skywalker
 *    amx_dice_racecartime <17>		(Default = 17)		Sets the prize-time of Race Car
 *    amx_dice_invisiblegodtime <17>	(Default = 17)		Sets the prize-time of Invisible God
 *    amx_dice_invisibletime <17>	(Default = 17)		Sets the prize-time of Invisible Normal
 *    amx_dice_wildridetime <3>		(Default = 3)		Sets the prize-time of Wild Ride
 *    amx_dice_rambotime <20>		(Default = 20)		Sets the prize-time of Rambo
 *
 *    amx_dice_badprizes <abc..>: (CVAR)	(Default = abcdefghijklm) 	Enable all BAD PRIZES you want...	
 *											a = Win 100 Chickens
 *											b = Nightclub
 *											c = Deadly Slap Disease
 *											d = Burning
 *											e = Wild Ride
 *											f = Old Man
 *											g = Human Timebomb
 *											h = Smoking Drunkard
 *											i = Lose XP
 *											j = Bankrupt
 *											k = Win 50 Crabs (or Monsters)
 *											l = Hit by Lightning
 *											m = Go Blind
 *
 *    amx_dice_goodprizes <abc..>: (CVAR)	(Default = abcdefghijklm) 	Enable all GOOD PRIZES you want...	
 *											a = No Clip
 *											b = Godmode
 *											c = Zeusmode
 *											d = Luke Skywalker
 *											e = Win Health
 *											f = Race Car
 *											g = Invisible God
 *											h = Invisible Normal
 *											i = Win XP
 *											j = Win Money
 *											k = Full Equipment
 *											l = Unlimited Ammo
 *											m = Para Action (Rambo)
 *
 *    amx_dice_playmode <1|2|3> (CVAR)		(Default = 1)			Specify which team(s) are able to roll the dice...
 *											1 = ALL
 *											2 = Only T
 *											3 = Only CT
 *											
 *
 *  Client/Admin Commands:
 *
 *    say  roll the dice 	(Client)
 *    say  rollthedice		(Client)	
 *    say  roll teh dice	(Client)
 *    say  i feel lucky 	(Client)
 *    say  rtd			(Client)
 *    say  dados		(Client)
 *    say  suerte		(Client)
 *    amx_dice <on|off> 	(Admin)
 *
 *
 *  
 *  Changelog: 
 *
 *		v2.5 RC 4:
 *			- fixed lots of runtime errors
 *			- fixed WIN MONEY message (negative amount)
 *			- fixed stuck bug in Smoking Drunkard Prize
 *			- fixed (again) kill message for Rambo and Luke Skywalker - not tested!
 *			- fixed bug where no timelimit was set for Zeusmode and Godmode
 *			- fixed bug where a player don't get XP
 *			- fixed bug where a player still go blind after "GO BLIND" Prize
 *
 *		v2.5 RC 3:
 *			- fixed a prize bug caused by a typo
 *			- fixed monstermod support
 *			- fixed "hit by lightning" message after you lose Health
 *			- fixed "win money" message
 *			- fixed WIN 50 CRABS Prize - it should work now
 *			- fixed runtime- and native error in event_damage function
 *			- fixed bug where you still go blind after "GO BLIND" Prize - not tested!
 *			- fixed crash bug
 *			- fixed lightsaber and Rambo kill message - not tested!
 *			- added CVAR for Debug Mode
 *			- added CVAR to specify which team(s) are able roll the dice (idea from 'NS Roll the Dice')
 *			- added two CVARS to enable/disable the prizes you want
 *			- added some info textmessages
 *			- added one say command
 *			- added good prize: PARA ACTION (RAMBO)
 *			- rewrote prize system
 *			- rewrote check_weapon function
 *			- rewrote event_damage function
 *			- edited WIN HEALTH Prize - you now get 'additional' 200 Health but max. 255
 *			- optimized code (not everything)
 *
 *		v2.5 RC 2:
 *			- added a CVAR to switch between random- and static-times (prizes)
 *			- added CVARs to set static times
 *			- added a CVAR for admins which will disable amx_dice_delay for them
 *			- added good prize: UNLIMITED AMMO
 *			- added bad prize: LOSE HEALTH (HIT BY LIGHTNING)
 *			- added bad prize: GO BLIND
 *			- edited RACE CAR Prize (you now get 150 Health, too)
 *
 *  		v2.5 RC 1:
 *			- plugin renamed to "Advanced Roll The Dice"
 *			- added good prize: FULL EQUIPMENT
 *			- added some info textmessages
 *			- added delay so that you can not roll directly after someone else
 *			- readded monstmod support (amx_dice_monstermod <1|0>)
 *			- rewrote some stuff
 *			- removed tfc support
 *			- changed CVAR-Name for Dice-Delay
 *			- edited WON MONEY Prize (you now get 'additional' money)
 *			- edited 250 HEALTH Prize (you now get 'additional' health)
 *  		v2.4f:
 *                      - temporarly removed vault support
 *                      - removed amx_dice_default Admin Command
 *                      - fixed sv_maxspeed bug
 *                      - fixed amx_dice <on | off> bug
 *  		v2.4e:		
 *                      - removed monstermod support
 *                      - removed PODBOT support
 *                      - all times of rewards are now RANDOM
 *                      - renamed and relocated INI-File
 *                      - removed/renamed spanish codesnipes (say commands are still there)
 *                      - added require_module
 *                      - modified code
 *                      - fixed (again) some typos
 *  		v2.4d: 		
 *                      - fixed amx_givexp bug (player don't revive the won xp)
 *  		v2.4c: 	
 *                      - fixed some bugs (wild ride and native errors)
 *                      - added two rollthedice commands: "roll the dice" and "roll teh dice"
 *  		v2.4b: 		
 *                      - fixed some mistakes in the grammer and some typos
 *  		v2.4a: 	
 *                      - Changed 50 Snark Monsters To 50 Headcrabs
 *                      - Added a few translations so as I knew what stuff did
 *                      - Will add a check for monstermod soon, this was just a quick fix to get it working 100% with no errors.			
 *  		v2.4:		
 *                      - Added snark monster prize
 *                      - Check Team for burning
 *                      - WC3 / Superhero Check
 *                      - Some CVARs changed
 *                      - New prizes process (called premios)
 *                      - Added BreadDawson fixes
 *   		v2.3:
 *                      - Glowing Removed (it's no funny)
 *                      - Multimod compatibility LOST :( ONLY CS/CZ (sorry)
 *                      - Added this prizes: xp prizes, money prizes, invisibility nogod, burning, nightclub
 *                      - New FX Sounds
 *                      - NoStuck for ZEUSMode & NoClip
 *                      - Rewritten chance code
 *                      - Rewritten prizes code
 *  		v2.2: 			
 *			- fixed invisible bug
 *			- fixed stuck on bug
 *  		v2.1 & before Original by Ludwig van
 *
 *
 *  TO DO:
 *	- voting system
 *	- admin menu
 *	- optimize code (if possible)
 *	- deathmatch mode support
 *	- multimod compatibility (not sure)
 *
 *
 *  CREDITS TO:
 *	- EJL (Original Plugin & Idea)
 *	- BreadDawson & DarkBeatz (for v2.2 & 2.4)
 *	- MattOGM (for v2.4a)
 *	- XxAvalanchexX (for lowspeed when shooting with m249)
 *	- SilverTide (for event_damage function)
 *
 *  THANKS TO:
 *	- v3x
 *	- GHW_Chronic
 *
 ***************************************************************************************/

#include <amxmodx>
#include <amxmisc>
#include <engine>
#include <fun>
#include <cstrike>

#define PLUGIN	"Advanced Roll The Dice" 
#define VERSION	"v2.5 RC 4" 
#define AUTHOR	"Striker"

#define GAMBLING_DELAY_TIME 3.0
#define PARA_SHOOT_SPEED 90.0
#define ADMIN_ACCESS ADMIN_RCON

new BOMBKILL_RANGE = 450;  // killing radius of bomb. (96 is playerheight)

// Prizes
#define PRIZE_GODMODE 		1
#define PRIZE_NOCLIP 		2
#define PRIZE_ZEUSMODE 		3
#define PRIZE_SLAP 		4
#define PRIZE_SPEED 		5
#define PRIZE_TIMEBOMB 		6
#define PRIZE_INVISIBLE 	7
#define PRIZE_NIGHTCLUB 	8
#define PRIZE_SLOW 		9
#define PRIZE_GRAVITY 		10
#define PRIZE_LSABER 		11
#define PRIZE_DRINKING 		12
#define PRIZE_BLIND 		13
#define PRIZE_UNLIMITEDAMMO	14
#define PRIZE_PARA 		15

// Good or Bad Prize
#define PRIZE_BAD 	0
#define PRIZE_GOOD 	1

// List of all Prizes
#define GOOD_PRIZE_NOCLIP		(1<<0)  // "a"
#define GOOD_PRIZE_GODMODE		(1<<1)  // "b"
#define GOOD_PRIZE_ZEUSMODE		(1<<2)  // "c"
#define GOOD_PRIZE_LUKESKYWALKER	(1<<3)  // "d"
#define GOOD_PRIZE_WINHEALTH          	(1<<4)  // "e"
#define GOOD_PRIZE_RACECAR		(1<<5)  // "f"
#define GOOD_PRIZE_INVISIBLEGOD		(1<<6)  // "g"
#define GOOD_PRIZE_INVISIBLE		(1<<7)  // "h"
#define GOOD_PRIZE_WINXP		(1<<8)  // "i"
#define GOOD_PRIZE_WINMONEY		(1<<9)  // "j"
#define GOOD_PRIZE_FULLEQUIPMENT	(1<<10) // "k"
#define GOOD_PRIZE_UNLIMITEDAMMO	(1<<11) // "l"
#define GOOD_PRIZE_PARAACTION		(1<<12) // "m"

#define BAD_PRIZE_WINCHICKEN		(1<<0)  // "a"
#define BAD_PRIZE_NIGHTCLUB		(1<<1)  // "b"
#define BAD_PRIZE_SLAP			(1<<2)  // "c"
#define BAD_PRIZE_BURNING		(1<<3)  // "d"
#define BAD_PRIZE_WILDRIDE		(1<<4)  // "e"
#define BAD_PRIZE_OLDMAN		(1<<5)  // "f"
#define BAD_PRIZE_HUMANTIMEBOMB		(1<<6)  // "g"
#define BAD_PRIZE_SMOKINGDRUNKARD	(1<<7)  // "h"
#define BAD_PRIZE_LOSEXP		(1<<8)  // "i"
#define BAD_PRIZE_BANKRUPT		(1<<9)  // "j"
#define BAD_PRIZE_WINCRABS		(1<<10) // "k"
#define BAD_PRIZE_HITBYLIGHTNING	(1<<11) // "l"
#define BAD_PRIZE_GOBLIND		(1<<12) // "m"
										

new Float:amx_ff;
new Float:LastGambleTime[33];
new Float:oldspeed[33];
new bool:bBombCredit = true;
new bool:bGamesEnabled = true;
new bool:bIsGambling = false;
new bool:rs = false;
new bool:wasFiring[33];
new onfire[33];
new moved[33];
new moves[4][] = {"+moveleft","+moveright","+back","+forward"};
new dcounter[33];
new heart_a[33];
new HasPrize[33][2];
new wasbomb[33];
new origen[3];
new old_svspeed;
new invisiblegod;
new g_lastPosition[33][3];
new g_Hasuammo[33];
new g_ReloadTime[33];
new g_iRoundStart;
new g_msgDamage;
new g_msgFade;
new g_msgShake;
new mdlWcan;
new mdlChicken;
new mdlCrabs;
new mdlWbottle;
new mdlC4bomb;
new mdlGibs;
new sprMflash;
new sprSmoke;
new sprWhite;
new sprFire;
new sprSaber;
new sprFuselight;
new sprFlare6;
new sprBflare;
new sprRflare;
new sprGflare;
new sprTflare;
new sprOflare;
new sprPflare;
new sprYflare;
new sprLightning;


public plugin_init()
{
	register_plugin(PLUGIN,VERSION,AUTHOR);
	register_concmd("amx_dice", "admin_dice", ADMIN_LEVEL_H, " - <on|off>: Turns dice games on or off.");
	register_clcmd("say", "HandleSay");
	register_cvar("amx_dice_monstermod","0");
	register_cvar("amx_dice_debug","0");
	register_cvar("amx_dice_delay","180.0");
	register_cvar("amx_dice_admin", "0");
	register_cvar("amx_dice_vote", "0" );
	register_cvar("amx_dice_statictimes", "0");
	register_cvar("amx_dice_nightclubtime", "15");
	register_cvar("amx_dice_slaptime", "12");
	register_cvar("amx_dice_oldmantime", "10");
	register_cvar("amx_dice_humanbombtime", "15");
	register_cvar("amx_dice_drunkardtime", "20");
	register_cvar("amx_dice_nocliptime", "10");
	register_cvar("amx_dice_godmodetime", "15");
	register_cvar("amx_dice_zeusmodetime", "20");
	register_cvar("amx_dice_lukeskywalkertime", "20");
	register_cvar("amx_dice_racecartime", "17");
	register_cvar("amx_dice_rambotime", "20");
	register_cvar("amx_dice_invisiblegodtime", "17");
	register_cvar("amx_dice_invisibletime", "17");
	register_cvar("amx_dice_wildridetime", "3");
	register_cvar("amx_dice_badprizes","abcdefghijklm")
	register_cvar("amx_dice_goodprizes","abcdefghijklm")
	register_cvar("amx_dice_playmode","1")
	register_cvar("amx_rollthedice",VERSION,FCVAR_SERVER);
	register_event("SendAudio","roundend_cleanup","a","2=%!MRAD_terwin","2=%!MRAD_ctwin","2=%!MRAD_rounddraw");
	register_event("TextMsg","roundend_cleanup","a","2&#Game_C","2&#Game_w");
	register_event("RoundTime","round_begin","bc");
	register_event("CurWeapon","check_weapon","be","1=1")
	register_event("ScreenFade","player_screenfade","be","4=255","5=255","6=255","7>199")
	register_event("Damage","event_damage","b","2!0")
	g_msgShake = get_user_msgid("ScreenShake");
	g_msgFade = get_user_msgid("ScreenFade");
	g_msgDamage = get_user_msgid("Damage");
	set_task(1.0,"dice_timer",77,"",0,"b");
	
	return PLUGIN_CONTINUE;
}

public plugin_precache()
{
	// Precache 15 Sprites
	sprSmoke = precache_model("sprites/steam1.spr");
	sprWhite = precache_model("sprites/white.spr");
	sprFire = precache_model("sprites/explode1.spr");
	sprSaber = precache_model("sprites/laserbeam.spr");
	sprFuselight = precache_model("sprites/glow01.spr");
	sprMflash = precache_model("sprites/muzzleflash.spr");
	sprFlare6 = precache_model("sprites/Flare6.spr");
	sprBflare = precache_model("sprites/fireworks/bflare.spr");
	sprRflare = precache_model("sprites/fireworks/rflare.spr");
	sprGflare = precache_model("sprites/fireworks/gflare.spr");
	sprTflare = precache_model("sprites/fireworks/tflare.spr");
	sprOflare = precache_model("sprites/fireworks/oflare.spr");
	sprPflare = precache_model("sprites/fireworks/pflare.spr");
	sprYflare = precache_model("sprites/fireworks/yflare.spr");
	sprLightning = precache_model("sprites/lgtning.spr");
	
	// Precache 6 Models
	mdlChicken = precache_model("models/chick.mdl");
	mdlCrabs = precache_model("models/headcrab.mdl");
	mdlC4bomb = precache_model("models/w_weaponbox.mdl");
	mdlGibs = precache_model("models/hgibs.mdl");
	mdlWcan = precache_model("models/can.mdl");
	
	if(file_exists("models/winebottle.mdl")==1)
	{
		mdlWbottle = precache_model("models/winebottle.mdl");
	}
	else
	{
		mdlWbottle = precache_model("models/can.mdl");
	}
	
	// Precache 21 Sounds
	precache_sound("ambience/zapmachine.wav");
	precache_sound("ambience/flameburst1.wav");
	precache_sound("ambience/thunder_clap.wav");
	precache_sound("buttons/blip2.wav");
	precache_sound("misc/gemido01.wav");
	precache_sound("misc/gemido02.wav");
	precache_sound("misc/gemido03.wav");
	precache_sound("misc/gemido04.wav");
	precache_sound("misc/chicken4.wav");
	precache_sound("misc/risamalo.wav");
	precache_sound("misc/kotosting.wav");
	precache_sound("misc/stinger12.wav");
	precache_sound("misc/teleport_out_01.wav");
	precache_sound("misc/bipbip.wav");
	precache_sound("misc/blade1.wav");
	precache_sound("misc/applause.wav");
	precache_sound("misc/risa.wav");
	precache_sound("misc/benny1.wav");
	precache_sound("misc/burp.wav");
	precache_sound("vox/_period.wav");
	precache_sound("scientist/scream21.wav");
	precache_sound("scientist/scream07.wav");
	
	return PLUGIN_CONTINUE;
}

public round_begin()
{
	if(get_cvar_num("amx_dice_debug") == 2)
		log_amx("-------- DEBUG (Advanced Roll the Dice): round_begin --------");
	
	if (read_data(1)==floatround(get_cvar_float("mp_roundtime")*60.0))
		g_iRoundStart=1;
		
	return PLUGIN_CONTINUE;
}

public client_connect(id)
{
	client_cmd(id, "echo ");
	client_cmd(id, "echo ^" *=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=* ^" ");
	client_cmd(id, "echo ^" *=-= Roll The Dice is active on this Server!  ^" ");
	client_cmd(id, "echo ^" *=-= Type 'rollthedice' to start gambling.    ^" ");
	client_cmd(id, "echo ^" *=-=                                          ^" ");
	client_cmd(id, "echo ^" *=-=          powered by www.fun-arena.com    ^" ");
	client_cmd(id, "echo ^" *=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=* ^" ");
	client_cmd(id, "echo ");
}

public  client_putinserver(id)
{
	if(is_user_bot(id)) 
		return PLUGIN_HANDLED;
		
	LastGambleTime[id] = -1000.0;
	wasbomb[id] = 0;
	g_Hasuammo[id] = 0;
	HasPrize[id][0] = 0;
	HasPrize[id][1] = 0;
	set_user_rendering(id,kRenderFxNone,255,255,255, kRenderNormal,16);
	
	return PLUGIN_CONTINUE;
}

public client_disconnect(id)
{
	if(is_user_bot(id)) 
		return PLUGIN_HANDLED;

	LastGambleTime[id] = -1000.0;
	wasbomb[id] = 0;
	g_Hasuammo[id] = 0;
	HasPrize[id][0] = 0;
	HasPrize[id][1] = 0;
	
	return PLUGIN_CONTINUE;
}

public roundend_cleanup()
{
	if(get_cvar_num("amx_dice_debug") == 2)
		log_amx("-------- DEBUG (Advanced Roll the Dice): roundend_cleanup --------");
		
	times_up(100);
	rs = true;
	g_iRoundStart=0;
	set_task(15.0,"dice_rs_delay");
	
	new maxplayers = get_maxplayers()+1;
	for(new id = 1; id < maxplayers; id++)
	{
		if(is_user_connected(id)) 
		{
			g_Hasuammo[id] = 0;
			HasPrize[id][0] = 0;
			HasPrize[id][1] = 0;
			set_user_rendering(id,kRenderFxNone,255,255,255, kRenderNormal,16);
		}
	}
}

public dice_rs_delay()
{
	if(get_cvar_num("amx_dice_debug") == 2)
		log_amx("DEBUG (Advanced Roll the Dice): Function dice_rs_delay");

	rs = false;
}

public delay_gambling()
{
	if(get_cvar_num("amx_dice_debug") == 2)
		log_amx("DEBUG (Advanced Roll the Dice): Function delay_gambling");
	
	bIsGambling = false;
}

public round_start()
{
	new maxplayers = get_maxplayers()+1;
	for (new a=1; a<maxplayers; a++)
	{
		if(wasbomb[a] == 1)
		{
			wasbomb[a] = 0;
		}
		set_user_rendering(a,kRenderFxNone,255,255,255, kRenderNormal,16);
	}
	
	return PLUGIN_CONTINUE;
}

playsoundall(ww[])
{
	client_cmd(0,"play %s",ww);
}

public admin_dice(id,level,cid)
{
	if (!cmd_access(id,level,cid,1))
	{
		client_print(id,print_console,"[AMXX] You have no access to that command");
		
		return PLUGIN_HANDLED;
	}

	if (read_argc() < 2)
	{
		new onoff[4];
		if(bGamesEnabled == true)
		{
			copy(onoff, 4, "ON");
		}
		else
		{
			copy(onoff, 4, "OFF");
		}
		client_print(id,print_console,"[AMXX] Usage: amx_dice < on | off >     Currently: %s", onoff);
		
		return PLUGIN_HANDLED;
	}

	new arg[10];
	read_argv(1,arg,10);
	
	old_svspeed = get_cvar_num("sv_maxspeed");
	
	if ( (equal(arg,"on", 2)) || (equal(arg,"1", 1)) )
	{
		if ( bGamesEnabled == true )
		{
			console_print(id,"[AMXX] Advanced Roll The Dice is already enabled");
			client_print(id,print_chat, "[AMXX] Advanced Roll The Dice is already enabled");
		}
		else
		{
			server_cmd("sv_maxspeed 1000");
			bGamesEnabled = true;
			set_task(1.0,"dice_timer",77,"",0,"b");
			console_print(id,"[AMXX] Dice ON");
			client_print(0,print_chat,"[AMXX] <Dice Dealer>  Admin has turned Roll The Dice mode ON");
			set_hudmessage(200, 100, 0, -1.0, 0.30, 0, 6.0, 6.0, 0.5, 0.15, 1);
			show_hudmessage(0,"ADMIN has ENABLED Roll The Dice!^nSay rollthedice to gamble!");
		}
	}
	else
	{
		if ( bGamesEnabled == false )
		{
			console_print(id,"[AMXX] Advanced Roll the Dice is already disabled");
			client_print(id,print_chat, "[AMXX] Advanced Roll the Dice is already disabled");
		}
		else
		{
			bGamesEnabled = false;
			server_cmd("sv_maxspeed %d",old_svspeed);
			
			new maxpl = get_maxplayers() +1;
			
			for(new i=1; i > maxpl; i++)
			{
				set_user_maxspeed(i,320.0);
				set_user_godmode(i);
				set_user_noclip(i);
				g_Hasuammo[i] = 0;
				HasPrize[i][0] = 0;
				HasPrize[i][1] = 0;
			}
				
			remove_task(77);
			console_print(id,"[AMXX] Dice OFF");
			client_print(0,print_chat,"[AMXX] <Dice Dealer>  Admin has turned Roll The Dice mode OFF");
			set_hudmessage(200, 100, 0, -1.0, 0.30, 0, 6.0, 6.0, 0.5, 0.15, 1);
			show_hudmessage(0,"ADMIN has DISABLED Roll The Dice!");
		}
	}
	
	new name[32], authid[32];
	get_user_authid(id,authid,31);
	get_user_name(id,name,31);
	log_amx("^"%s<%d>^" (Advanced Roll the Dice) ^"dice_mode <%s>^"", name,get_user_userid(id),arg);

	return PLUGIN_HANDLED;
}

public HandleSay(id)
{
	new Speech[192];
	read_args(Speech,192);
	remove_quotes(Speech);
	
	if(HandleSay2(id,Speech))	
		return PLUGIN_HANDLED;

	return PLUGIN_CONTINUE;
}

public HandleSay2(id,Speech[])
{
	if ( (equali(Speech, "roll the dice")) || (equali(Speech, "i feel lucky")) || (equali(Speech, "suerte")) || (equali(Speech, "dados")) || (equali(Speech, "rollthedice")) || (equali(Speech, "roll teh dice")) || (equali(Speech, "rtd")) )
	{
		rollthedice(id);
	}
	
	return PLUGIN_CONTINUE;
}

public rollthedice(id)
{
	if(is_user_bot(id)) 
		return PLUGIN_HANDLED;
		
	else if(bGamesEnabled == false)
	{
		client_print(id,print_chat, "[AMXX] <Dice Dealer>  Admin has disabled gambling. Bug him to re-enable it.");
		return PLUGIN_HANDLED;
	}
	else if(is_user_alive(id) == 0)
	{
		client_print(id,print_chat, "[AMXX] <Dice Dealer>  Dead men roll no dice.");
		return PLUGIN_HANDLED;
	}
	else if (get_gametime() < LastGambleTime[id] + get_cvar_float("amx_dice_delay"))
	{	
		if(get_cvar_num("amx_dice_admin") == 0 || !(get_user_flags(id) & ADMIN_ACCESS))
		{
			client_print(id,print_chat, "[AMXX] <Dice Dealer>  You gambled recently, try again in %d seconds.",floatround( LastGambleTime[id] + get_cvar_num("amx_dice_delay") - get_gametime()+1 ));
			return PLUGIN_HANDLED;
		}
	}
	else if (bIsGambling == true)
	{
		client_print(id,print_chat, "[AMXX] <Dice Dealer>  I'm busy with someone else, please wait.");
		return PLUGIN_HANDLED;
	}
	else if (g_iRoundStart == 0)
	{
		client_print(id,print_chat, "[AMXX] <Dice Dealer>  No Dice before round started.");
		return PLUGIN_HANDLED;
	}
	
	new team[32];
	get_user_team(id,team,32);
	
	if( (equal(team,"T", 1)) && (get_cvar_num("amx_dice_playmode") == 3) )
	{
		client_print(id, print_chat, "[AMXX] <Dice Dealer>  Only CTs are allowed to gamble in current play mode.");
		return PLUGIN_HANDLED;
	}
	else if ( (equal(team,"CT", 1)) && (get_cvar_num("amx_dice_playmode") == 2) )
	{
		client_print(id, print_chat, "[AMXX] <Dice Dealer>  Only Ts are allowed to gamble in current play mode.");
		return PLUGIN_HANDLED;
	}
	
	if(get_cvar_num("amx_dice_debug") != 0)
	{
		new User[32];
		get_user_name(id,User,32);
		
		log_amx("DEBUG (Advanced Roll the Dice): rollthedice <%s>", User);
	}
		
	random_prize(id);
	
	return PLUGIN_CONTINUE;
}

public random_prize(id)
{
	new Roll = random(2);
	new Roll2 = random(13);
	
	if(get_cvar_num("amx_dice_debug") != 0)
		log_amx("DEBUG (Advanced Roll the Dice): Function random_prize");
	
	switch(Roll)
	{
		case 0: 
			{
				if(get_cvar_num("amx_dice_debug") != 0)
					log_amx("DEBUG (Advanced Roll the Dice): Function random_prize (case 0)");
					
				bad_prizes(id,Roll2);
			}
		case 1: 
			{
				if(get_cvar_num("amx_dice_debug") != 0)
					log_amx("DEBUG (Advanced Roll the Dice): Function random_prize (case 1)");
					
				good_prizes(id,Roll2);
			}
	}
	
	return PLUGIN_CONTINUE;
}

public get_prize_flags(type)
{ 
	new flags[25]; 
	
	switch(type) 
	{ 
		case PRIZE_BAD: get_cvar_string("amx_dice_badprizes" , flags , 24); 
		case PRIZE_GOOD: get_cvar_string("amx_dice_goodprizes" , flags , 24); 
	} 
  
	return read_flags(flags); 
}

public bad_prizes(id,Roll2)
{
	if(get_cvar_num("amx_dice_debug") != 0)
		log_amx("DEBUG (Advanced Roll the Dice): Function bad_prizes");
	
	heart_a[id] = 0;
	bIsGambling = true;
	new Red = random(256);
	new Green = random(256);
	new Blue = random(256);
	new User[32];
	get_user_name(id,User,32);
		
	// WIN 100 CHICKENS
	if (Roll2 == 0)
	{
		if (get_prize_flags(PRIZE_BAD)&BAD_PRIZE_WINCHICKEN)
		{
			if(get_cvar_num("amx_dice_debug") != 0)
				log_amx("DEBUG (Advanced Roll the Dice): Roll=[0], Roll2=[%d] <%s>",Roll2, User);
			
			client_print(0,print_chat, "[AMXX] <Dice Dealer>  %s won 100 CHICKENS !!!", User);
			set_hudmessage(200,0,0, 0.03, 0.62, 2, 0.02, 5.0, 0.01, 0.1, 1);
			show_hudmessage(0,"%s is throwing chickens!!!", User);
			emit_sound(id,CHAN_ITEM, "misc/chicken4.wav", 1.0, ATTN_NORM, 0, PITCH_NORM);
			mod_spawn(id);
			set_task(GAMBLING_DELAY_TIME,"delay_gambling");
		}
		else
		{
			bIsGambling = false;
			Roll2++;
			bad_prizes(id,Roll2);
				
			return PLUGIN_HANDLED;
		}
	}
	// NIGHTCLUB
	else if (Roll2 == 1)
	{	
		if (get_prize_flags(PRIZE_BAD)&BAD_PRIZE_NIGHTCLUB)
		{
			if(get_cvar_num("amx_dice_debug") != 0)
				log_amx("DEBUG (Advanced Roll the Dice): Roll=[0], Roll2=[%d] <%s>",Roll2, User);
			
			client_print(0,print_chat, "[AMXX] <Dice Dealer>  %s is dancing at the NightClub!", User);
			HasPrize[id][0] = PRIZE_NIGHTCLUB;
					
			if( get_cvar_num("amx_dice_statictimes") == 0)
			{
				HasPrize[id][1] = random_num(8,14);
			}
			else
			{
				HasPrize[id][1] = get_cvar_num("amx_dice_nightclubtime");
			}
					
			set_user_rendering(id,kRenderFxGlowShell, Red,Green,Blue, kRenderNormal,16);
			new tid[2];
			tid[0] = id;
			tid[1] = 1;
			client_cmd(id, "cl_forwardspeed 500");
			set_task(0.1,"single_knife",0,tid,2,"a",((HasPrize[id][1]+2)*10)-10);
			emit_sound(id,CHAN_VOICE, "misc/blade1.wav", 1.0, ATTN_NORM, 0, PITCH_NORM);
		}
		else
		{
			bIsGambling = false;
			Roll2++;
			bad_prizes(id,Roll2);
						
			return PLUGIN_HANDLED;
		}
	}
	// DEADLY SLAP DISEASE
	else if (Roll2 == 2)
	{
		if (get_prize_flags(PRIZE_BAD)&BAD_PRIZE_SLAP)
		{
			if(get_cvar_num("amx_dice_debug") != 0)
				log_amx("DEBUG (Advanced Roll the Dice): Roll=[0], Roll2=[%d] <%s>",Roll2, User);
				
			client_print(0,print_chat, "[AMXX] <Dice Dealer>  %s has contracted the deadly slap disease!", User);
			HasPrize[id][0] = PRIZE_SLAP;
					
			if( get_cvar_num("amx_dice_statictimes") == 0)
			{
				HasPrize[id][1] = random_num(4,10);
			}
			else
			{
				HasPrize[id][1] = get_cvar_num("amx_dice_slaptime");
			}
					
			user_slap(id,5);
			set_user_rendering(id,kRenderFxGlowShell, Red,Green,Blue, kRenderNormal,16);
		}
		else
		{
			bIsGambling = false;
			Roll2++;
			bad_prizes(id,Roll2);
						
			return PLUGIN_HANDLED;
		}
	}
	// BURNING
	else if (Roll2 == 3)
	{
		if (get_prize_flags(PRIZE_BAD)&BAD_PRIZE_BURNING)
		{
			if(get_cvar_num("amx_dice_debug") != 0)
				log_amx("DEBUG (Advanced Roll the Dice): Roll=[0], Roll2=[%d] <%s>",Roll2, User);
				
			client_print(0,print_chat, "[AMXX] <Dice Dealer>  %s is burning!!!", User);
			set_hudmessage(200,0,0, 0.03, 0.62, 2, 0.02, 5.0, 0.01, 0.1, 1);
			show_hudmessage(0,"%s will burn until death!",User);
			new skIndex[2];
			skIndex[0] = id;
			new name[32];
			get_user_name(id,name,31);
			onfire[id] = 1;
			ignite_effects(skIndex);
			ignite_player(skIndex);
			new tid[1];
			tid[0] = id;
			dcounter[id] = 0;
			set_task(GAMBLING_DELAY_TIME,"delay_gambling");
		}
		else
		{
			bIsGambling = false;
			Roll2++;
			bad_prizes(id,Roll2);
						
			return PLUGIN_HANDLED;
		}
	}
	// WILD RIDE
	else if (Roll2 == 4)
	{
		if (get_prize_flags(PRIZE_BAD)&BAD_PRIZE_WILDRIDE)
		{
			if(get_cvar_num("amx_dice_debug") != 0)
				log_amx("DEBUG (Advanced Roll the Dice): Roll=[0], Roll2=[%d] <%s>",Roll2, User);
				
			client_print(0,print_chat, "[AMXX] <Dice Dealer>  %s is going for a wild ride!", User);
			HasPrize[id][0] = PRIZE_GRAVITY;
					
			if( get_cvar_num("amx_dice_statictimes") == 0)
			{
				HasPrize[id][1] = random_num(4,8);
			}
			else
			{
				HasPrize[id][1] = get_cvar_num("amx_dice_wildridetime");
			}
			
			set_user_rendering(id,kRenderFxGlowShell, Red,Green,Blue, kRenderNormal,16);
			set_user_gravity(id,-50.0);
			set_user_frags(id,(get_user_frags(id)-1));
		}
		else
		{
			bIsGambling = false;
			Roll2++;
			bad_prizes(id,Roll2);
						
			return PLUGIN_HANDLED;
		}		
	}
	// OLD MAN
	else if (Roll2 == 5)
	{
		if (get_prize_flags(PRIZE_BAD)&BAD_PRIZE_OLDMAN)
		{
			if(get_cvar_num("amx_dice_debug") != 0)
				log_amx("DEBUG (Advanced Roll the Dice): Roll=[0], Roll2=[%d] <%s>",Roll2, User);
				
			client_print(0,print_chat, "[AMXX] <Dice Dealer>  Oh no, %s is an old man now.", User);
			HasPrize[id][0] = PRIZE_SLOW;
					
			if( get_cvar_num("amx_dice_statictimes") == 0)
			{
				HasPrize[id][1] = random_num(8,15);
			}
			else
			{
				HasPrize[id][1] = get_cvar_num("amx_dice_oldmantime");
			}
						
			oldspeed[id] = get_user_maxspeed(id);
			emit_sound(id,CHAN_VOICE, "misc/benny1.wav", VOL_NORM, ATTN_NORM, 0, PITCH_NORM);
			set_user_maxspeed(id,72.0);
			set_user_rendering(id,kRenderFxGlowShell, Red,Green,Blue, kRenderNormal,16);
		}
		else
		{
			bIsGambling = false;
			Roll2++;
			bad_prizes(id,Roll2);
						
			return PLUGIN_HANDLED;
		}
	}
	// HUMAN TIMEBOMB
	else if (Roll2 == 6)
	{
		if (get_prize_flags(PRIZE_BAD)&BAD_PRIZE_HUMANTIMEBOMB)
		{
			if(get_cvar_num("amx_dice_debug") != 0)
				log_amx("DEBUG (Advanced Roll the Dice): Roll=[0], Roll2=[%d] <%s>",Roll2, User);
				
			client_print(0,print_chat, "[AMXX] <Dice Dealer>  %s is now a human time-bomb!  Everyone RUN for cover", User);
			HasPrize[id][0] = PRIZE_TIMEBOMB;
			
			if( get_cvar_num("amx_dice_statictimes") == 0)
			{
				HasPrize[id][1] = random_num(10,18);
			}
			else
			{
				HasPrize[id][1] = get_cvar_num("amx_dice_humanbombtime");
			}
			
			client_cmd(0, "spk ^"warning _comma detonation device activated^"");
			player_attachment(id);
		}
		else
		{
			bIsGambling = false;
			Roll2++;
			bad_prizes(id,Roll2);
						
			return PLUGIN_HANDLED;
		}
	}
	// SMOKING DRUNKARD
	else if (Roll2 == 7)
	{
		if (get_prize_flags(PRIZE_BAD)&BAD_PRIZE_SMOKINGDRUNKARD)
		{
			if(get_cvar_num("amx_dice_debug") != 0)
				log_amx("DEBUG (Advanced Roll the Dice): Roll=[0], Roll2=[%d] <%s>",Roll2, User);
				
			client_print(0,print_chat, "[AMXX] <Dice Dealer>  %s is now a smoking drunkard!", User);
			HasPrize[id][0] = PRIZE_DRINKING;
					
			if( get_cvar_num("amx_dice_statictimes") == 0)
			{
				HasPrize[id][1] = random_num(10,25);
			}
			else
			{
				HasPrize[id][1] = get_cvar_num("amx_dice_drunkardtime");
			}
			
			new tid[1];
			tid[0] = id;
			dcounter[id] = 0;
			set_task(0.5,"smokin_1",0,tid,1,"a",HasPrize[id][1]*2);
			set_user_rendering(id,kRenderFxGlowShell, Red,Green,Blue, kRenderNormal,16);
		}
		else
		{
			bIsGambling = false;
			Roll2++;
			bad_prizes(id,Roll2);
						
			return PLUGIN_HANDLED;
		}
	}
	// LOST XP
	else if (Roll2 == 8)
	{
		if (get_prize_flags(PRIZE_BAD)&BAD_PRIZE_LOSEXP)
		{
			if(get_cvar_num("amx_dice_debug") != 0)
				log_amx("DEBUG (Advanced Roll the Dice): Roll=[0], Roll2=[%d] <%s>",Roll2, User);
				
			new war3xp = get_cvar_num("Warcraft_3_XP");
			new war3ft = get_cvar_num("sv_warcraft3");
			new shero = get_cvar_num("sv_superheros");		
		
			if (war3ft == 1)
			{
				new cantidadxp = (random(3)+1)*100;
				client_print(0,print_chat, "[AMXX] <Dice Dealer>  %s lost %d xp",User,cantidadxp);
				server_cmd("amx_givexp ^"%s^" -%d",User,cantidadxp);
				set_hudmessage(200,0,0, 0.03, 0.62, 2, 0.02, 5.0, 0.01, 0.1, 1);
				show_hudmessage(0,"Oooh! %s lost %d XP!",User,cantidadxp);
				client_cmd(0,"spk misc/risa.wav");
				set_task(GAMBLING_DELAY_TIME,"delay_gambling");
			}
			else if(war3xp == 1)
			{
				new cantidadxp = (random(3)+1)*100;
				client_print(0,print_chat, "[AMXX] <Dice Dealer>  %s lost %d xp",User,cantidadxp);
				server_cmd("wc3_givexp ^"%s^" -%d",User,cantidadxp);
				set_hudmessage(200,0,0, 0.03, 0.62, 2, 0.02, 5.0, 0.01, 0.1, 1);
				show_hudmessage(0,"Oooh! %s lost %d XP!",User,cantidadxp);
				client_cmd(0,"spk misc/risa.wav");
				set_task(GAMBLING_DELAY_TIME,"delay_gambling");
			}
			else if (shero == 1)
			{
				new cantidadxp = (random(3)+1)*100;
				client_print(0,print_chat, "[AMXX] <Dice Dealer>  %s lost %d xp",User,cantidadxp);
				server_cmd("amx_shaddxp ^"%s^" -%d",User,cantidadxp);
				set_hudmessage(200,0,0, 0.03, 0.62, 2, 0.02, 5.0, 0.01, 0.1, 1);
				show_hudmessage(0,"Oooh! %s lost %d XP!",User,cantidadxp);
				client_cmd(0,"spk misc/risa.wav");
				set_task(GAMBLING_DELAY_TIME,"delay_gambling");
			}
			else if (shero == 0 && war3xp == 0 && war3ft == 0)
			{
				client_print(0,print_chat, "[AMXX] <Dice Dealer>  SuperHero/War3xp Not Running, Re-Rolling");
				set_hudmessage(200,0,0, 0.03, 0.62, 2, 0.02, 5.0, 0.01, 0.1, 1);
				show_hudmessage(0,"SuperHero/War3xp Not Running, Re-Rolling");
				bIsGambling = false;
				Roll2++;
				bad_prizes(id,Roll2);
						
				return PLUGIN_HANDLED;
			}
		}
		else
		{
			bIsGambling = false;
			Roll2++;
			bad_prizes(id,Roll2);
						
			return PLUGIN_HANDLED;
		}
	}
	// BANKRUPT
	else if (Roll2 == 9)
	{
		if (get_prize_flags(PRIZE_BAD)&BAD_PRIZE_BANKRUPT)
		{
			if(get_cvar_num("amx_dice_debug") != 0)
				log_amx("DEBUG (Advanced Roll the Dice): Roll=[0], Roll2=[%d] <%s>",Roll2, User);
				
			cs_set_user_money(id,0);
			client_print(0,print_chat, "[AMXX] <Dice Dealer>  %s is bankrupt",User);
			set_hudmessage(200,0,0, 0.03, 0.62, 2, 0.02, 5.0, 0.01, 0.1, 1);
			show_hudmessage(0,"Sorry %s, you lost all your money!",User);
			client_cmd(0,"spk misc/risa.wav");
			set_task(GAMBLING_DELAY_TIME,"delay_gambling");
		}
		else
		{
			bIsGambling = false;
			Roll2++;
			bad_prizes(id,Roll2);
						
			return PLUGIN_HANDLED;
		}
	}
	// WIN 50 CRABS
	else if (Roll2 == 10)
	{
		if (get_prize_flags(PRIZE_BAD)&BAD_PRIZE_WINCRABS)
		{
			if(get_cvar_num("amx_dice_debug") != 0)
				log_amx("DEBUG (Advanced Roll the Dice): Roll=[0], Roll2=[%d] <%s>",Roll2, User);
				
			if(get_cvar_num("amx_dice_monstermod") == 1)
			{
				client_cmd(0,"spk headcrab/hc_alert1.wav");
				client_print(0,print_chat, "[AMXX] <Dice Dealer>  OMG! %s is throwing 50 little monsters!!", User);
				set_hudmessage(200,0,0, 0.03, 0.62, 2, 0.02, 5.0, 0.01, 0.1, 1);
				show_hudmessage(0,"%s is throwing 50 little monsters!!", User);
			}
			else
			{
				client_print(0,print_chat, "[AMXX] <Dice Dealer>  %s won 50 CRABS !!!", User);
				set_hudmessage(200,0,0, 0.03, 0.62, 2, 0.02, 5.0, 0.01, 0.1, 1);
				show_hudmessage(0,"%s is throwing crabs!!!", User);
			}
					
			mod_spawn2(id);
			set_task(GAMBLING_DELAY_TIME,"delay_gambling");
		}
		else
		{
			bIsGambling = false;
			Roll2++;
			bad_prizes(id,Roll2);
						
			return PLUGIN_HANDLED;
		}
	}
	// LOSE HEALTH (HIT BY LIGHTNING)
	else if (Roll2 == 11)
	{
		if (get_prize_flags(PRIZE_BAD)&BAD_PRIZE_HITBYLIGHTNING)
		{
			if(get_cvar_num("amx_dice_debug") != 0)
				log_amx("DEBUG (Advanced Roll the Dice): Roll=[0], Roll2=[%d] <%s>",Roll2, User);
				
			new health = get_user_health(id);
			new health_new = health - 60;
			set_user_health(id,health_new);
			new origin[3];
			get_user_origin(id,origin);
			origin[2] = origin[2] - 26;
			new sorigin[3];
			sorigin[0] = origin[0] + 150;
			sorigin[1] = origin[1] + 150;
			sorigin[2] = origin[2] + 400;
			lightning(sorigin,origin);
			emit_sound(id,CHAN_ITEM, "ambience/thunder_clap.wav", 1.0, ATTN_NORM, 0, PITCH_NORM);
			client_print(0,print_chat, "[AMXX] <Dice Dealer>  %s was hit by lightning!", User);
			set_hudmessage(200,0,0, 0.03, 0.62, 2, 0.02, 5.0, 0.01, 0.1, 1);
					
			if (health_new > 0)
				show_hudmessage(0, "%s was hit by lightning.",User);
			else if (health_new <= 0)
				show_hudmessage(0, "%s was hit by lightning and died.",User);
		
			set_task(GAMBLING_DELAY_TIME,"delay_gambling");
		}
		else
		{
			bIsGambling = false;
			Roll2++;
			bad_prizes(id,Roll2);
						
			return PLUGIN_HANDLED;
		}
	}
	// GO BLIND
	else if (Roll2 == 12)
	{
		if (get_prize_flags(PRIZE_BAD)&BAD_PRIZE_GOBLIND)
		{
			if(get_cvar_num("amx_dice_debug") != 0)
				log_amx("DEBUG (Advanced Roll the Dice): Roll=[0], Roll2=[%d] <%s>",Roll2, User);
				
			client_print(0,print_chat, "[AMXX] <Dice Dealer>  %s is blind!",User);
			set_hudmessage(200,0,0, 0.03, 0.62, 2, 0.02, 5.0, 0.01, 0.1, 1);
			show_hudmessage(0,"%s is now blind.",User);
			HasPrize[id][0] = PRIZE_BLIND;
			player_blind(id);
			set_task(GAMBLING_DELAY_TIME,"delay_gambling");
		}
		else
		{
			bIsGambling = false;
			random_prize(id);
						
			return PLUGIN_HANDLED;
		}
		
	}
	
	client_print(id,print_chat, "[AMXX] <Dice Dealer>  You rolled [1] [%d]", Roll2+1);
	
	LastGambleTime[id] = get_gametime();
	
	return PLUGIN_CONTINUE;
}

public good_prizes(id,Roll2)
{
	if(get_cvar_num("amx_dice_debug") != 0)
		log_amx("DEBUG (Advanced Roll the Dice): Function good_prizes");
	
	heart_a[id] = 0;
	bIsGambling = true;
	new Red = random(256);
	new Green = random(256);
	new Blue = random(256);
	new User[32];
	get_user_name(id,User,32);
		
	// NO CLIP
	if (Roll2 == 0)
	{
		if (get_prize_flags(PRIZE_GOOD)&GOOD_PRIZE_NOCLIP)
		{
			if(get_cvar_num("amx_dice_debug") != 0)
				log_amx("DEBUG (Advanced Roll the Dice): Roll=[1], Roll2=[%d] <%s>",Roll2, User);
				
			client_print(0,print_chat, "[AMXX] <Dice Dealer>  Congratulations, %s won Noclip!", User);
			HasPrize[id][0] = PRIZE_NOCLIP;
			
			if( get_cvar_num("amx_dice_statictimes") == 0)
			{
				HasPrize[id][1] = random_num(8,14);
			}
			else
			{
				HasPrize[id][1] = get_cvar_num("amx_dice_nocliptime");
			}
			
			set_user_noclip(id,1);
			set_user_rendering(id,kRenderFxGlowShell, Red,Green,Blue, kRenderNormal,16);
			emit_sound(id,CHAN_ITEM, "misc/kotosting.wav", 1.0, ATTN_NORM, 0, PITCH_NORM);
		}
		else
		{
			bIsGambling = false;
			Roll2++;
			good_prizes(id,Roll2);
				
			return PLUGIN_HANDLED;
		}
	}
	// GODMODE
	else if (Roll2 == 1)
	{
		if (get_prize_flags(PRIZE_GOOD)&GOOD_PRIZE_GODMODE)
		{
			if(get_cvar_num("amx_dice_debug") != 0)
				log_amx("DEBUG (Advanced Roll the Dice): Roll=[1], Roll2=[%d] <%s>",Roll2, User);
				
			client_print(0,print_chat, "[AMXX] <Dice Dealer>  Congratulations, %s won Godmode!", User);
			HasPrize[id][0] = PRIZE_GODMODE;
		
			if( get_cvar_num("amx_dice_statictimes") == 0)
			{
				HasPrize[id][1] = random_num(10,16);
			}
			else
			{
				HasPrize[id][1] = get_cvar_num("amx_dice_godmodetime");
			}
			
			set_user_godmode(id,1);
			set_user_rendering(id,kRenderFxGlowShell, Red,Green,Blue, kRenderNormal,16);
			emit_sound(id,CHAN_ITEM, "misc/stinger12.wav", 1.0, ATTN_NORM, 0, PITCH_NORM);
		}
		else
		{
			bIsGambling = false;
			Roll2++;
			good_prizes(id,Roll2);
				
			return PLUGIN_HANDLED;
		}
	}
	// ZEUSMODE
	else if (Roll2 == 2)
	{
		if (get_prize_flags(PRIZE_GOOD)&GOOD_PRIZE_ZEUSMODE)
		{
			if(get_cvar_num("amx_dice_debug") != 0)
				log_amx("DEBUG (Advanced Roll the Dice): Roll=[1], Roll2=[%d] <%s>",Roll2, User);
				
			client_print(0,print_chat, "[AMXX] <Dice Dealer>  Whoa, %s won ZeusMode!!", User);
			HasPrize[id][0] = PRIZE_ZEUSMODE;
			
			if( get_cvar_num("amx_dice_statictimes") == 0)
			{
				HasPrize[id][1] = random_num(10,20);
			}
			else
			{
				HasPrize[id][1] = get_cvar_num("amx_dice_zeusmodetime");
			}
			
			set_user_godmode(id,1);
			set_user_noclip(id,1);
			client_cmd(id, "cl_forwardspeed 700");
			oldspeed[id] = get_user_maxspeed(id);
			get_user_origin(id, origen, 0);
			set_user_maxspeed(id,700.0);
			set_user_rendering(id,kRenderFxGlowShell, Red,Green,Blue, kRenderNormal,16);
			emit_sound(id,CHAN_ITEM, "misc/risamalo.wav", 1.0, ATTN_NORM, 0, PITCH_NORM);
		}
		else
		{
			bIsGambling = false;
			Roll2++;
			good_prizes(id,Roll2);
			
			return PLUGIN_HANDLED;
		}
	}
	// LUKE SKYWALKER
	else if (Roll2 == 3)
	{
		if (get_prize_flags(PRIZE_GOOD)&GOOD_PRIZE_LUKESKYWALKER)
		{
			if(get_cvar_num("amx_dice_debug") != 0)
				log_amx("DEBUG (Advanced Roll the Dice): Roll=[1], Roll2=[%d] <%s>",Roll2, User);
			
			client_print(0,print_chat, "[AMXX] <Dice Dealer>  Caution! %s is now Luke Skywalker!!!", User);
			HasPrize[id][0] = PRIZE_LSABER;
			
			if( get_cvar_num("amx_dice_statictimes") == 0)
			{
				HasPrize[id][1] = random_num(10,20);
			}
			else
			{
				HasPrize[id][1] = get_cvar_num("amx_dice_lukeskywalkertime");
			}
			
			new tid[2];
			tid[0] = id;
			set_user_godmode(id,1);
			tid[1] = 1;
			set_task(0.1,"lightsaber",0,tid,2,"a",(HasPrize[id][1]*10)-10);
			emit_sound(id,CHAN_ITEM, "ambience/zapmachine.wav", 1.0, ATTN_NORM, 0, PITCH_NORM);
		}
		else
		{
			bIsGambling = false;
			Roll2++;
			good_prizes(id,Roll2);
				
			return PLUGIN_HANDLED;
		}
	}
	// WIN HEALTH
	else if (Roll2 == 4)
	{
		if (get_prize_flags(PRIZE_GOOD)&GOOD_PRIZE_WINHEALTH)
		{
			if(get_cvar_num("amx_dice_debug") != 0)
				log_amx("DEBUG (Advanced Roll the Dice): Roll=[1], Roll2=[%d] <%s>",Roll2, User);
				
			new current_health = get_user_health(id);
			new new_health = current_health+200;
			
			if (new_health > 255)
				set_user_health(id,255);
			else
				set_user_health(id,new_health);
				
			client_print(0,print_chat, "[AMXX] <Dice Dealer>  %s won and now has %d health!!!", User, get_user_health(id));
			client_cmd(0, "spk ^"fvox/beep _comma beep _comma beep _comma administering_medical^"");
			set_hudmessage(200,0,0, 0.03, 0.62, 2, 0.02, 5.0, 0.01, 0.1, 1);
			show_hudmessage(0,"%s won and now has %d health.",User, get_user_health(id));
			set_task(GAMBLING_DELAY_TIME,"delay_gambling");
		}
		else
		{
			bIsGambling = false;
			Roll2++;
			good_prizes(id,Roll2);
				
			return PLUGIN_HANDLED;
		}
	}
	// RACE CAR
	else if (Roll2 == 5)
	{
		if (get_prize_flags(PRIZE_GOOD)&GOOD_PRIZE_RACECAR)
		{
			if(get_cvar_num("amx_dice_debug") != 0)
				log_amx("DEBUG (Advanced Roll the Dice): Roll=[1], Roll2=[%d] <%s>",Roll2, User);
				
			set_user_health(id,150);
			client_print(0,print_chat, "[AMXX] <Dice Dealer>  %s has won race car mode!", User);
			HasPrize[id][0] = PRIZE_SPEED;
			
			if( get_cvar_num("amx_dice_statictimes") == 0)
			{
				HasPrize[id][1] = random_num(12,18);
			}
			else
			{
				HasPrize[id][1] = get_cvar_num("amx_dice_racecartime");
			}
				
			client_cmd(id, "cl_forwardspeed 1000");
			oldspeed[id] = get_user_maxspeed(id);
			emit_sound(id,CHAN_ITEM, "misc/bipbip.wav", 1.0, ATTN_NORM, 0, PITCH_NORM);
			set_user_maxspeed(id,1000.0);
			set_user_rendering(id,kRenderFxGlowShell, Red,Green,Blue, kRenderNormal,16);
		}
		else
		{
			bIsGambling = false;
			Roll2++;
			good_prizes(id,Roll2);
				
			return PLUGIN_HANDLED;
		}
	}
	// INVISIBLE GOD
	else if (Roll2 == 6)
	{
		if (get_prize_flags(PRIZE_GOOD)&GOOD_PRIZE_INVISIBLEGOD)
		{
			if(get_cvar_num("amx_dice_debug") != 0)
				log_amx("DEBUG (Advanced Roll the Dice): Roll=[1], Roll2=[%d] <%s>",Roll2, User);
			
			client_print(0,print_chat, "[AMXX] <Dice Dealer>  %s is the invisible GOD now!", User);
			HasPrize[id][0] = PRIZE_INVISIBLE;
			
			if( get_cvar_num("amx_dice_statictimes") == 0)
			{
				HasPrize[id][1] = random_num(12,18);
			}
			else
			{
				HasPrize[id][1] = get_cvar_num("amx_dice_invisiblegodtime");
			}
			
			invisiblegod = 1;
			client_cmd(id, "cl_forwardspeed 500");
			emit_sound(id,CHAN_ITEM, "misc/teleport_out_01.wav", 1.0, ATTN_NORM, 0, PITCH_NORM);
			oldspeed[id] = get_user_maxspeed(id);
			set_user_maxspeed(id,500.0);
			set_user_godmode(id,1);
			set_user_rendering(id,kRenderFxNone, 0,0,0, kRenderTransAdd,5);
			new tid[2];
			tid[0] = id;
			tid[1] = 1;
			set_task(0.05,"invisibility",0,tid,2,"a",(HasPrize[id][1]*10)-10);
		}
		else
		{
			bIsGambling = false;
			Roll2++;
			good_prizes(id,Roll2);
				
			return PLUGIN_HANDLED;
		}
	}
	// INVISIBLE NORMAL
	else if (Roll2 == 7)
	{
		if (get_prize_flags(PRIZE_GOOD)&GOOD_PRIZE_INVISIBLE)
		{
			if(get_cvar_num("amx_dice_debug") != 0)
				log_amx("DEBUG (Advanced Roll the Dice): Roll=[1], Roll2=[%d] <%s>",Roll2, User);
			
			client_print(0,print_chat, "[AMXX] <Dice Dealer>  %s is the invisible man now!", User);
			invisiblegod = 0;
			HasPrize[id][0] = PRIZE_INVISIBLE;
			
			if( get_cvar_num("amx_dice_statictimes") == 0)
			{
				HasPrize[id][1] = random_num(12,18);
			}
			else
			{
				HasPrize[id][1] = get_cvar_num("amx_dice_invisibletime");
			}
			
			client_cmd(id, "cl_forwardspeed 500");
			emit_sound(id,CHAN_ITEM, "misc/teleport_out_01.wav", 1.0, ATTN_NORM, 0, PITCH_NORM);
			oldspeed[id] = get_user_maxspeed(id);
			set_user_maxspeed(id,500.0);
			set_user_rendering(id,kRenderFxNone, 0,0,0, kRenderTransAdd,5);
			new tid[2];
			tid[0] = id;
			tid[1] = 1;
			set_task(0.05,"invisibility",0,tid,2,"a",(HasPrize[id][1]*10)-10);
		}
		else
		{
			bIsGambling = false;
			Roll2++;
			good_prizes(id,Roll2);
				
			return PLUGIN_HANDLED;
		}
	}
	// WIN XP
	else if (Roll2 == 8)
	{
		if (get_prize_flags(PRIZE_GOOD)&GOOD_PRIZE_WINXP)
		{
			if(get_cvar_num("amx_dice_debug") != 0)
				log_amx("DEBUG (Advanced Roll the Dice): Roll=[1], Roll2=[%d] <%s>",Roll2, User);
				
			new war3xp = get_cvar_num("Warcraft_3_XP");
			new war3ft = get_cvar_num("sv_warcraft3");
			new shero = get_cvar_num("sv_superheros");
			
			if (war3ft == 1)
			{
				new cantidadxp = (random(13)+1)*100;
				client_print(0,print_chat, "[AMXX] <Dice Dealer>  %s won %d xp",User,cantidadxp);
				server_cmd("amx_givexp ^"%s^" %d",User,cantidadxp);
				set_hudmessage(200,0,0, 0.03, 0.62, 2, 0.02, 5.0, 0.01, 0.1, 1);
				show_hudmessage(0,"Congratulations %s, you win %d XP!",User,cantidadxp);
				client_cmd(0,"spk misc/applause.wav");
				set_task(GAMBLING_DELAY_TIME,"delay_gambling");
			}
			else if(war3xp == 1)
			{
				new cantidadxp = (random(13)+1)*100;
				client_print(0,print_chat, "[AMXX] <Dice Dealer>  %s won %d xp",User,cantidadxp);
				server_cmd("wc3_givexp ^"%s^" %d",User,cantidadxp);
				set_hudmessage(200,0,0, 0.03, 0.62, 2, 0.02, 5.0, 0.01, 0.1, 1);
				show_hudmessage(0,"Congratulations %s, you win %d XP!",User,cantidadxp);
				client_cmd(0,"spk misc/applause.wav");
				set_task(GAMBLING_DELAY_TIME,"delay_gambling");
			}
			else if (shero == 1)
			{
				new cantidadxp = (random(13)+1)*100;
				client_print(0,print_chat, "[AMXX] <Dice Dealer>  %s won %d xp",User,cantidadxp);
				server_cmd("amx_shaddxp ^"%s^" %d",User,cantidadxp);
				set_hudmessage(200,0,0, 0.03, 0.62, 2, 0.02, 5.0, 0.01, 0.1, 1);
				show_hudmessage(0,"Congratulations %s, you win %d XP!",User,cantidadxp);
				client_cmd(0,"spk misc/applause.wav");
				set_task(GAMBLING_DELAY_TIME,"delay_gambling");
			}
			else if (shero == 0 && war3xp == 0 && war3ft == 0)
			{
				client_print(0,print_chat, "[AMXX] <Dice Dealer>  SuperHero/Wr3xp Not Running, Re-Rolling");
				set_hudmessage(200,0,0, 0.03, 0.62, 2, 0.02, 5.0, 0.01, 0.1, 1);
				show_hudmessage(0,"SuperHero/War3xp Not Running, Re-Rolling");
				bIsGambling = false;
				Roll2++;
				good_prizes(id,Roll2);
				
				return PLUGIN_HANDLED;
			}
		}
		else
		{
			bIsGambling = false;
			Roll2++;
			good_prizes(id,Roll2);
				
			return PLUGIN_HANDLED;
		}
	}
	// WIN MONEY
	else if (Roll2 == 9)
	{
		if (get_prize_flags(PRIZE_GOOD)&GOOD_PRIZE_WINMONEY)
		{
			if(get_cvar_num("amx_dice_debug") != 0)
				log_amx("DEBUG (Advanced Roll the Dice): Roll=[1], Roll2=[%d] <%s>",Roll2, User);
				
			new money = cs_get_user_money(id)
			new money_new = money*random(3)+1;
			cs_set_user_money(id,money_new)
			client_print(0,print_chat, "[AMXX] <Dice Dealer>  %s won and now has $%d",User, money_new);
			set_hudmessage(200,0,0, 0.03, 0.62, 2, 0.02, 5.0, 0.01, 0.1, 1);
			show_hudmessage(0,"Congratulations %s, you won $%d!",User, money_new);
			client_cmd(0,"spk misc/applause.wav");
			set_task(GAMBLING_DELAY_TIME,"delay_gambling");
		}
		else
		{
			bIsGambling = false;
			Roll2++;
			good_prizes(id,Roll2);
				
			return PLUGIN_HANDLED;
		}
	}
	// FULL EQUIPMENT
	else if (Roll2 == 10)
	{
		if (get_prize_flags(PRIZE_GOOD)&GOOD_PRIZE_FULLEQUIPMENT)
		{
			if(get_cvar_num("amx_dice_debug") != 0)
				log_amx("DEBUG (Advanced Roll the Dice): Roll=[1], Roll2=[%d] <%s>",Roll2, User);
				
			new team[32];
			get_user_team(id,team,32);
			strip_user_weapons(id);
			
			if(equal(team,"T", 1))
			{
				give_item(id,"weapon_glock18");
				give_item(id,"ammo_9mm");
				give_item(id,"ammo_9mm");
				give_item(id,"ammo_9mm");
				give_item(id,"ammo_9mm");
				give_item(id,"weapon_ak47");
				give_item(id,"ammo_762nato");
				give_item(id,"ammo_762nato");
				give_item(id,"ammo_762nato");
				give_item(id,"ammo_762nato");
			}
			else
			{
				give_item(id,"weapon_usp");
				give_item(id,"ammo_45acp");
				give_item(id,"ammo_45acp");
				give_item(id,"ammo_45acp");
				give_item(id,"ammo_45acp");
				give_item(id,"weapon_m4a1");
				give_item(id,"ammo_556nato");
				give_item(id,"ammo_556nato");
				give_item(id,"ammo_556nato");
				give_item(id,"ammo_556nato");
			}
			
			give_item(id,"weapon_knife");
			give_item(id,"weapon_smokegrenade");
			give_item(id,"weapon_flashbang");
			give_item(id,"weapon_flashbang");
			give_item(id,"weapon_hegrenade");
			give_item(id,"item_thighpack");
			give_item(id,"item_assaultsuit");
			give_item(id,"item_kevlar");
			client_print(0,print_chat, "[AMXX] <Dice Dealer>  %s got FULL EQUIPMENT!",User);
			set_hudmessage(200,0,0, 0.03, 0.62, 2, 0.02, 5.0, 0.01, 0.1, 1);
			show_hudmessage(0,"%s got FULL EQUIPMENT.",User);
			client_cmd(0, "spk ^"fvox/weapon_pickup^"");
			set_task(GAMBLING_DELAY_TIME,"delay_gambling");
		}
		else
		{
			bIsGambling = false;
			Roll2++;
			good_prizes(id,Roll2);
				
			return PLUGIN_HANDLED;
		}
	}
	// UNLIMITED AMMO
	else if (Roll2 == 11)
	{
		if (get_prize_flags(PRIZE_GOOD)&GOOD_PRIZE_UNLIMITEDAMMO)
		{
			if(get_cvar_num("amx_dice_debug") != 0)
				log_amx("DEBUG (Advanced Roll the Dice): Roll=[1], Roll2=[%d] <%s>",Roll2, User);
				
			g_Hasuammo[id] = 1;
			client_print(0,print_chat, "[AMXX] <Dice Dealer>  %s has unlimited ammo!",User);
			set_user_rendering(id,kRenderFxGlowShell, Red,Green,Blue, kRenderNormal,16);
			set_hudmessage(200,0,0, 0.03, 0.62, 2, 0.02, 5.0, 0.01, 0.1, 1);
			show_hudmessage(0,"Warning! %s has unlimited ammo.",User);
			client_cmd(0, "spk ^"alert _period got _comma ammunition _period _period run _comma over^"");
			set_task(GAMBLING_DELAY_TIME,"delay_gambling");
		}
		else
		{
			bIsGambling = false;
			Roll2++;
			good_prizes(id,Roll2);
				
			return PLUGIN_HANDLED;
		}
	}
	// PARA ACTION (RAMBO)
	else if (Roll2 == 12)
	{
		if (get_prize_flags(PRIZE_GOOD)&GOOD_PRIZE_PARAACTION)
		{
			if(get_cvar_num("amx_dice_debug") != 0)
				log_amx("DEBUG (Advanced Roll the Dice): Roll=[1], Roll2=[%d] <%s>",Roll2, User);

			strip_user_weapons(id);
			give_item(id,"weapon_m249");
			give_item(id,"ammo_556natobox");
			give_item(id,"ammo_556natobox");
			give_item(id,"ammo_556natobox");
			give_item(id,"ammo_556natobox");
			g_Hasuammo[id] = 1;

			set_user_rendering(id,kRenderFxGlowShell, Red,Green,Blue, kRenderNormal,16);
			client_print(0,print_chat, "[AMXX] <Dice Dealer>  %s got a PARA!", User);
			HasPrize[id][0] = PRIZE_PARA;
				
			if( get_cvar_num("amx_dice_statictimes") == 0)
			{
				HasPrize[id][1] = random_num(15,25);
			}
			else
			{
				HasPrize[id][1] = get_cvar_num("amx_dice_rambotime");
			}
				
			oldspeed[id] = get_user_maxspeed(id);
			client_cmd(0,"spk x/x_pain2.wav");
		}
		else
		{
			bIsGambling = false;
			random_prize(id);

			return PLUGIN_HANDLED;
		}
	}
	
	client_print(id,print_chat, "[AMXX] <Dice Dealer>  You rolled [2] [%d]", Roll2+1);
	
	LastGambleTime[id] = get_gametime();
	
	return PLUGIN_CONTINUE;
}

public dice_timer()
{
	if(get_cvar_num("amx_dice_debug") == 2)
		log_amx("DEBUG (Advanced Roll the Dice): Function dice_timer");
	
	if(bIsGambling == false)
		return PLUGIN_CONTINUE;

	new Red = random(256);
	new Green = random(256);
	new Blue = random(256);
	new Float:gt = get_gametime();
	new maxpl = get_maxplayers() +1;
	new a;
	
	for(a=1; a < maxpl; a++)
	{
		if ( (HasPrize[a][0] > 0) && ((LastGambleTime[a] + 60) < gt) )
		{			
			HasPrize[a][0] = 0;
			HasPrize[a][1] = 0;
			bIsGambling = false;
		}
	}
	
	for(a=1; a < maxpl; a++) 
	{
		if (HasPrize[a][0] > 0)
		{
			if(HasPrize[a][0] == PRIZE_TIMEBOMB)
			{
				emit_sound(a,CHAN_ITEM, "buttons/blip2.wav", 1.0, ATTN_NORM, 0, PITCH_NORM);
				new origin[3];
				get_user_origin(a,origin);

				// TE_SPRITE	
				message_begin(MSG_BROADCAST,SVC_TEMPENTITY,{0,0,0},a);
				write_byte(17);
				write_coord(origin[0]);
				write_coord(origin[1]);
				write_coord(origin[2]+20);
				write_short (sprFuselight);
				write_byte(20);
				write_byte (200);
				message_end();
				
				if (HasPrize[a][1] == 1)
				{
					times_up(a)   		
				}
				else
				{
					HasPrize[a][1] -= 1;
					new name[32];
					new team[32];
					get_user_name(a,name,32);
					get_user_team(a,team,32);
					if(equal(team,"T", 1))
					{
						set_hudmessage(200,0,0, 0.03, 0.62, 2, 0.02, 2.0, 0.01, 0.1, 1);
					}
					else
					{
						set_hudmessage(0,100,200, 0.03, 0.62, 2, 0.02, 2.0, 0.01, 0.1, 1);
					}
					show_hudmessage(0,"%s will explode in %d seconds.",name,HasPrize[a][1]);
					if (HasPrize[a][1] == 11)
					{
						client_cmd(0,"spk ^"fvox/remaining^"");
					}
					if (HasPrize[a][1] < 11)
					{
						new temp[48];
						num_to_word(HasPrize[a][1],temp,48);
						client_cmd(0,"spk ^"fvox/%s^"",temp);
					}
				}
				if(is_user_alive(a) == 0)
				{
					times_up(a);
				}
			}
			else if(HasPrize[a][0] == PRIZE_SLAP)
			{
				if (HasPrize[a][1] == 1)
				{
					times_up(a);		
				}
				else
				{
					HasPrize[a][1] -= 1;
					user_slap(a,5);
					new name[32];
					get_user_name(a,name,32);
					set_user_rendering(a,kRenderFxGlowShell, Red,Green,Blue, kRenderNormal,16);
					set_hudmessage(Red,Green,Blue, 0.03, 0.62, 2, 0.02, 2.0, 0.01, 0.1, 1);
					show_hudmessage(0,"%s has slap disease for %d seconds.",name,HasPrize[a][1]);
				}
				if(is_user_alive(a) == 0)
				{
					times_up(a);
				}
			}
			else if(HasPrize[a][0] == PRIZE_NIGHTCLUB)
			{
				if (HasPrize[a][1] == 1)
				{
					times_up(a);	
				}
				else
				{
					HasPrize[a][1] -= 1;
					new name[32];
					get_user_name(a,name,32);
					set_user_rendering(a,kRenderFxGlowShell, Red,Green,Blue, kRenderNormal,16);
					set_hudmessage(Red,Green,Blue, 0.03, 0.62, 2, 0.02, 2.0, 0.01, 0.1, 1);
					show_hudmessage(0,"%s is in the night club for %d seconds.",name,HasPrize[a][1]);
				}
				if(is_user_alive(a) == 0)
				{
					times_up(a);
				}
			}
			else if(HasPrize[a][0] == PRIZE_SLOW)
			{
				if (HasPrize[a][1] == 1)
				{
					times_up(a);
				}
				else
				{
					HasPrize[a][1] -= 1;
					new name[32];
					get_user_name(a,name,32);
					
					if(get_user_maxspeed(a) > 80)
						heart_a[a] += 1;
					
					if(heart_a[a] > 2)
						HasPrize[a][1] = 1;
					
					set_user_maxspeed(a,72.0);
					set_user_rendering(a,kRenderFxGlowShell, Red,Green,Blue, kRenderNormal,16);
					set_hudmessage(Red,Green,Blue, 0.03, 0.62, 2, 0.02, 2.0, 0.01, 0.1, 1);
					show_hudmessage(0,"%s is an old man for %d seconds.",name,HasPrize[a][1]);
				}
				if(is_user_alive(a) == 0)
				{
					times_up(a);
				}
			}
			else if(HasPrize[a][0] == PRIZE_SPEED)
			{
				if (HasPrize[a][1] == 1)
				{
					times_up(a);
				}
				else
				{
					HasPrize[a][1] -= 1;
					new name[32];
					get_user_name(a,name,32);
					set_user_maxspeed(a,1000.0);
					set_user_rendering(a,kRenderFxGlowShell, Red,Green,Blue, kRenderNormal,16);
					set_hudmessage(Red,Green,Blue, 0.03, 0.62, 2, 0.02, 2.0, 0.01, 0.1, 1);
					show_hudmessage(0,"%s is a red race for %d seconds.",name,HasPrize[a][1]);
				}
				if(is_user_alive(a) == 0)
				{
					times_up(a);
				}	
			}
			else if(HasPrize[a][0] == PRIZE_INVISIBLE)
			{
				if (HasPrize[a][1] == 1)
				{
					times_up(a);
				}
				else
				{
					HasPrize[a][1] -= 1;
					new name[32];
					get_user_name(a,name,32);
					set_user_maxspeed(a,500.0);
					set_hudmessage(Red,Green,Blue, 0.03, 0.62, 2, 0.02, 2.0, 0.01, 0.1, 1);
					
					if (invisiblegod == 1)
						show_hudmessage(0,"%s is invisible GOD for %d seconds.",name,HasPrize[a][1]);
					
					if (invisiblegod == 0)
						show_hudmessage(0,"%s is invisible for %d seconds.",name,HasPrize[a][1]);
					
					set_user_rendering(a,kRenderFxNone, 0,0,0, kRenderTransAdd,5);
				}
				if(is_user_alive(a) == 0)
				{
					times_up(a);
				}	
			}
			else if(HasPrize[a][0] == PRIZE_GODMODE)
			{
				if (HasPrize[a][1] == 1)
				{
					times_up(a);
				}
				else
				{
					HasPrize[a][1] -= 1;
					new name[32];
					get_user_name(a,name,32);
					set_user_rendering(a,kRenderFxGlowShell, Red,Green,Blue, kRenderNormal,16);
					set_hudmessage(Red,Green,Blue, 0.03, 0.62, 2, 0.02, 2.0, 0.01, 0.1, 1);
					show_hudmessage(0,"%s has godmode for %d seconds.",name,HasPrize[a][1]);
				}
				if(is_user_alive(a) == 0)
				{
					times_up(a);
				}	
			}
			else if(HasPrize[a][0] == PRIZE_NOCLIP)
			{
				if (HasPrize[a][1] == 1)
				{
					times_up(a)
				}
				else
				{
					HasPrize[a][1] -= 1;
					new name[32];
					get_user_name(a,name,32);
					set_user_rendering(a,kRenderFxGlowShell, Red,Green,Blue, kRenderNormal,16);
					set_hudmessage(Red,Green,Blue, 0.03, 0.62, 2, 0.02, 2.0, 0.01, 0.1, 1);
					show_hudmessage(0,"%s has noclip for %d seconds.",name,HasPrize[a][1]);
				}
				if(is_user_alive(a) == 0)
				{
					times_up(a);
				}
			}
			else if(HasPrize[a][0] == PRIZE_ZEUSMODE)
			{
				if (HasPrize[a][1] == 1)
				{
					times_up(a);
				}
				else
				{
					HasPrize[a][1] -= 1;
					new name[32];
					get_user_name(a,name,32);
					set_user_maxspeed(a,700.0);
					set_user_rendering(a,kRenderFxGlowShell, Red,Green,Blue, kRenderNormal,16);
					set_hudmessage(Red,Green,Blue, 0.03, 0.62, 2, 0.02, 2.0, 0.01, 0.1, 1);
					show_hudmessage(0,"%s has ZEUSMODE for %d seconds.",name,HasPrize[a][1]);
				}
				if(is_user_alive(a) == 0)
				{
					times_up(a);
				}
			}
			else if(HasPrize[a][0] == PRIZE_GRAVITY)
			{
				if (HasPrize[a][1] == 1)
				{
					times_up(a);
				}
				else
				{
					new name[32];
					get_user_name(a,name,32);
					set_user_rendering(a,kRenderFxGlowShell, Red,Green,Blue, kRenderNormal,16);
					set_hudmessage(Red,Green,Blue, 0.03, 0.62, 2, 0.02, 2.0, 0.01, 0.1, 1);
					HasPrize[a][1] -= 1;
					
					if (HasPrize[a][1] == 1)
					{
						playsoundall("ambience/fallscream.wav");
						set_user_gravity(a,30.0);
						show_hudmessage(0,"%s is being dropped.",name);	
					}
					else
					{
						if (HasPrize[a][1] == HasPrize[a][1] - 1)
							client_cmd(a,"+jump");
						
						set_user_gravity(a,-50.0);
						show_hudmessage(0,"%s will be dropped in %d seconds.",name,HasPrize[a][1]);
					}
				}
				if(is_user_alive(a) == 0)
				{
					times_up(a);
				}
			}
			else if(HasPrize[a][0] == PRIZE_LSABER)
			{
				if (HasPrize[a][1] == 1)
				{
					times_up(a);
				}
				else
				{
					HasPrize[a][1] -= 1;
					new name[32];
					get_user_name(a,name,32);
					set_hudmessage(Red,Green,Blue, 0.03, 0.62, 2, 0.02, 2.0, 0.01, 0.1, 1);
					show_hudmessage(0,"%s is Luke Skywalker for %d seconds!",name,HasPrize[a][1]);
				}
				if(is_user_alive(a) == 0)
				{
					times_up(a);
				}
			}
			else if(HasPrize[a][0] == PRIZE_DRINKING)
			{
				if (HasPrize[a][1] == 1)
				{
					times_up(a);
				}
				else
				{
					HasPrize[a][1] -= 1;
					new name[32];
					get_user_name(a,name,32);
					set_user_rendering(a,kRenderFxGlowShell, Red,Green,Blue, kRenderNormal,16);
					set_hudmessage(Red,Green,Blue, 0.03, 0.62, 2, 0.02, 2.0, 0.01, 0.1, 1);
					show_hudmessage(0,"%s is a smoking drunkard for %d seconds.",name,HasPrize[a][1]);
				}
				if(is_user_alive(a) == 0)
				{
					times_up(a);
				}
			}
			else if(HasPrize[a][0] == PRIZE_BLIND)
			{
				if(is_user_alive(a) == 0)
				{
					times_up(a);
				}
			}
			else if(HasPrize[a][0] == PRIZE_UNLIMITEDAMMO)
			{
				if(is_user_alive(a) == 0)
				{
					times_up(a);
				}
			}
			else if(HasPrize[a][0] == PRIZE_PARA)
			{
				if (HasPrize[a][1] == 1)
				{
					times_up(a);
				}
				else
				{
					HasPrize[a][1] -= 1;
					
					if( !task_exists(66) ) 
						set_task(0.3,"para_action",a,"",0,"a", 9999);
					
					new name[32];
					get_user_name(a,name,32);

					set_user_rendering(a,kRenderFxGlowShell, Red,Green,Blue, kRenderNormal,16);
					set_hudmessage(Red,Green,Blue, 0.03, 0.62, 2, 0.02, 2.0, 0.01, 0.1, 1);
					show_hudmessage(0,"%s is RAMBO for %d seconds!",name,HasPrize[a][1]);
				}
				if(is_user_alive(a) == 0)
				{
					times_up(a);
				}
			}
		}
	}
	
	return PLUGIN_CONTINUE;
}

public times_up(id)
{
	if(id < 0)
		return PLUGIN_CONTINUE;
		
	if(get_cvar_num("amx_dice_debug") == 2)
		log_amx("DEBUG (Advanced Roll the Dice): Function times_up");
	
	set_task(GAMBLING_DELAY_TIME,"delay_gambling");
	new bombguyfrags;
	new bgf_message = 0;
	new maxpl = get_maxplayers() +1;
	new t;
	new players[32], inum;
	for(t=1; t < maxpl; t++)
	{
		if (HasPrize[t][0] > 0)
		{
			if(HasPrize[t][0] == PRIZE_TIMEBOMB)
			{
				if(id == 100)
				{
					for(new a = 1; a < maxpl; a++)
					{
						if (HasPrize[a][1] > 0)
						{
							HasPrize[a][0] = 0;
							HasPrize[a][1] = 0;
							new name[32];
							get_user_name(a,name,32);
							set_hudmessage(200,255,200, 0.03, 0.62, 2, 0.02, 2.0, 0.01, 0.1, 1);
							show_hudmessage(0,"%s has exploded.",name);
    							new origin[3];
							get_user_origin(a,origin);
 							origin[2] = origin[2] - 26;
							user_kill(a,1);
							explode(origin,a);
							get_players(players,inum,"c");
							
							for(new i = 0 ;i < inum; ++i)
							{
								message_begin(MSG_ONE,g_msgShake,{0,0,0},players[i]) 
								write_short( 1<<14 );	// shake amount
								write_short( 1<<14 );	// shake lasts this long
								write_short( 1<<14 );	// shake noise frequency
								message_end();
							}
							
							//define TE_EXPLODEMODEL
							message_begin(MSG_BROADCAST,SVC_TEMPENTITY,{0,0,0},a);
							write_byte(107);	// spherical shower of models, picks from set
							write_coord(origin[0]);	// pos
							write_coord(origin[1]); 
							write_coord(origin[2]);
							write_coord(175);	//(velocity)
							write_short (mdlGibs); 	//(model index)
							write_short (25); 	// (count)
							write_byte (100); 	// (life in 0.1's)		
							message_end();
							
							wasbomb[a] = 1;
							set_user_rendering(a,kRenderFxNone, 255,255,255, kRenderNormal,16);
						}
					}
				}
				else
				{
					new name[32];
					new team[32];
					get_user_name(id,name,32);
					set_hudmessage(200,255,200, 0.03, 0.62, 2, 0.02, 2.0, 0.01, 0.1, 1);
					show_hudmessage(0,"%s has exploded.",name);
					amx_ff = get_cvar_float("mp_friendlyfire");
    					new origin[3];
	 				get_user_origin(id,origin);
					get_user_team(id, team , 32);
						
					for(new a = 1; a < maxpl; a++)
					{
						new origin1[3];
						new team1[32];
 						get_user_origin(a,origin1);
						get_user_team(a, team1 , 32);
							
						if(is_user_alive(a) != 0)
						{
							if( ! (origin[0]-origin1[0] > BOMBKILL_RANGE || origin[0]-origin1[0] < - BOMBKILL_RANGE || origin[1]-origin1[1] > BOMBKILL_RANGE || origin[1]-origin1[1] < - BOMBKILL_RANGE ||origin[2]-origin1[2] > BOMBKILL_RANGE || origin[2]-origin1[2] < - BOMBKILL_RANGE) )
							{
								if(amx_ff == 0)
								{
									if(!equal(team, team1, 1))
									{
										client_print(a,print_chat,"[AMXX] <Dice Dealer>  Sorry, the bomb killed you.");
											
										if((a != id) && (bBombCredit == true))
										{
											bombguyfrags = get_user_frags(id);
											bombguyfrags +=1;
											bgf_message +=1;
											set_user_frags(id,bombguyfrags);
										}
											
										user_kill(a,1);
										explode(origin1,a);
									}
								}
								else if(amx_ff == 1)
								{
									if(rs == false)
									{
										client_print(a,print_chat,"[AMXX] <Dice Dealer>  Sorry, the bomb killed you.");
										
										if((!equal(team, team1, 1)) && (bBombCredit == true) )
										{
											bombguyfrags = get_user_frags(id);
											bombguyfrags +=1;
											bgf_message +=1;
											set_user_frags(id,bombguyfrags);
										}
										
										if(a != id)
											explode(origin1,a);
												
										user_kill(a,1);
									}
									else
									{
										client_print(a,print_chat,"[AMXX] <Dice Dealer>  Sorry, the bomb killed you.");
											
										if(a == id)
											user_kill(a,1);	 
									}							
								}
							}
						}
					}
						
					HasPrize[id][0] = 0;
					HasPrize[id][1] = 0;
						
					if(amx_ff == 0)
					{
						client_print(id,print_chat,"[AMXX] <Dice Dealer>  Sorry, the bomb killed you.");
						user_kill(id,1);
					}
						
					if((bBombCredit == true) && (bgf_message > 0))
					{
							client_print(id,print_chat,"[AMXX] <Dice Dealer>  Your bombing was a success:  You made %d KILLS.", bgf_message);
					}
					
			 		origin[2] = origin[2] - 26;
					explode(origin,id);
					get_players(players,inum,"c");
						
					for(new i = 0 ;i < inum; ++i)
					{
						message_begin(MSG_ONE,g_msgShake,{0,0,0},players[i]);
						write_short( 1<<14 );	// shake amount
						write_short( 1<<14 );	// shake lasts this long
						write_short( 1<<14 );	// shake noise frequency
						message_end();
					}
						
					// define TE_EXPLODEMODEL
					message_begin(MSG_BROADCAST,SVC_TEMPENTITY,{0,0,0},id);
					write_byte(107); 	// spherical shower of models, picks from set
					write_coord(origin[0]);	// pos
					write_coord(origin[1]); 
					write_coord(origin[2]); 
					write_coord(175); 	//(velocity)
					write_short (mdlGibs); 	//(model index)
					write_short (25); 	// (count)
					write_byte (100); 	// (life in 0.1's)		
					message_end();
						
					wasbomb[id] = 1;
					set_user_rendering(id,kRenderFxNone, 255,255,255, kRenderNormal,16);
				}
			}
			else if(HasPrize[t][0] == PRIZE_SLAP)
			{
				if(id == 100)
				{
					for(new a = 1; a < maxpl; a++)
					{
						if (HasPrize[a][1] > 0)
						{
							HasPrize[a][0] = 0;
							HasPrize[a][1] = 0;
							set_user_rendering(a,kRenderFxNone,255,255,255, kRenderNormal,16);
						}
					}
				}
				else
				{
					new name[32];
					get_user_name(id,name,32);
					set_user_rendering(id,kRenderFxNone,255,255,255, kRenderNormal,16);
					set_hudmessage(200,255,200, 0.03, 0.62, 2, 0.02, 2.0, 0.01, 0.1, 1);
					new rand = random(4);
    					new origin[3];
	 				get_user_origin(id,origin);
						
					if(rand > 0)
					{
						show_hudmessage(0, "Slap disease has left %s.",name);
					}
					else
					{
						show_hudmessage(0, "Slap disease has killed %s!",name);
						user_kill(id,1);
			 			origin[2] = origin[2] - 26;
						explode(origin,id);
						get_players(players,inum,"c");
							
						for(new i = 0 ;i < inum; ++i)
						{
							message_begin(MSG_ONE,g_msgShake,{0,0,0},players[i]);
							write_short( 1<<14 );	// shake amount
							write_short( 1<<14 );	// shake lasts this long
							write_short( 1<<14 );	// shake noise frequency
							message_end();
						}
							
						// define TE_EXPLODEMODEL
						message_begin(MSG_BROADCAST,SVC_TEMPENTITY,{0,0,0},id);
						write_byte(107); 		// spherical shower of models, picks from set
						write_coord(origin[0]); 	// pos
						write_coord(origin[1]); 
						write_coord(origin[2] +26);
						write_coord(175); 		//(velocity)
						write_short(mdlGibs); 		//(model index)
						write_short(25); 		// (count)
						write_byte (100); 		// (life in 0.1's)		
						message_end();
							
						wasbomb[id] = 1;
						set_user_rendering(id,kRenderFxNone, 255,255,255, kRenderNormal,16);
					}
						
					HasPrize[id][0] = 0;
					HasPrize[id][1] = 0;
				}
			}
			else if(HasPrize[t][0] == PRIZE_NIGHTCLUB)
			{
				if(id == 100)
				{
					for(new a = 1; a < maxpl; a++)
					{
						if (HasPrize[a][1] > 0)
						{
							HasPrize[a][0] = 0;
							HasPrize[a][1] = 0;
							set_user_rendering(a,kRenderFxNone,255,255,255, kRenderNormal,16);
						}
					}
				}
				else
				{
					new name[32];
					get_user_name(id,name,32);
					set_user_rendering(id,kRenderFxNone,255,255,255, kRenderNormal,16);
					set_hudmessage(200,255,200, 0.03, 0.62, 2, 0.02, 2.0, 0.01, 0.1, 1);
					new rand = random(3);
					client_cmd(id, "cl_forwardspeed 400");
    					new origin[3];
	 				get_user_origin(id,origin);
						
					if(rand > 0)
					{
						show_hudmessage(0, "%s left the night club.",name);
					}
					else
					{
						show_hudmessage(0, "Drugs can kill you %s!",name);
						user_kill(id,1);
						set_user_frags(id,(get_user_frags(id)-1));
			 			origin[2] = origin[2] - 26;
						explode(origin,id);
						get_players(players,inum,"c");
							
						for(new i = 0 ;i < inum; ++i)
						{
							message_begin(MSG_ONE,g_msgShake,{0,0,0},players[i]);
							write_short( 1<<14 );	// shake amount
							write_short( 1<<14 );	// shake lasts this long
							write_short( 1<<14 );	// shake noise frequency
							message_end();
						}
							
						// define TE_EXPLODEMODEL
						message_begin(MSG_BROADCAST,SVC_TEMPENTITY,{0,0,0},id);
						write_byte(107); 		// spherical shower of models, picks from set
						write_coord(origin[0]); 	// pos
						write_coord(origin[1]); 
						write_coord(origin[2] + 26); 
						write_coord(175); 		//(velocity)
						write_short(mdlGibs); 		//(model index)
						write_short(25); 		// (count)
						write_byte (100); 		// (life in 0.1's)		
						message_end();
							
						wasbomb[id] = 1;
						set_user_rendering(id,kRenderFxNone, 255,255,255, kRenderNormal,16);
					}
						
					HasPrize[id][0] = 0;
					HasPrize[id][1] = 0;
				}
			}
			else if(HasPrize[t][0] == PRIZE_SLOW)
			{
				if(id == 100)
				{
					for(new a = 1; a < maxpl; a++)
					{
						if (HasPrize[a][1] > 0)
						{
							HasPrize[a][0] = 0;
							HasPrize[a][1] = 0;
							set_user_maxspeed(a,oldspeed[a]);
							set_user_rendering(a,kRenderFxNone,255,255,255, kRenderNormal,16);
						}
					}
				}
				else
				{
					new name[32];
					get_user_name(id,name,32);
					set_user_maxspeed(id,oldspeed[id]);
					set_user_rendering(id,kRenderFxNone,255,255,255, kRenderNormal,16);
					set_hudmessage(200,255,200, 0.03, 0.62, 2, 0.02, 2.0, 0.01, 0.1, 1);
						
					if(heart_a[id] > 2)
					{
						user_kill(id,1);
						show_hudmessage(0, "%s was old and died of a heart attack.",name);

					}
					else
					{			
						show_hudmessage(0, "%s is no longer an old man.",name);
					}
						
					heart_a[id] = 0;
					HasPrize[id][0] = 0;
					HasPrize[id][1] = 0;
				}
			}
			else if(HasPrize[t][0] == PRIZE_SPEED)
			{
				if(id == 100)
				{
					for(new a = 1; a < maxpl; a++)
					{
						if (HasPrize[a][1] > 0)
						{
							HasPrize[a][0] = 0;
							HasPrize[a][1] = 0;
							client_cmd(a, "cl_forwardspeed 400");
							set_user_maxspeed(a,oldspeed[a]);
							set_user_rendering(a,kRenderFxNone,255,255,255, kRenderNormal,16);
						}
					}
				}
				else
				{
					new name[32];
					get_user_name(id,name,32);
					client_cmd(id, "cl_forwardspeed 400");
					set_user_maxspeed(id,oldspeed[id]);
					set_user_rendering(id,kRenderFxNone,255,255,255, kRenderNormal,16);
					set_hudmessage(200,255,200, 0.03, 0.62, 2, 0.02, 2.0, 0.01, 0.1, 1);
					show_hudmessage(0, "%s is out of gas.",name);
					HasPrize[id][0] = 0;
					HasPrize[id][1] = 0;
				}
			}
			else if(HasPrize[t][0] == PRIZE_INVISIBLE)
			{
				if(id == 100)
				{
					for(new a = 1; a < maxpl; a++)
					{
						if (HasPrize[a][1] > 0)
						{
							HasPrize[a][0] = 0;
							HasPrize[a][1] = 0;
							client_cmd(a, "cl_forwardspeed 400");
							set_user_maxspeed(a,oldspeed[a]);
							set_user_godmode(a);
							set_user_rendering(a,kRenderFxNone,255,255,255, kRenderNormal,16);
						}
					}
				}
				else
				{
					new name[32];
					get_user_name(id,name,32);
					client_cmd(id, "cl_forwardspeed 400");
					set_user_maxspeed(id,oldspeed[id]);
					set_user_godmode(id);
					set_user_rendering(id,kRenderFxNone,255,255,255, kRenderNormal,16);
					set_hudmessage(200,255,200, 0.03, 0.62, 2, 0.02, 2.0, 0.01, 0.1, 1);
					show_hudmessage(0, "%s is no longer invisible.",name);
					HasPrize[id][0] = 0;
					HasPrize[id][1] = 0;
				}
			}
			else if(HasPrize[t][0] == PRIZE_GODMODE)
			{
				if(id == 100)
				{
					for(new a = 1; a < maxpl; a++)
					{
						if (HasPrize[a][1] > 0)
						{
							HasPrize[a][0] = 0;
							HasPrize[a][1] = 0;
							set_user_godmode(a);
							set_user_rendering(a,kRenderFxNone,255,255,255, kRenderNormal,16);
						}
					}
				}
				else
				{
					new name[32];
					get_user_name(id,name,32);
					set_user_godmode(id);
					set_user_rendering(id,kRenderFxNone,255,255,255, kRenderNormal,16);
					set_hudmessage(200,255,200, 0.03, 0.62, 2, 0.02, 2.0, 0.01, 0.1, 1);
					show_hudmessage(0, "%s no longer has godmode.",name);
					HasPrize[id][0] = 0;
					HasPrize[id][1] = 0;
				}
			}
			else if(HasPrize[t][0] == PRIZE_NOCLIP)
			{
				if(id == 100)
				{
					for(new a = 1; a < maxpl; a++)
					{
						if (HasPrize[a][1] > 0)
						{
							HasPrize[a][0] = 0;
							HasPrize[a][1] = 0;
							set_user_noclip(a);
							set_user_rendering(a,kRenderFxNone,255,255,255, kRenderNormal,16);
						}
					}
				}
				else
				{
					new name[32];
					get_user_name(id,name,32);
					set_user_noclip(id);
					set_user_rendering(id,kRenderFxNone,255,255,255, kRenderNormal,16);
						
					if (is_user_alive(id))
						positionChangeTimer(id, 0.1 );
						
					HasPrize[id][0] = 0;
					HasPrize[id][1] = 0;
				}
			}
			else if(HasPrize[t][0] == PRIZE_ZEUSMODE)
			{
				if(id == 100)
				{
					for(new a = 1; a < maxpl; a++)
					{
						if (HasPrize[a][1] > 0)
						{
							HasPrize[a][0] = 0;
							HasPrize[a][1] = 0;
							client_cmd(a, "cl_forwardspeed 400");
							set_user_godmode(a);
							set_user_noclip(a);
							set_user_maxspeed(a,oldspeed[a]);
							set_user_rendering(a,kRenderFxNone,255,255,255, kRenderNormal,16);
						}
					}
				}
				else
				{
					new name[32];
					get_user_name(id,name,32);
					set_user_godmode(id);
					set_user_noclip(id);
					client_cmd(id, "cl_forwardspeed 400");
					set_user_maxspeed(id,oldspeed[id]);
					set_user_rendering(id,kRenderFxNone,255,255,255, kRenderNormal,16);
					set_hudmessage(200,255,200, 0.03, 0.62, 2, 0.02, 2.0, 0.01, 0.1, 1);
						
					if (is_user_alive(id))
						positionTimer2(id, 0.1);
					
					show_hudmessage(0, "%s no longer has ZEUSMODE.",name);
					HasPrize[id][0] = 0;
					HasPrize[id][1] = 0;
				}
			}
			else if(HasPrize[t][0] == PRIZE_GRAVITY)
			{
				if(id == 100)
				{
					for(new a = 1; a < maxpl; a++)
					{
						if (HasPrize[a][1] > 0)
						{
							client_cmd(a,"-jump");
							HasPrize[a][0] = 0;
							HasPrize[a][1] = 0;
							set_user_gravity(a,1.0);
							set_user_rendering(a,kRenderFxNone,255,255,255, kRenderNormal,16);
	    						new origin[3];
		 					get_user_origin(a,origin);
			 				origin[2] = origin[2] - 26;
							explode(origin,id);
							get_players(players,inum,"c");
							
							for(new i = 0 ;i < inum; ++i)
							{
								message_begin(MSG_ONE,g_msgShake,{0,0,0},players[i]);
								write_short( 1<<14 );	// shake amount
								write_short( 1<<14 );	// shake lasts this long
								write_short( 1<<14 );	// shake noise frequency
								message_end();
							}
							
							// define TE_EXPLODEMODEL
							message_begin(MSG_BROADCAST,SVC_TEMPENTITY,{0,0,0},a);
							write_byte(107); 		// spherical shower of models, picks from set
							write_coord(origin[0]); 	// pos
							write_coord(origin[1]);
							write_coord(origin[2]);
							write_coord(175); 		//(velocity)
							write_short(mdlGibs); 		//(model index)
							write_short(25); 		// (count)
							write_byte (100); 		// (life in 0.1's)		
							message_end();
							
							wasbomb[a] = 1;
							set_user_rendering(a,kRenderFxNone, 255,255,255, kRenderNormal,16);
						}
					}
				}
				else
				{
					new name[32];
					get_user_name(id,name,32);
					client_cmd(id,"-jump");
					set_user_gravity(id,1.0);
					set_user_rendering(id,kRenderFxNone,255,255,255, kRenderNormal,16);
					set_hudmessage(200,255,200, 0.03, 0.62, 2, 0.02, 2.0, 0.01, 0.1, 1);
					show_hudmessage(0, "%s died of a terrible fall.",name);
					user_kill(id,1);
	    				new origin[3];
		 			get_user_origin(id,origin);
			 		origin[2] = origin[2] - 26;
					explode(origin,id);
					get_players(players,inum,"c");
						
					for(new i = 0 ;i < inum; ++i)
					{
						message_begin(MSG_ONE,g_msgShake,{0,0,0},players[i]);
						write_short( 1<<14 );	// shake amount
						write_short( 1<<14 );	// shake lasts this long
						write_short( 1<<14 );	// shake noise frequency
						message_end();
					}
						
					HasPrize[id][0] = 0;
					HasPrize[id][1] = 0;

					// define TE_EXPLODEMODEL
					message_begin(MSG_BROADCAST,SVC_TEMPENTITY,{0,0,0},id);
					write_byte(107); 	// spherical shower of models, picks from set
					write_coord(origin[0]); // pos
					write_coord(origin[1]); 
					write_coord(origin[2]); 
					write_coord(175); 	//(velocity)
					write_short(mdlGibs); 	//(model index)
					write_short(25); 	// (count)
					write_byte (100); 	// (life in 0.1's)		
					message_end();
						
					wasbomb[id] = 1;
					set_user_rendering(id,kRenderFxNone, 255,255,255, kRenderNormal,16);
				}
			}
			else if(HasPrize[t][0] == PRIZE_LSABER)
			{
				if(id == 100)
				{
					for(new a = 1; a < maxpl; a++)
					{
						if (HasPrize[a][1] > 0)
						{
							HasPrize[a][0] = 0;
							HasPrize[a][1] = 0;
							set_user_rendering(a,kRenderFxNone,255,255,255, kRenderNormal,16);
						}
					}
				}
				else
				{
					new name[32];
					get_user_name(id,name,32);
					set_user_godmode(id);
					emit_sound(id,CHAN_ITEM, "vox/_period.wav", 1.0, ATTN_NORM, 0, PITCH_NORM);
					set_hudmessage(200,255,200, 0.03, 0.62, 2, 0.02, 2.0, 0.01, 0.1, 1);
					set_user_rendering(id,kRenderFxNone,255,255,255, kRenderNormal,16);
					show_hudmessage(0, "%s isnt Luke Skywalker now.",name);
					HasPrize[id][0] = 0;
					HasPrize[id][1] = 0;
				}
			}
			else if(HasPrize[t][0] == PRIZE_DRINKING)
			{
				if(id == 100)
				{
					for(new a = 1; a < maxpl; a++)
					{
						if (HasPrize[a][1] > 0)
						{
							HasPrize[a][0] = 0;
							HasPrize[a][1] = 0;
							set_user_rendering(a,kRenderFxNone,255,255,255, kRenderNormal,16);
						}
					}
				}
				else
				{
					new name[32];
					get_user_name(id,name,32);
					set_user_godmode(id);
					set_user_rendering(id,kRenderFxNone,255,255,255, kRenderNormal,16);
					set_hudmessage(200,255,200, 0.03, 0.62, 2, 0.02, 2.0, 0.01, 0.1, 1);
					show_hudmessage(0, "%s sobered up and kicked his dirty habit.",name);
					HasPrize[id][0] = 0;
					HasPrize[id][1] = 0;
				}
			}
			else if(HasPrize[t][0] == PRIZE_BLIND)
			{
				if(id == 100)
				{
					for(new a = 1; a < maxpl; a++)
					{
						if (HasPrize[a][1] > 0)
						{
							player_unblind(a);
							HasPrize[a][0] = 0;
							HasPrize[a][1] = 0;
							set_user_rendering(a,kRenderFxNone,255,255,255, kRenderNormal,16);
						}	
					}
				}
				else
				{
					player_unblind(id);
					HasPrize[id][0] = 0;
					HasPrize[id][1] = 0;
					set_user_rendering(id,kRenderFxNone,255,255,255, kRenderNormal,16);
				}
			}
			else if(HasPrize[t][0] == PRIZE_UNLIMITEDAMMO)
			{
				if(id == 100)
				{
					for(new a = 1; a < maxpl; a++)
					{
						g_Hasuammo[a] = 0;
						HasPrize[a][0] = 0;
						HasPrize[a][1] = 0;
						set_user_rendering(a,kRenderFxNone,255,255,255, kRenderNormal,16);	
					}
				}
			}
			else if(HasPrize[t][0] == PRIZE_PARA)
			{
				if(id == 100)
				{
					for(new a = 1; a < maxpl; a++)
					{
						if (HasPrize[a][1] > 0)
						{
							g_Hasuammo[a] = 0;
							HasPrize[a][0] = 0;
							HasPrize[a][1] = 0;
							set_user_rendering(a,kRenderFxNone,255,255,255, kRenderNormal,16);
						}	
					}
				}
				else
				{
					new name[32];
					get_user_name(id,name,32);
					set_user_rendering(id,kRenderFxNone,255,255,255, kRenderNormal,16);
					set_hudmessage(200,255,200, 0.03, 0.62, 2, 0.02, 2.0, 0.01, 0.1, 1);
					show_hudmessage(0, "%s is no longer RAMBO.",name);
					set_user_maxspeed(id,oldspeed[id]);
					remove_task(id);
						
					new team[32];
					get_user_team(id,team,32);
			
					if(equal(team,"T", 1))
					{
						give_item(id,"weapon_glock18");
						give_item(id,"ammo_9mm");
						give_item(id,"ammo_9mm");
						give_item(id,"ammo_9mm");
						give_item(id,"ammo_9mm");
					}
					else
					{
						give_item(id,"weapon_usp");
						give_item(id,"ammo_45acp");
						give_item(id,"ammo_45acp");
						give_item(id,"ammo_45acp");
						give_item(id,"ammo_45acp");
					}
						
					give_item(id,"weapon_knife");
					HasPrize[id][0] = 0;
					HasPrize[id][1] = 0;
					g_Hasuammo[id] = 0;
				}	
			}
		}
	}
	
	return PLUGIN_CONTINUE;
}

explode(vec1[3],id)
{
	if(get_cvar_num("amx_dice_debug") == 2)
		log_amx("DEBUG (Advanced Roll the Dice): Function explode");
				
	// blast circles 
	message_begin( MSG_BROADCAST,SVC_TEMPENTITY,vec1);
	write_byte( 21 );
	write_coord(vec1[0]);
	write_coord(vec1[1]);
	write_coord(vec1[2] + 16);
	write_coord(vec1[0]);
	write_coord(vec1[1]);
	write_coord(vec1[2] + 1936);
	write_short( sprWhite );
	write_byte( 0 ); 	// startframe 
	write_byte( 0 ); 	// framerate 
	write_byte( 3 ); 	// life 2
	write_byte( 20 ); 	// width 16 
	write_byte( 0 ); 	// noise 
	write_byte( 188 ); 	// r 
	write_byte( 220 ); 	// g 
	write_byte( 255 ); 	// b 
	write_byte( 255 ); 	// brightness 
	write_byte( 0 ); 	// speed 
	message_end(); 
    
	// Explosion2 
	message_begin( MSG_BROADCAST,SVC_TEMPENTITY);
	write_byte( 12 );
	write_coord(vec1[0]);
	write_coord(vec1[1]);
	write_coord(vec1[2]);
	write_byte( 188 ); 	// byte (scale in 0.1's) 188 
	write_byte( 10 ); 	// byte (framerate) 
	message_end();

	// TE_Explosion 
	message_begin( MSG_BROADCAST,SVC_TEMPENTITY,vec1);
	write_byte( 3 );
	write_coord(vec1[0]);
	write_coord(vec1[1]);
	write_coord(vec1[2]);
	write_short( sprFire );
	write_byte( 65 ); 	// byte (scale in 0.1's) 188 
	write_byte( 10 ); 	// byte (framerate) 
	write_byte( 0 ); 	// byte flags 
	message_end();

	// TE_KILLPLAYERATTACHMENTS
	message_begin(MSG_BROADCAST,SVC_TEMPENTITY,{0,0,0},id);
	write_byte( 125 ); 	// will expire all TENTS attached to a player.
	write_byte( id ); 	// byte (entity index of player)
	message_end()

	// Smoke 
	message_begin( MSG_BROADCAST,SVC_TEMPENTITY,vec1);
	write_byte( 5 );
	write_coord(vec1[0]);
	write_coord(vec1[1]);
	write_coord(vec1[2]);
	write_short( sprSmoke );
	write_byte( 50 );
	write_byte( 10 );
	message_end();
}

player_attachment(id)
{
	if(get_cvar_num("amx_dice_debug") == 2)
		log_amx("DEBUG (Advanced Roll the Dice): Function player_attachment");
		
	new att_life = (HasPrize[id][1] * 10) + 20;
	
	if(att_life > 255 || att_life < 1)
		att_life = 255;
		
	// TE_PLAYERATTACHMENT
	message_begin(MSG_BROADCAST,SVC_TEMPENTITY,{0,0,0},id);
	write_byte ( 124 ); 		// attaches a TENT to a player (this is a high-priority tent)
	write_byte ( id );  		// (entity index of player) 
	write_coord ( 7 );  		// ( attachment origin.z = player origin.z + vertical offset )
	write_short ( mdlC4bomb ); 		// model index
	write_short ( att_life );     	// (life * 10 )
	message_end();
}

lightning(vec1[3],vec2[3])
{
	if(get_cvar_num("amx_dice_debug") == 2)
		log_amx("DEBUG (Advanced Roll the Dice): Function lightning");
		
	// Lightning		
	message_begin( MSG_BROADCAST,SVC_TEMPENTITY);
	write_byte( 0 );
	write_coord(vec1[0]);
	write_coord(vec1[1]);
	write_coord(vec1[2]);
	write_coord(vec2[0]);
	write_coord(vec2[1]);
	write_coord(vec2[2]);
	write_short( sprLightning );
	write_byte( 1 ); 	// framestart 
	write_byte( 5 ); 	// framerate 
	write_byte( 2 ); 	// life 
	write_byte( 20 ); 	// width 
	write_byte( 30 ); 	// noise 
	write_byte( 200 ); 	// r, g, b 
	write_byte( 200 ); 	// r, g, b 
	write_byte( 200 ); 	// r, g, b 
	write_byte( 200 ); 	// brightness 
	write_byte( 200 ); 	// speed 
	message_end();
    
	// Sparks 
	message_begin( MSG_PVS, SVC_TEMPENTITY,vec2);
	write_byte( 9 );
	write_coord( vec2[0] );
	write_coord( vec2[1] );
	write_coord( vec2[2] );
	message_end();
    
	// Smoke      
	message_begin( MSG_BROADCAST,SVC_TEMPENTITY,vec2);
	write_byte( 5 );
	write_coord(vec2[0]);
	write_coord(vec2[1]);
	write_coord(vec2[2]);
	write_short( sprSmoke );
	write_byte( 10 );
	write_byte( 10 );
	message_end();
} 

// chickengun
public mod_spawn(id)
{
	if(get_cvar_num("amx_dice_debug") == 2)
		log_amx("DEBUG (Advanced Roll the Dice): Function mod_spawn");
				
	new csid[1];
	csid[0] = id;
	set_task(0.3,"make_mod",1316,csid,1,"a",100);
	
	return PLUGIN_HANDLED;
}

// crabgun
public mod_spawn2(id)
{
	if(get_cvar_num("amx_dice_debug") == 2)
		log_amx("DEBUG (Advanced Roll the Dice): Function mod_spawn2");
	
	new csid[1];
	csid[0] = id;
	
	if(get_cvar_num("amx_dice_monstermod") == 1)
		set_task(2.0,"mod_spawn3",1316,csid,1,"a",10);
	else
		set_task(0.3,"make_mod2",1316,csid,1,"a",50);
	
	return PLUGIN_HANDLED;
}

public mod_spawn3(id[])
{
	if(get_cvar_num("amx_dice_debug") == 2)
		log_amx("DEBUG (Advanced Roll the Dice): Function mod_spawn3");
				
	server_cmd("monster snark #%i",id[0]);
}

public sqrt(num)
{
	if(get_cvar_num("amx_dice_debug") == 2)
		log_amx("DEBUG (Advanced Roll the Dice): Function sqrt");
		
	new div = num;
	new result = 1;
	
	while (div > result)			// end when div == result, or just below 
	{
		div = (div + result) / 2;	// take mean value as new divisor 
		result = num / div;
	}
	
	return div;
}

public make_mod(id[])
{			
	if(is_user_alive(id[0]) != 0)
	{
		if(get_cvar_num("amx_dice_debug") == 2)
			log_amx("DEBUG (Advanced Roll the Dice): Function make_mod");
		
		new vec[3];
		new aimvec[3];
		new velocityvec[3];
		new length;
		new speed = 800;
		get_user_origin(id[0],vec);
		get_user_origin(id[0],aimvec,2);
	
		velocityvec[0]=aimvec[0]-vec[0];
		velocityvec[1]=aimvec[1]-vec[1];
		velocityvec[2]=aimvec[2]-vec[2];
	
		length=sqrt(velocityvec[0]*velocityvec[0]+velocityvec[1]*velocityvec[1]+velocityvec[2]*velocityvec[2]);
	
		velocityvec[0]=velocityvec[0]*speed/length;
		velocityvec[1]=velocityvec[1]*speed/length;
		velocityvec[2]=velocityvec[2]*speed/length;
	
		// TE_MODEL from HL-SDK common/const.h 
		message_begin(MSG_BROADCAST,SVC_TEMPENTITY);
		write_byte(106); 		// TE_MODEL index
		write_coord(vec[0]); 		// location coords
		write_coord(vec[1]);
		write_coord(vec[2]+20);
		write_coord(velocityvec[0]); 	// speed coords - stupid, but thats how its done
		write_coord(velocityvec[1]);
		write_coord(velocityvec[2]+100);
		write_angle (0); 		// yaw
		write_short (mdlChicken); 	// model 
		write_byte (2); 			// sound
		write_byte (255); 		// duration 
		message_end();
	}
} 

public make_mod2(id[])
{			
	if(is_user_alive(id[0]) != 0)
	{
		if(get_cvar_num("amx_dice_debug") == 2)
			log_amx("DEBUG (Advanced Roll the Dice): Function make_mod2");
		
		new vec[3];
		new aimvec[3];
		new velocityvec[3];
		new length;
		new speed = 800;
		get_user_origin(id[0],vec);
		get_user_origin(id[0],aimvec,2);
	
		velocityvec[0]=aimvec[0]-vec[0];
		velocityvec[1]=aimvec[1]-vec[1];
		velocityvec[2]=aimvec[2]-vec[2];
	
		length=sqrt(velocityvec[0]*velocityvec[0]+velocityvec[1]*velocityvec[1]+velocityvec[2]*velocityvec[2]);
	
		velocityvec[0]=velocityvec[0]*speed/length;
		velocityvec[1]=velocityvec[1]*speed/length;
		velocityvec[2]=velocityvec[2]*speed/length;
	
		// TE_MODEL from HL-SDK common/const.h 
		message_begin(MSG_BROADCAST,SVC_TEMPENTITY);
		write_byte(106); 		// TE_MODEL index
		write_coord(vec[0]); 		// location coords
		write_coord(vec[1]);
		write_coord(vec[2]+20);
		write_coord(velocityvec[0]); 	// speed coords - stupid, but thats how its done
		write_coord(velocityvec[1]);
		write_coord(velocityvec[2]+100);
		write_angle (0); 		// yaw
		write_short (mdlCrabs); 		// model 
		write_byte (2); 			// sound
		write_byte (255); 		// duration 
		message_end();
	}
}

public lightsaber(id[])
{			
	if( (is_user_alive(id[0]) == 0) || (HasPrize[id[0]][0] != PRIZE_LSABER) )
		return PLUGIN_CONTINUE;
		
	if(get_cvar_num("amx_dice_debug") == 2)
		log_amx("DEBUG (Advanced Roll the Dice): Function lightsaber");
		
	new vec[3];
	new aimvec[3];
	new lseffvec[3];
	new length;
	new speed = 65;
	get_user_origin(id[0],vec,1);
	get_user_origin(id[0],aimvec,2);
	lseffvec[0]=aimvec[0]-vec[0];
	lseffvec[1]=aimvec[1]-vec[1];
	lseffvec[2]=aimvec[2]-vec[2];
	length=sqrt(lseffvec[0]*lseffvec[0]+lseffvec[1]*lseffvec[1]+lseffvec[2]*lseffvec[2]);
	lseffvec[0]=lseffvec[0]*speed/length;
	lseffvec[1]=lseffvec[1]*speed/length;
	lseffvec[2]=lseffvec[2]*speed/length;

	new vorigin[3];
	new maxpl = get_maxplayers() +1;
	new teama[32],teamv[32];
	get_user_team(id[0],teama,31);
	
	for(new a = 1; a < maxpl; a++)
	{			
		if(is_user_alive(a) != 0)
		{
			get_user_origin(a,vorigin);
			if (get_distance(vec,vorigin)<100)
			{				
				if(a != id[0])
				{
					get_user_team(a,teamv,31);
					if(!equal(teama,teamv,2))
					{
						if(id[1] != 0)
						{
							kill_player(a,id[0]);
							
							client_print(a,print_chat,"[AMXX] Oooh Yeeah!! Cmon Rocco! CMON!!!!! uuuhhh.");
							
							new gemido = random_num(0,3);
							
							if (gemido == 0)
							{
								emit_sound(a,CHAN_VOICE, "misc/gemido01.wav", VOL_NORM, ATTN_NORM, 0, PITCH_NORM);
							}
							else if (gemido == 1)
							{
								emit_sound(a,CHAN_VOICE, "misc/gemido02.wav", VOL_NORM, ATTN_NORM, 0, PITCH_NORM);
							}
							else if (gemido == 2)
							{
								emit_sound(a,CHAN_VOICE, "misc/gemido03.wav", VOL_NORM, ATTN_NORM, 0, PITCH_NORM);
							}
							else if (gemido == 3)
							{
								emit_sound(a,CHAN_VOICE, "misc/gemido04.wav", VOL_NORM, ATTN_NORM, 0, PITCH_NORM);
							}
						}
					}
					else if(id[1] == 2)
					{
						kill_player(a,id[0]);
						
						client_print(a,print_chat,"[AMXX] Oooh Yeeah!! Cmon Rocco! CMON!!!!! uuuhhh.");
						
						new gemido = random_num(0,3);
						
						if (gemido == 0)
						{
							emit_sound(a,CHAN_VOICE, "misc/gemido01.wav", VOL_NORM, ATTN_NORM, 0, PITCH_NORM);
						}
						else if (gemido == 1)
						{
							emit_sound(a,CHAN_VOICE, "misc/gemido02.wav", VOL_NORM, ATTN_NORM, 0, PITCH_NORM);
						}
						else if (gemido == 2)
						{
							emit_sound(a,CHAN_VOICE, "misc/gemido03.wav", VOL_NORM, ATTN_NORM, 0, PITCH_NORM);
						}
						else if (gemido == 3)
						{
							emit_sound(a,CHAN_VOICE, "misc/gemido04.wav", VOL_NORM, ATTN_NORM, 0, PITCH_NORM);
						}
					}						
				}						
			}
		}
	}

	// beam effect between point and entity
	message_begin( MSG_BROADCAST,SVC_TEMPENTITY);
	write_byte ( 1 );     			//TE_BEAMENTPOINT 1  
	write_short (id[0]);     		// ent 
	write_coord (lseffvec[0]+vec[0]);	//end position 
	write_coord (lseffvec[1]+vec[1]);
	write_coord (lseffvec[2]+vec[2]+10);
	write_short (sprSaber);  		// sprite 
	write_byte (0);       			// start frame 
	write_byte (15);      			// frame rate in 0.1's 
	write_byte (1);     			// byte (life in 0.1's 
	write_byte (20);      			// line width in 0.1's
	write_byte (5);      			// noise amplitude in 0.01's 
	write_byte (0);       			// RGB color
	write_byte (255);
	write_byte (0);
	write_byte (255);     			// brightness
	write_byte (10);      			// scroll speed in 0.1's
	message_end();
	
	return PLUGIN_CONTINUE;
}

public smokin_1(id[])
{
	if( (is_user_alive(id[0])) && (HasPrize[id[0]][0] == PRIZE_DRINKING) )
	{	
		if(get_cvar_num("amx_dice_debug") == 2)
			log_amx("DEBUG (Advanced Roll the Dice): Function smokin_1");
		
		new vec[3], cmd[16];
		new a,b, y1,dfov,x1;
		
		x1 = random_num(-40,40);
		y1 = random_num(-40,40);
		dcounter[id[0]] += 1;
		get_user_origin(id[0],vec);
		
		//Smoke    
		message_begin( MSG_BROADCAST,SVC_TEMPENTITY);
		write_byte( 5 );
		write_coord(vec[0]+x1);
		write_coord(vec[1]+y1);
		write_coord(vec[2]+30);
		write_short( sprSmoke );
		write_byte( 30 );
		write_byte( 10 );
		message_end();
		
		dfov = random_num(10,120);
		format(cmd,15,"default_fov %d",dfov);		
		client_cmd(id[0],cmd);
		
		if(moved[id[0]] == 1)
		{
			client_cmd(id[0],"-moveleft;-moveright;-forward;-back");
			moved[id[0]] = 0;
		}
		
		b = random_num(0,9);
		
		if(b == 1)
		{
			emit_sound(id[0],CHAN_ITEM, "misc/burp.wav", 1.0, ATTN_NORM, 0, PITCH_NORM);
			a = random_num(0,3);			
			client_cmd(id[0],moves[a]);
			moved[id[0]] = 1;
			new aimvec[3];
			new velocityvec[3];
			new length; 
			new speed = 500;
			get_user_origin(id[0],aimvec,2);
			velocityvec[0]=aimvec[0]-vec[0];
			velocityvec[1]=aimvec[1]-vec[1];
			velocityvec[2]=aimvec[2]-vec[2];
			length=sqrt(velocityvec[0]*velocityvec[0]+velocityvec[1]*velocityvec[1]+velocityvec[2]*velocityvec[2]);
			velocityvec[0]=velocityvec[0]*speed/length;
			velocityvec[1]=velocityvec[1]*speed/length;
			velocityvec[2]=velocityvec[2]*speed/length;
			
			// TE_MODEL from HL-SDK common/const.h 
			message_begin(MSG_BROADCAST,SVC_TEMPENTITY);
			write_byte(106);
			write_coord(vec[0]);
			write_coord(vec[1]);
			write_coord(vec[2]+20);
			write_coord(velocityvec[0]);
			write_coord(velocityvec[1]);
			write_coord(velocityvec[2]+100);
			write_angle (0);
			if(random(8) == 4)
				write_short (mdlWbottle);
			else 
				write_short (mdlWcan);
			write_byte (2);
			write_byte (255);
			message_end();
		}
	}
	
	if( (dcounter[id[0]] >= HasPrize[id[0]][1]*2) || (HasPrize[id[0]][0] != PRIZE_DRINKING) )
	{
		if(moved[id[0]] == 1)
			client_cmd(id[0],"-moveleft;-moveright;-forward;-back");

		client_cmd(id[0],"default_fov 90");
	}
	
	return PLUGIN_CONTINUE;
}

public ignite_effects(skIndex[])
{		
	new kIndex = skIndex[0];
		
	if (is_user_alive(kIndex) && onfire[kIndex] )
	{
		if(get_cvar_num("amx_dice_debug") == 2)
			log_amx("DEBUG (Advanced Roll the Dice): Function ignite effects");
		
		new korigin[3];
		get_user_origin(kIndex,korigin);
				
		// TE_SPRITE - additive sprite, plays 1 cycle
		message_begin( MSG_BROADCAST,SVC_TEMPENTITY);
		write_byte( 17 );
		write_coord(korigin[0]);	// coord, coord, coord (position) 
		write_coord(korigin[1]); 
		write_coord(korigin[2]);
		write_short( sprMflash ); 	// short (sprite index) 
		write_byte ( 20 ); 		// byte (scale in 0.1's)  
		write_byte ( 200 ); 		// byte (brightness)
		message_end();
		
		// Smoke
		message_begin( MSG_BROADCAST,SVC_TEMPENTITY,korigin);
		write_byte( 5 );
		write_coord(korigin[0]);	// coord coord coord (position) 
		write_coord(korigin[1]);
		write_coord(korigin[2]);
		write_short ( sprSmoke );	// short (sprite index)
		write_byte ( 20 ); 		// byte (scale in 0.1's)
		write_byte ( 15 ); 		// byte (framerate)
		message_end();
		
		set_task(0.2, "ignite_effects" , 0 , skIndex, 2);	
	}	
	else    
	{
		if( onfire[kIndex] )   
		{
			emit_sound(kIndex,CHAN_AUTO, "scientist/scream21.wav", 0.6, ATTN_NORM, 0, PITCH_HIGH);
			onfire[kIndex] = 0;
		}
	}
	
	return PLUGIN_CONTINUE;
}

public ignite_player(skIndex[])
{		
	new kIndex = skIndex[0];
		
	if (is_user_alive(kIndex) && onfire[kIndex] )    
	{
		if(get_cvar_num("amx_dice_debug") == 2)
			log_amx("DEBUG (Advanced Roll the Dice): Function ignite_player");
			
		new korigin[3];
		new players[32], inum = 0;
		new pOrigin[3];
		new kHeath = get_user_health(kIndex);
		get_user_origin(kIndex,korigin);
		
		// create some damage
		set_user_health(kIndex,kHeath - 10);
		message_begin(MSG_ONE, g_msgDamage, {0,0,0}, kIndex);
		write_byte(30); 		// dmg_save
		write_byte(30); 		// dmg_take 
		write_long(1<<21); 		// visibleDamageBits 
		write_coord(korigin[0]); 	// damageOrigin.x 
		write_coord(korigin[1]); 	// damageOrigin.y
		write_coord(korigin[2]); 	// damageOrigin.z 
		message_end();
				
		// create some sound
		emit_sound(kIndex,CHAN_ITEM, "ambience/flameburst1.wav", 0.6, ATTN_NORM, 0, PITCH_NORM);
				
		new team1[32];
		get_user_team(kIndex, team1 , 32);
		new team[32];
		amx_ff = get_cvar_float("mp_friendlyfire");
		
		if(amx_ff == 0)
		{
			get_players(players,inum,"a");
			for(new i = 0 ;i < inum; ++i)   
			{									
				get_user_origin(players[i],pOrigin);
				if( get_distance(korigin,pOrigin) < 100  )   
				{
					get_user_team(players[i], team , 32);
					if( !onfire[players[i]] )
					{
						if(!equal(team, team1, 1))
						{
							new spIndex[2];
							spIndex[0] = players[i];
							new pName[32], kName[32];
							get_user_name(players[i],pName,31);
							get_user_name(kIndex,kName,31);
							emit_sound(players[i],CHAN_WEAPON ,"scientist/scream07.wav", 1.0, ATTN_NORM, 0, PITCH_HIGH);
							client_print(0,3,"* [AMXX] <Dice Dealer>  OH! NO! %s burned %s!",kName,pName);
							onfire[players[i]] = 1;
							ignite_player(players[i]);
							ignite_effects(players[i]);
						}
					}
				}
			}
			
			players[0] = 0;
			pOrigin[0] = 0;
			korigin[0] = 0;
		}
		else if(amx_ff == 1)
		{
			get_players(players,inum,"a");
			for(new i = 0 ;i < inum; ++i)
			{									
				get_user_origin(players[i],pOrigin);
				if( get_distance(korigin,pOrigin) < 100 )
				{
					if( !onfire[players[i]] )
					{
						new spIndex[2];
						spIndex[0] = players[i]
						new pName[32], kName[32];
						get_user_name(players[i],pName,31);
						get_user_name(kIndex,kName,31);
						emit_sound(players[i],CHAN_WEAPON ,"scientist/scream07.wav", 1.0, ATTN_NORM, 0, PITCH_HIGH);
						client_print(0,3,"* [AMXX] <Dice Dealer>  OH! NO! %s burned %s!",kName,pName);
						onfire[players[i]] =1;
						ignite_player(players[i]);
						ignite_effects(players[i]);
					}					
				}
			}
			
			players[0] = 0;
			pOrigin[0] = 0;
			korigin[0] = 0;
		}
		
		// Call Again in 2 seconds		
		set_task(2.0, "ignite_player" , 0 , skIndex, 2);
	}
	
	return PLUGIN_CONTINUE;
}

public invisibility(id[])
{			
	if( (is_user_alive(id[0])) && (HasPrize[id[0]][0] == PRIZE_INVISIBLE) )
	{
		if(get_cvar_num("amx_dice_debug") == 2)
			log_amx("DEBUG (Advanced Roll the Dice): Function invisibility");
			
		set_user_rendering(id[0],kRenderFxNone, 0,0,0, kRenderTransAdd,5);
	}

	return PLUGIN_CONTINUE;
}

public single_knife(id[])
{			
	if( (is_user_alive(id[0])) && (HasPrize[id[0]][0] == PRIZE_NIGHTCLUB) )
	{
		if(get_cvar_num("amx_dice_debug") == 2)
			log_amx("DEBUG (Advanced Roll the Dice): Function single_knife");
		
		client_cmd(id[0],"impulse 100");
		new r,g,b;
		r = random_num(0,255);
		g = random_num(0,255);
		b = random_num(0,255);

		new korigin[3];
		get_user_origin(id[0],korigin);
		new wpn = read_data(2);

		if (random(30) == 1)
		{
			//TE_SPRITE - additive sprite, plays 1 cycle
			message_begin( MSG_BROADCAST,SVC_TEMPENTITY);
			write_byte( 17 );
			write_coord(korigin[0]);	// coord, coord, coord (position) 
			write_coord(korigin[1]);
			write_coord(korigin[2]);
			write_short( sprMflash ); 		// short (sprite index) 
			write_byte ( 20 ); 		// byte (scale in 0.1's)  
			write_byte ( 200 ); 		// byte (brightness)
			message_end();
		}
		else if (random(50) == 8)
		{
			message_begin(MSG_BROADCAST,SVC_TEMPENTITY);
			write_byte(20); 				// TE_BEAMDISK
			write_coord(korigin[0]);			// coord coord coord (center position)
			write_coord(korigin[1]);
			write_coord(korigin[2]);
			write_coord(korigin[0]);			// coord coord coord (axis and radius)
			write_coord(korigin[1]);
			write_coord(korigin[2]+random_num(250,750));
			
			switch(random_num(0,1)) 
			{
				case 0: write_short(sprFlare6);		// short (sprite index)
				case 1: write_short(sprLightning);	// short (sprite index)
			}
			
			write_byte(0);				// byte (starting frame)
			write_byte(0);				// byte (frame rate in 0.1's)
			write_byte(45);				// byte (life in 0.1's)
			write_byte(150);			// byte (line width in 0.1's)
			write_byte(0);				// byte (noise amplitude in 0.01's)
			write_byte(r);				// byte,byte,byte (color)
			write_byte(g);
			write_byte(b);
			write_byte(155);			// byte (brightness)
			write_byte(0);				// byte (scroll speed in 0.1's)
			message_end();
		}
		else if (random(30) == 15)
		{
			message_begin(MSG_BROADCAST,SVC_TEMPENTITY);
			write_byte(15);					// TE_SPRITETRAIL
			write_coord(korigin[0]);			// coord, coord, coord (start)
			write_coord(korigin[1]);
			write_coord(korigin[2]-20);
			write_coord(korigin[0]);			// coord, coord, coord (end)
			write_coord(korigin[1]);
			write_coord(korigin[2]+20);
			
			if ((r > 128) && (g < 127) && (b < 127))
				write_short(sprRflare);
			
			else if ((r < 127) && (g > 128) && (b < 127))
				write_short(sprGflare);
			
			else if ((r < 127) && (g < 127) && (b > 128))
				write_short(sprBflare);
				
			else if ((r < 127) && (g > 128) && (b > 128))
				write_short(sprTflare);
				
			else if ((r > 128) && (g < 127) && (b < 200) && (b > 100))
				write_short(sprPflare);
				
			else if ((r > 128) && (g > 128) && (b < 127))
				write_short(sprYflare);
				
			else if ((r > 128) && (g > 100) && (g < 200) && (b < 127))
				write_short(sprOflare);
			else
				write_short(sprBflare);
			
			write_byte(get_cvar_num("fireworks_flare_count"));	// byte (count)
			write_byte(10);						// byte (life in 0.1's)
			write_byte(10);						// byte (scale in 0.1's)
			write_byte(random_num(40,100));				// byte (velocity along vector in 10's)
			write_byte(40);						// byte (randomness of velocity in 10's)
			message_end();
		}
		else if (random(30) == 26)
		{
			message_begin(MSG_BROADCAST,SVC_TEMPENTITY);
			write_byte(27);
			write_coord(korigin[0]);	// coord, coord, coord (start)
			write_coord(korigin[1]);
			write_coord(korigin[2]);
			write_byte(30);			// byte (radius in 10's) 
			write_byte(r);			// byte byte byte (color)
			write_byte(g);
			write_byte(b);
			write_byte(70);			// byte (life in 10's)
			write_byte(11);			// byte (decay rate in 10's)
			message_end();
		}
		else if (random(10) == 7)
		{
			new color = random_num(0,255);
			new width = random_num(400,1000);
			
			// TE_PARTICLEBURST
			message_begin(MSG_BROADCAST,SVC_TEMPENTITY);
			write_byte(122); 		// very similar to lavasplash.
			write_coord(korigin[0]);	// coord, coord, coord (start)
			write_coord(korigin[1]);
			write_coord(korigin[2]);
			write_short (width);
			write_byte (color); 		// (particle color)
			write_byte (40); 		// (duration * 10) (will be randomized a bit)
			message_end();
		}
		else if (random(10) == 9)
		{
			message_begin(MSG_BROADCAST,SVC_TEMPENTITY);
			write_byte(14);
			write_coord(korigin[0]);
			write_coord(korigin[1]);
			write_coord(korigin[2]-100);
			write_byte(5000); 		// radius
			write_byte(80);
			write_byte(20);
			message_end();
		}
		else if (wpn == 6) 
		{
			// nothing...
		}
		else
		{
			engclient_cmd(id[0],"weapon_knife");
		}
	}
	
	return PLUGIN_CONTINUE;
}

public positionChangeTimer(id, Float: secs)
{
	if(get_cvar_num("amx_dice_debug") == 2)
		log_amx("DEBUG (Advanced Roll the Dice): Function positionChangeTimer");
				
	new origin[3];
	new velocity[3];
	
	if (!is_user_alive(id))
		return;
	
	get_user_origin(id, origin, 0);
	g_lastPosition[id][0]=origin[0];
	g_lastPosition[id][1]=origin[1];
	g_lastPosition[id][2]=origin[2];
	new Float:vector[3];
	entity_get_vector(id, EV_VEC_velocity, vector);
	FVecIVec(vector, velocity);
	
	if ( velocity[0]==0 && velocity[1]==0 && velocity[2] )
	{
		// Force a Move (small jump)
		velocity[0]=50;
		velocity[1]=50;
		IVecFVec(velocity, vector);
		entity_set_vector(id, EV_VEC_velocity, vector);
	}
	
	new parm[1];
	parm[0]=id;
	set_task(secs,"positionChangeCheck",0,parm,1);
}

public positionTimer2(id, Float: secs)
{
	if(get_cvar_num("amx_dice_debug") == 2)
		log_amx("DEBUG (Advanced Roll the Dice): Function positionTimer2");
				
	new origin[3];
	new velocity[3];
	
	if (!is_user_alive(id))
		return;

	get_user_origin(id, origin, 0);
	g_lastPosition[id][0]=origin[0];
	g_lastPosition[id][1]=origin[1];
	g_lastPosition[id][2]=origin[2];
	new Float:vector[3];
	entity_get_vector(id, EV_VEC_velocity, vector);
	FVecIVec(vector, velocity);
	
	if ( velocity[0]==0 && velocity[1]==0 && velocity[2] ) 
	{
		// Force a Move (small jump)
		velocity[0]=50;
		velocity[1]=50;
		IVecFVec(velocity, vector);
		entity_set_vector(id, EV_VEC_velocity, vector);
	}
	
	new parm[1];
	parm[0]=id;
	set_task(secs,"positionCheck2",0,parm,1);
}

public positionChangeCheck(parm[1])
{
	if(get_cvar_num("amx_dice_debug") != 0)
		log_amx("DEBUG (Advanced Roll the Dice): Function positionChangeCheck");
				
	new id=parm[0];
	new origin[3];
	new name[32];
	get_user_name(id,name,32);

	if (!is_user_alive(id))
		return;

	get_user_origin(id, origin, 0);
	
	if ( g_lastPosition[id][0] == origin[0] && g_lastPosition[id][1] == origin[1] && g_lastPosition[id][2] == origin[2] && is_user_alive(id) )
	{
		user_kill(id);
		set_hudmessage(200,255,200, 0.03, 0.62, 2, 0.02, 2.0, 0.01, 0.1, 1);
		show_hudmessage(0, "%s got stuck and died.",name);
	} 
	else 
	{
		set_hudmessage(200,255,200, 0.03, 0.62, 2, 0.02, 2.0, 0.01, 0.1, 1);
		show_hudmessage(0, "%s no longer has noclip.",name);
	}
}

public positionCheck2(parm[1])
{
	if(get_cvar_num("amx_dice_debug") == 2)
		log_amx("DEBUG (Advanced Roll the Dice): Function positionCheck2");
				
	new id=parm[0];
	new origin[3];
	new name[32];
	get_user_name(id,name,32);
	
	if (!is_user_alive(id))
		return;
	
	get_user_origin(id, origin, 0);
	
	if ( g_lastPosition[id][0] == origin[0] && g_lastPosition[id][1] == origin[1] && g_lastPosition[id][2] == origin[2] && is_user_alive(id) )
	{
		client_print(id,print_chat, "[AMXX] <Dice Dealer>  You got stuck, so I teleport you where you rolled.");
		set_user_origin(id,origen);
	}
}

public check_weapon(id)
{				
	if( is_user_alive(id) != 0 && g_Hasuammo[id] == 1 )
	{
		if(get_cvar_num("amx_dice_debug") == 2)
			log_amx("DEBUG (Advanced Roll the Dice): Function check_weapon");
		
		new clip = read_data(3);

		if ( clip == 0 ) 
			reloadAmmo(id);
	}
	
	return PLUGIN_CONTINUE;
}

public reloadAmmo(id)
{
	if(get_cvar_num("amx_dice_debug") == 2)
		log_amx("DEBUG (Advanced Roll the Dice): Function reloadAmmo");
	
	new szdrop[4];
	read_argv(2,szdrop,3);
	new dropwpn = str_to_num(szdrop);

	if (g_ReloadTime[id] >= get_systime() - 1)
		return;
	
	g_ReloadTime[id] = get_systime();

	new clip, ammo, wpn[32];
	new wpnid = get_user_weapon(id, clip, ammo);

	if ( wpnid == CSW_C4 || wpnid == CSW_KNIFE )
		return;
		
	if ( wpnid == CSW_HEGRENADE || wpnid == CSW_SMOKEGRENADE || wpnid == CSW_FLASHBANG)
		return;

	if ( clip == 0 ) 
	{
		get_weaponname(wpnid,wpn,31);
		
		if ( dropwpn ) 
		{
			engclient_cmd(id,"drop",wpn);
			give_item(id, wpn);
			engclient_cmd(id, wpn);
		}
		else 
		{
			new iWPNidx = -1;
			while ((iWPNidx = find_ent_by_class(iWPNidx, wpn)) != 0)
			{
				if (id == entity_get_edict(iWPNidx, EV_ENT_owner)) 
				{
					cs_set_weapon_ammo(iWPNidx, getMaxClipAmmo(wpnid));
					break;
				}
			}
		}
	}
}

stock getMaxClipAmmo(wpnid) 
{
	if(get_cvar_num("amx_dice_debug") == 2)
		log_amx("DEBUG (Advanced Roll the Dice): Stock getMaxClipAmmo");
	
	new clipammo = 0;
	switch (wpnid)
	{
		case CSW_P228		: clipammo = 13;
		case CSW_SCOUT		: clipammo = 10;
		case CSW_HEGRENADE	: clipammo = 0;
		case CSW_XM1014		: clipammo = 7;
		case CSW_C4		: clipammo = 0;
		case CSW_MAC10		: clipammo = 30;
		case CSW_AUG		: clipammo = 30;
		case CSW_SMOKEGRENADE	: clipammo = 0;
		case CSW_ELITE		: clipammo = 15;
		case CSW_FIVESEVEN	: clipammo = 20;
		case CSW_UMP45		: clipammo = 25;
		case CSW_SG550		: clipammo = 30;
		case CSW_GALI		: clipammo = 35;
		case CSW_FAMAS		: clipammo = 25;
		case CSW_USP		: clipammo = 12;
		case CSW_GLOCK18	: clipammo = 20;
		case CSW_AWP		: clipammo = 10;
		case CSW_MP5NAVY	: clipammo = 30;
		case CSW_M249		: clipammo = 100;
		case CSW_M3		: clipammo = 8;
		case CSW_M4A1		: clipammo = 30;
		case CSW_TMP		: clipammo = 30;
		case CSW_G3SG1		: clipammo = 20;
		case CSW_FLASHBANG	: clipammo = 0;
		case CSW_DEAGLE		: clipammo = 7;
		case CSW_SG552		: clipammo = 30;
		case CSW_AK47		: clipammo = 30;
		case CSW_KNIFE		: clipammo = 0;
		case CSW_P90		: clipammo = 50;
	}
	
	return clipammo;
}

public player_screenfade(id)
{			
	if (HasPrize[id][0] == PRIZE_BLIND)
	{
		if(get_cvar_num("amx_dice_debug") == 2)
			log_amx("DEBUG (Advanced Roll the Dice): Function player_screenfade");
			
		set_task(0.5,"player_blind", id);
		
		HasPrize[id][0] = 0;

		return PLUGIN_HANDLED;
	}
	
	return PLUGIN_CONTINUE;
}

public player_blind(id)
{			
	if (HasPrize[id][0] == PRIZE_BLIND)
	{
		if(get_cvar_num("amx_dice_debug") == 2)
			log_amx("DEBUG (Advanced Roll the Dice): Function player_blind");
		
		message_begin(MSG_ONE, g_msgFade, {0,0,0}, id); 	// use the magic #1 for "one client" 
		write_short( ~0 ); 	// fade lasts this long duration 
		write_short( ~0 ); 	// fade lasts this long hold time 
		write_short( 1<<12 ); 	// fade type 
		write_byte( 0 ); 	// fade red 
		write_byte( 0 ); 	// fade green 
		write_byte( 0 ); 	// fade blue  
		write_byte( 255 ); 	// fade alpha  
		message_end( );
	}
}

public player_unblind(id)
{
	if(get_cvar_num("amx_dice_debug") == 2)
		log_amx("DEBUG (Advanced Roll the Dice): Function player_unblind");
				
	message_begin(MSG_ONE, g_msgFade, {0,0,0}, id); 	// use the magic #1 for "one client"  
	write_short( 1<<12 ); 	// fade lasts this long duration  
	write_short( 1<<8 ); 	// fade lasts this long hold time  
	write_short( 1<<1 ); 	// fade type
	write_byte( 0 ); 	// fade red  
	write_byte( 0 ); 	// fade green  
	write_byte( 0 ); 	// fade blue
	write_byte( 128 ); 	// fade alpha  
	message_end( );
}

public para_action(id)
{
	if(HasPrize[id][0] == PRIZE_PARA)
	{
		if(get_cvar_num("amx_dice_debug") == 2)
			log_amx("DEBUG (Advanced Roll the Dice): Function para_action");
		
		new clip, ammo, weapon = get_user_weapon(id,clip,ammo);
				
		if(weapon != CSW_M249 || clip <= 0)
		{
			checkSpeed(id);
			return PLUGIN_HANDLED;
		}
		if( !(get_user_button(id) & IN_ATTACK) )
		{
			checkSpeed(id);
			return PLUGIN_HANDLED;
		}
				
		set_user_maxspeed(id,PARA_SHOOT_SPEED);
		wasFiring[id] = true;
	}
	return PLUGIN_CONTINUE;
}
	
public checkSpeed(id)
{
	if(get_cvar_num("amx_dice_debug") == 2)
		log_amx("DEBUG (Advanced Roll the Dice): Function checkSpeed");
		
	if(wasFiring[id])
	{
		wasFiring[id] = false;
		set_user_maxspeed(id,oldspeed[id]);
	}
}

public event_damage(id)
{
	if (id > 0)
	{
		if(get_cvar_num("amx_dice_debug") == 2)
			log_amx("DEBUG (Advanced Roll the Dice): Function event_damage");
		
		new maxplayers = get_maxplayers()+1;
		new attacker_id = get_user_attacker (id);
	
		if( attacker_id <= 0 || attacker_id > maxplayers || !is_user_connected(id) || !is_user_connected(attacker_id) )
			return PLUGIN_CONTINUE;
	
		if( HasPrize[attacker_id][0] == PRIZE_PARA && is_user_alive(id) == 1 )
		{
			new DoKill = 1;
			new clip, ammo, AttackingWeapon = get_user_weapon ( attacker_id, clip, ammo );
		
			if ( AttackingWeapon != CSW_M249 )
				DoKill = 0;
		
			if ( DoKill == 1 )
			{
				kill_player(id,attacker_id);
			}
		}
	}
	
	return PLUGIN_CONTINUE;
}

public kill_player(id,attacker_id)
{
	if( is_user_alive(id) == 1 && id > 0)
	{
		if(get_cvar_num("amx_dice_debug") == 2)
			log_amx("DEBUG (Advanced Roll the Dice): Function kill_player");
		
		new origin[3];
		new attacker_team[2], victim_team[2];
		new maxplayers = get_maxplayers()+1;
		
		if( attacker_id <= 0 || attacker_id > maxplayers || !is_user_connected(id) || !is_user_connected(attacker_id) )
			return PLUGIN_CONTINUE;
		
		get_user_origin ( id, origin );
		
		// kill victim
		user_silentkill  ( id );
		message_begin ( MSG_ALL, get_user_msgid("DeathMsg"), {0, 0, 0}, 0 );
		write_byte(attacker_id);
		write_byte(id);
		write_byte(0);
		if ( HasPrize[attacker_id][0] == PRIZE_PARA )
			write_string("m249");
		else if ( HasPrize[attacker_id][0] == PRIZE_LSABER )
			write_string("lightsaber");
		message_end();
			
		// Save Hummiliation
		new namea[24],namev[24],authida[20],authidv[20],teama[8],teamv[8];
			
		// Info On Attacker
		get_user_name ( attacker_id, namea, 23 );
		get_user_team ( attacker_id, teama, 7 );
		get_user_authid ( attacker_id, authida, 19 );
			
		// Info On Victim
		get_user_name ( id, namev, 23 ); 
		get_user_team ( id, teamv, 7 );
		get_user_authid ( id, authidv, 19 );
			
		// Log This Kill
		log_message ( "^"%s<%d><%s><%s>^" killed ^"%s<%d><%s><%s>^"", namea, get_user_userid ( attacker_id ), authida, teama, namev, get_user_userid ( id ), authidv, teamv );		  
			
		// Check team 
		get_user_team ( attacker_id, attacker_team, 1 );
		get_user_team ( id, victim_team, 1 );
			
		// Check for War3 and SHERo mods.
		new war3xp = get_cvar_num ( "Warcraft_3_XP" );
		new shero = get_cvar_num ( "sv_superheros" );
		new war3ft = get_cvar_num ( "sv_warcraft3" ) ;
			
		if ( war3ft == 1 && war3xp != 0 )
		{
			war3xp = 1;
			war3ft = 0;
		}
			
		if ( war3xp != 0 )
			war3xp = 1;
	
		if ( !equali ( attacker_team, victim_team ) )
		{ 
			set_user_frags ( attacker_id, get_user_frags ( attacker_id ) +1 );
			cs_set_user_money ( attacker_id, cs_get_user_money ( attacker_id ) +150 );
				
			if ( war3xp == 1 )
				server_cmd("wc3_givexp ^"%s^" %d", namea, 50 );

			if ( war3ft == 1 )
				server_cmd("amx_givexp ^"%s^" %d", namea, 50 );
		
			if ( shero == 1 )
				server_cmd("amx_shaddxp ^"%s^" %d", namea, 50 );
		}
		else 
		{
			set_user_frags ( attacker_id, get_user_frags ( attacker_id ) -1 ); 
			cs_set_user_money ( attacker_id, cs_get_user_money ( attacker_id ) - 500, 0 );
				
			if ( war3xp == 1 )
				server_cmd("wc3_givexp ^"%s^" -%d", namea, 150 );
				
			if ( war3ft == 1 )
				server_cmd("amx_givexp ^"%s^" -%d", namea, 150 );
				
			if ( shero == 1 )
				server_cmd("amx_shaddxp ^"%s^" -%d", namea, 150 );
		}
	}
	
	return PLUGIN_CONTINUE;
}
