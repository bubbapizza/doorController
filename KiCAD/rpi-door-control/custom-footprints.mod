PCBNEW-LibModule-V1  5/19/2014 7:51:07 PM
# encoding utf-8
Units mm
$INDEX
C2_KF103
MONO_JACK
RELAY_AZ942
$EndINDEX
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
$EndLIBRARY
