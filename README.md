openenergymonitor-emontx_box
============================

OpenSCAD code to render an emonTX box (openenergymonitor.org)

Apply parameter settings (0 or 1) to render connector holes according to your specific needs

Lid, and battery compartments are also optional  (set to 0 or width needed)


Default settings are:

// CONNECTOR HOLES : set to 0 or 1 according to your box requirements.

CT1=1;
CT2=0;
CT3=0;
USB_POWER=0;
AC_JACK=0;
TEMP=0;
PULSE=0;
LED_HOLE=1;

// BOX LID; set to 0 if not required, or 1 if required

BOX_LID=1;  				// 0 for no LID

battery_compartment_width=32;
