set SOURCE_AUDIO=source\audio
set CONTENT_AUDIO=content\audio

@REM rmdir /s /q content
mkdir content\audio

REM carrier engine rev noise and loud noise on bridge
@REM ffmpeg -y -i %SOURCE_AUDIO%\46504__phreaksaccount__shipengine.ogg -filter:a "volume=-10dB" -acodec libvorbis %CONTENT_AUDIO%\cc_sfx_vehicle02_rpm_02_loop.ogg
@REM ffmpeg -y -i %SOURCE_AUDIO%\46504__phreaksaccount__shipengine.ogg -pass 1 -filter:a loudnorm=print_format=json -acodec libvorbis -f ogg nul
ffmpeg -y -i %SOURCE_AUDIO%\46504__phreaksaccount__shipengine.ogg -pass 2 -filter:a loudnorm=linear=true:I=-23:lra=20:tp=0:measured_I=-19.07:measured_LRA=1.00:measured_tp=-4.54:measured_thresh=-29.07:offset=3 -acodec libvorbis %CONTENT_AUDIO%\cc_sfx_vehicle02_rpm_02_loop.ogg
@REM {
@REM         "input_i" : "-19.07",
@REM         "input_tp" : "-4.54",
@REM         "input_lra" : "1.00",
@REM         "input_thresh" : "-29.07",
@REM         "output_i" : "-24.11",
@REM         "output_tp" : "-9.77",
@REM         "output_lra" : "1.00",
@REM         "output_thresh" : "-34.11",
@REM         "normalization_type" : "dynamic",
@REM         "target_offset" : "0.11"
@REM }