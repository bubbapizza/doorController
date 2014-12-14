PCBNEW-LibModule-V1  12/14/2014 9:49:06 AM
# encoding utf-8
Units mm
$INDEX
BUZZER_SMALL
C2_KF103
LED-5MM-RED
MONO_JACK
PINS_3x2_WIDE_SMD
PIN_ARRAY_4x1_RIGHT_ANGLE
RELAY_AZ942
WIRE_HOLES_6
$EndINDEX
$MODULE BUZZER_SMALL
Po 0 0 0 15 5483498A 00000000 ~~
Li BUZZER_SMALL
Sc 0
AR 
Op 0 0 0
T0 0 -1.9 1.5 1.5 0 0.15 N V 21 N "BUZZER"
T1 0.3 2.3 1.5 1.5 0 0.15 N V 21 N "VAL**"
DC 0 0 6.1 0.1 0.15 21
$PAD
Sh "1" C 1.524 1.524 0 0 0
Dr 0.762 0 0
At STD N 00E0FFFF
Ne 0 ""
Po -2.5 0
$EndPAD
$PAD
Sh "2" C 1.524 1.524 0 0 0
Dr 0.762 0 0
At STD N 00E0FFFF
Ne 0 ""
Po 2.5 0
$EndPAD
$SHAPE3D
Na "3D_models/TDK_buzzer.wrl"
Sc 0.394 0.394 0.394
Of 0 0 0
Ro 0 0 0
$EndSHAPE3D
$EndMODULE BUZZER_SMALL
$MODULE C2_KF103
Po 0 0 0 15 535BDB0E 00000000 ~~
Li C2_KF103
Sc 0
AR 
Op 0 0 0
T0 -4.6 7.1 1 1 0 0.15 N V 21 N "P"
T1 3 7.1 1 1 0 0.15 N V 21 N "VAL**"
DS 3.2 -4 1.6 -4 0.15 21
DS 3.2 -6.1 3.2 -4 0.15 21
DS 1.6 -6.1 3.2 -6.1 0.15 21
DS 1.6 -4 1.6 -6.1 0.15 21
DS -3.3 -4 -3.3 -6.1 0.15 21
DS -3.3 -6.1 -1.7 -6.1 0.15 21
DS -1.7 -6.1 -1.7 -4 0.15 21
DS -1.7 -4 -3.3 -4 0.15 21
DS 5 -3.1 -5 -3.1 0.15 21
DS 5 -6.8 -5 -6.8 0.15 21
DS -5 -7.8 5 -7.8 0.15 21
DS 5 -7.8 5 6.1 0.15 21
DS 5 6.1 -5 6.1 0.15 21
DS -5 6.1 -5 -7.8 0.15 21
$PAD
Sh "1" C 1.5 1.5 0 0 0
Dr 1 0 0
At STD N 00E0FFFF
Ne 0 ""
Po -2.5 0
$EndPAD
$PAD
Sh "2" C 1.5 1.5 0 0 0
Dr 1 0 0
At STD N 00E0FFFF
Ne 0 ""
Po 2.5 0
$EndPAD
$SHAPE3D
Na "3D_models/KF103.wrl"
Sc 0.393 0.393 0.393
Of 0.2 0.275 0
Ro 90 0 90
$EndSHAPE3D
$EndMODULE C2_KF103
$MODULE LED-5MM-RED
Po 0 0 0 15 50ADE86B 00000000 ~~
Li LED-5MM-RED
Cd LED 5mm - Lead pitch 100mil (2,54mm)
Kw LED led 5mm 5MM 100mil 2,54mm
Sc 0
AR 
Op 0 0 0
T0 0 -3.81 0.762 0.762 0 0.0889 N V 21 N "LED-5MM"
T1 0 3.81 0.762 0.762 0 0.0889 N V 21 N "VAL***"
DS 2.8448 1.905 2.8448 -1.905 0.2032 21
DC 0.254 0 -1.016 1.27 0.0762 21
DA 0.254 0 2.794 1.905 2862 0.254 21
DA 0.254 0 -0.889 0 900 0.1524 21
DA 0.254 0 1.397 0 900 0.1524 21
DA 0.254 0 -1.397 0 900 0.1524 21
DA 0.254 0 1.905 0 900 0.1524 21
DA 0.254 0 -1.905 0 900 0.1524 21
DA 0.254 0 2.413 0 900 0.1524 21
$PAD
Sh "1" C 1.6764 1.6764 0 0 0
Dr 0.8128 0 0
At STD N 00E0FFFF
Ne 0 ""
Po -1.27 0
$EndPAD
$PAD
Sh "2" C 1.6764 1.6764 0 0 0
Dr 0.8128 0 0
At STD N 00E0FFFF
Ne 0 ""
Po 1.27 0
$EndPAD
$SHAPE3D
Na "3D_models/led5_vertical_red.wrl"
Sc 1 1 1
Of 0 0 0
Ro 0 0 0
$EndSHAPE3D
$EndMODULE LED-5MM-RED
$MODULE MONO_JACK
Po 0 0 0 15 5330B3F2 00000000 ~~
Li MONO_JACK
Sc 0
AR 
Op 0 0 0
T0 -0.1 5.8 1 1 0 0.15 N V 21 N "MONO JACK"
T1 0 -5.4 1 1 0 0.15 N V 21 N "VAL**"
DS -7.3 -3 -7.3 3 0.15 21
DS -7 3.8 -7 -3.8 0.15 21
DS -11.4 3 -7 3 0.15 21
DS -11.4 -3 -7 -3 0.15 21
DS 7 -3.8 7 3.8 0.15 21
DS -11.4 -3 -11.4 3 0.15 21
DS -7 -3.8 7 -3.8 0.15 21
DS 7 3.8 -7 3.8 0.15 21
$PAD
Sh "1" O 1 2.6 0 0 0
Dr 0.6 0 0 O 0.6 2.1
At STD N 00E0FFFF
Ne 0 ""
Po -5.3 -0.1
$EndPAD
$PAD
Sh "2" O 1 2.6 0 0 0
Dr 0.6 0 0 O 0.6 2.1
At STD N 00E0FFFF
Ne 0 ""
Po 0 0
$EndPAD
$PAD
Sh "3" O 1 2.6 0 0 0
Dr 0.6 0 0 O 0.6 2.1
At STD N 00E0FFFF
Ne 0 ""
Po 5.8 0
$EndPAD
$EndMODULE MONO_JACK
$MODULE PINS_3x2_WIDE_SMD
Po 0 0 0 15 548DA35F 00000000 ~~
Li PINS_3x2_WIDE_SMD
Sc 0
AR 
Op 0 0 0
T0 0.1 -2 1 1 0 0.15 N V 21 N "SMD_PINS"
T1 0.1 2.1 1 1 0 0.15 N V 21 N "P"
$PAD
Sh "1" R 3.1 1 0 0 0
Dr 0 0 0
At SMD N 00540001
Ne 0 ""
Po -7.45 0
$EndPAD
$PAD
Sh "2" R 3.1 1 0 0 0
Dr 0 0 0
At SMD N 00540001
Ne 0 ""
Po 10.55 0
$EndPAD
$PAD
Sh "4" R 3.1 1 0 0 0
Dr 0 0 0
At SMD N 00540001
Ne 0 ""
Po -10.55 -2.54
$EndPAD
$PAD
Sh "3" R 3.1 1 0 0 0
Dr 0 0 0
At SMD N 00540001
Ne 0 ""
Po 7.45 2.54
$EndPAD
$PAD
Sh "6" R 3.1 1 0 0 0
Dr 0 0 0
At SMD N 00540001
Ne 0 ""
Po -10.55 2.54
$EndPAD
$PAD
Sh "5" R 3.1 1 0 0 0
Dr 0 0 0
At SMD N 00540001
Ne 0 ""
Po 7.45 -2.54
$EndPAD
$EndMODULE PINS_3x2_WIDE_SMD
$MODULE PIN_ARRAY_4x1_RIGHT_ANGLE
Po 0 0 0 15 4C10F42E 00000000 ~~
Li PIN_ARRAY_4x1_RIGHT_ANGLE
Cd Double rangee de contacts 2 x 5 pins
Kw CONN
Sc 0
AR 
Op 0 0 0
T0 0 -2.54 1.016 1.016 0 0.2032 N V 21 N "PIN_ARRAY_4X1"
T1 0 2.54 1.016 1.016 0 0.2032 N I 21 N "Val**"
DS 5.08 1.27 -5.08 1.27 0.254 21
DS 5.08 -1.27 -5.08 -1.27 0.254 21
DS -5.08 -1.27 -5.08 1.27 0.254 21
DS 5.08 1.27 5.08 -1.27 0.254 21
$PAD
Sh "1" R 1.524 1.524 0 0 0
Dr 1.016 0 0
At STD N 00E0FFFF
Ne 0 ""
Po -3.81 0
$EndPAD
$PAD
Sh "2" C 1.524 1.524 0 0 0
Dr 1.016 0 0
At STD N 00E0FFFF
Ne 0 ""
Po -1.27 0
$EndPAD
$PAD
Sh "3" C 1.524 1.524 0 0 0
Dr 1.016 0 0
At STD N 00E0FFFF
Ne 0 ""
Po 1.27 0
$EndPAD
$PAD
Sh "4" C 1.524 1.524 0 0 0
Dr 1.016 0 0
At STD N 00E0FFFF
Ne 0 ""
Po 3.81 0
$EndPAD
$SHAPE3D
Na "3D_models/Socket_Strip_Angled_1x04.wrl"
Sc 1 1 1
Of 0 0 0
Ro 0 0 0
$EndSHAPE3D
$EndMODULE PIN_ARRAY_4x1_RIGHT_ANGLE
$MODULE RELAY_AZ942
Po 0 0 0 15 5364FF75 00000000 ~~
Li RELAY_AZ942
Sc 0
AR 
Op 0 0 0
T0 6.3 -1.6 1 1 0 0.15 N V 21 N "RELAY"
T1 6.4 3.1 1 1 0 0.15 N V 21 N "VAL**"
DS -4.1 -8.2 18.4 -8.2 0.15 21
DS -4.1 -8.2 -4.1 8.2 0.15 21
DS -4.1 8.2 18.4 8.2 0.15 21
DS 18.4 8.2 18.4 -8.2 0.15 21
$PAD
Sh "1" C 1.8 1.8 0 0 0
Dr 1.3 0 0
At STD N 00E0FFFF
Ne 0 ""
Po -2 0
$EndPAD
$PAD
Sh "2" C 1.8 1.8 0 0 0
Dr 1.3 0 0
At STD N 00E0FFFF
Ne 0 ""
Po 0 -6
$EndPAD
$PAD
Sh "5" C 1.8 1.8 0 0 0
Dr 1.3 0 0
At STD N 00E0FFFF
Ne 0 ""
Po 0 6
$EndPAD
$PAD
Sh "3" C 1.8 1.8 0 0 0
Dr 1.3 0 0
At STD N 00E0FFFF
Ne 0 ""
Po 12.2 -6
$EndPAD
$PAD
Sh "4" C 1.8 1.8 0 0 0
Dr 1.3 0 0
At STD N 00E0FFFF
Ne 0 ""
Po 12.2 6
$EndPAD
$SHAPE3D
Na "3D_models/az942.wrl"
Sc 0.3937 0.3937 0.3937
Of -0.161 0.324 0
Ro 0 0 90
$EndSHAPE3D
$EndMODULE RELAY_AZ942
$MODULE WIRE_HOLES_6
Po 0 0 0 15 548C6B9B 00000000 ~~
Li WIRE_HOLES_6
Sc 0
AR 
Op 0 0 0
T0 0.1 -2 1 1 0 0.15 N V 21 N "BARE_WIRES"
T1 0.1 2.1 1 1 0 0.15 N V 21 N "W"
$PAD
Sh "1" C 2 2 0 0 0
Dr 1 0 0
At STD N 00E0FFFF
Ne 0 ""
Po -3 -4
$EndPAD
$PAD
Sh "2" C 2 2 0 0 0
Dr 1 0 0
At STD N 00E0FFFF
Ne 0 ""
Po 3 -4
$EndPAD
$PAD
Sh "4" C 2 2 0 0 0
Dr 1 0 0
At STD N 00E0FFFF
Ne 0 ""
Po -3 0
$EndPAD
$PAD
Sh "3" C 2 2 0 0 0
Dr 1 0 0
At STD N 00E0FFFF
Ne 0 ""
Po 3 0
$EndPAD
$PAD
Sh "6" C 2 2 0 0 0
Dr 1 0 0
At STD N 00E0FFFF
Ne 0 ""
Po -3 4
$EndPAD
$PAD
Sh "5" C 2 2 0 0 0
Dr 1 0 0
At STD N 00E0FFFF
Ne 0 ""
Po 3 4
$EndPAD
$EndMODULE WIRE_HOLES_6
$EndLIBRARY
