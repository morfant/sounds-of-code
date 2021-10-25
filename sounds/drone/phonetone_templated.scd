// Template - 이 파일은 직접 수정하지 말고, 복제(duplicate) 후 변경해서 사용하세요.
/*==========================================*/
// license : MIT
// description : phone waiting sound mimic
// Creator : Sangbin Rhie
/*==========================================*/
(
{
	// 1. Set synthdef name
	var name = \phonesource
(
SynthDef.new(name, {
	var sig;
	sig=LFPulse.ar(1/5, width: 0.3);
	sig=SinOsc.ar(480, 0, sig)+SinOsc.ar(440, 0, sig);
	Out.ar([0, 1], sig);
}).store;
)
	name;
}.value();
)
//Synth(\phonesource);