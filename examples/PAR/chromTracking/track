#!/bin/sh  
# \
exec tclsh "$0" "$@"

if ![file exists parTrack.log] {
    catch {exec elegant parTrack.ele > parTrack.log}
}

exec sddscollapse parTrack.fin parTrack.finc 

# plot FFTs vs energy offset

exec sddsfft parTrack.w1 -pipe=out -window -column=Pass,Cx,Cy \
 | sddsxref -pipe parTrack.fin -leave=* -transfer=param,MAL.DP -rename=parameter,MAL.DP=delta \
 | sddsprocess -pipe=in parTrack.w1fft \
  "-print=parameter,Label1,\$gd\$r = %.4f,delta"

exec sddsplot -title=@Label1 \
    -mode=y=log,y=special -graph=line,vary -legend \
    -split=page -separate=page -groupby=page -same \
    -column=f,FFTCx parTrack.w1fft \
    -column=f,FFTCy parTrack.w1fft 

# use NAFF to get the tunes, then fit for chromaticities and compare with Twiss results

exec sddsnaff parTrack.w1 -pipe=out -column=Pass,Cx,Cy \
 -terminate=frequencies=1 \
 | sddscombine -merge -pipe \
 | sddsxref -pipe parTrack.finc -take=MAL.DP -rename=column,MAL.DP=delta \
 | sddsmpfit -pipe  -indep=delta -depen=CxFrequency,CyFrequency -terms=5 \
 | sddsxref -pipe parTrack.twi -leave=* -transfer=param,dnu?/dp \
 | sddsprocess -pipe=in parTrack.fit \
  "-print=parameter,xLabel,x chrom.:  fit gives %.4f    Twiss gives %.4f,CxFrequencySlope,dnux/dp" \
  "-print=parameter,yLabel,y chrom.:  fit gives %.4f    Twiss gives %.4f,CyFrequencySlope,dnuy/dp" \

exec sddsplot -column=delta,CxFrequency -graph=sym parTrack.fit -title=@xLabel \
    -column=delta,CxFrequencyFit -graph=line,type=1 parTrack.fit -end \
    -column=delta,CyFrequency -graph=sym parTrack.fit -title=@yLabel \
    -column=delta,CyFrequencyFit -graph=line,type=1 parTrack.fit -end


