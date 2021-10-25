// Template - 이 파일은 직접 수정하지 말고, 복제(duplicate) 후 변경해서 사용하세요.
/*==========================================*/
// license : MIT
// description : Biquad Filter coefficient example
// Creator : Sangbin Rhie
/*==========================================*/

(
{
	// 1. Set synthdef name
	var name = \biquad_ex;


	// 2. Make your synthdef!
	SynthDef.new(name, {
		arg a0, a1, a2, b1, b2;
		var sig, amp=0.7;
		sig=WhiteNoise.ar(amp, 0);
		sig=SOS.ar(sig, a0, a1, a2, b1, b2);
		Out.ar([0, 1], sig);

	}).store;
	name;
)}.value();
)


//biquad Filter example
/*
Synth(\biquad_ex,
	[\a0, 0.003493,
		\a1, 0,
		\a2, -0.003493,
		\b1, 1.992836,
		\b2, -0.993039]
);//(2nd order Bpf centerfreq: 100, 2.0Q, Gain 0.0db)

Synth(\biquad_ex,
	[\a0, 0.2,
		\a1, 0,
		\a2, -0.2,
		\b1, 0.123,
		\b2, -0.644]
);//(centerfreq. goes high near 20000)
*/