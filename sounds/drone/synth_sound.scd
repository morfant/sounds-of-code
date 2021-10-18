// Template - 이 파일은 직접 수정하지 말고, 복제(duplicate) 후 변경해서 사용하세요.
/*==========================================*/
// license : MIT
// description : BPF(LFNoise2) * Saw
// Creator : YoungjooRyu
/*==========================================*/

(
{
	// 1. Set synthdef name
	var name = \sound;


	// 2. Make your synthdef!
	SynthDef.new(name, {
		arg amp = 1, freq = 440, att = 0.005, rel = 0.3, pan = 0;
		var sig, fil, filter_f, env;
		filter_f = freq * 0.5;
		fil = BPF.ar(LFNoise2.ar(440), filter_f, rq: 1.0);
		sig = Saw.ar(freq, 0.5);
		sig = sig * fil;
		env = EnvGen.kr(Env.new([0, 1, 0], [att, rel], [1, -1]), doneAction:2);
		sig = Pan2.ar(sig, pan, amp);
		sig = sig * env;
		Out.ar(0, sig);

		// 3. leave below code, Please
	}).store;
	name;
}.value();
)


// Optional part
/* Stay commented below!
// Add example/application/description

(
Pdef(\filterpat,
	Pbind(
		\instrument, \sound,
		\dur, Prand([0.2, 0.4, 0.6, 0.8, 1], inf),
		\amp, Pexprand(0.01, 0.8, inf),
		\freq, Pwhite(50, 500, inf),
		\att, Prand([0.5, 0.75, 1, 1.25, 1.5], inf),
		\rel, Prand([1.0, 3.0, 5.0], inf),
		\pan, Pwhite(-0.8, 0.8, inf),
	);
).play;
)

*/
