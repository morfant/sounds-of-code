// Template - 이 파일은 직접 수정하지 말고, 복제(duplicate) 후 변경해서 사용하세요.
/*==========================================*/
// license : MIT
// description : SOS, filterbank, Pattern
// Creator : Youngjoo Ryu
/*==========================================*/

(
{
	 // 1. Set synthdef name
	var name = \lowdrone;


	// 2. Make your synthdef!
	SynthDef(name, {
		arg freq1 = 1000, freq2 = 444;
		var sig1, sig2, env, fil1, fil2, fil3, fil4;
		sig1 = Saw.ar(freq1 * LFNoise1.ar(5, mul: 0.25));
		sig2 = Saw.ar(freq2 * LFNoise2.ar(1.75, mul: 0.5));
		env = LFTri.ar(30, mul: 0.3, add: 0.3);
		sig1 = sig1 * env;
		sig2 = sig2 * env;

		fil1 = Ringz.ar(sig1, 20, mul: 0.005);
		fil2 = RHPF.ar(sig1, 150);
		fil3 = BPF.ar(sig2, 444, 0.2);
		fil4 = Ringz.ar(fil3, 40, mul: 0.5);

		Out.ar(0, [fil1 + fil2, fil4]);


	// 3. leave below code, Please
	}).store;
	name;
}.value();
)

(
{
	 // 1. Set synthdef name
	var name = \coldwind;


	// 2. Make your synthdef!
	SynthDef(name, {
		arg freq1 = 0.2, freq2 = 2, att = 1, rel = 2, amp = 0.5, pan = 0;
		var sig, rho, theta, b1, b2, env;
		theta = LFTri.kr(freq1).range(0.2pi, pi);
		rho = LFSaw.kr(freq2).range(0.6, 0.99);
		b1 = 1.5 * rho * cos(theta);
		b2 = rho.squared.neg;
		sig = SOS.ar(WhiteNoise.ar(0.1 ! 2), 1.0, 0.0, 0.0, b1, b2);
		env = EnvGen.kr(Env.new([0, 1, 0], [att, rel], [1, -1]), doneAction: 2);
		sig = sig * env;
		sig = Pan2.ar(sig, pan, amp);
		Out.ar(0, sig);


	// 3. leave below code, Please
	}).store;
	name;
}.value();
)



// Optional part
/* Stay commented below!

//Play those sounds with this pattern

(
Pdef(\coldpat1,
	Pbind(
		\instrument, \coldwind,
		\dur, Pwhite(2, 4, inf),
		\amp, Pexprand(0.5, 1.0, inf),
		\freq1, Pwhite(0.2, 0.8, inf),
		\freq2, Pwhite(2, 20, inf),
		\att, Pwhite(0.5, 1.5, inf),
		\rel, Pwhite(1.0, 3.0, inf),
		\pan, Pwhite(-1.0, 1.0, inf),
	);
).play;

Pdef(\coldpat2,
	Pbind(
		\instrument, \lowdrone,
		\dur, Pseq([3, 5, 4], inf),
		\freq1, Pseq([1000, 1100], inf),
		\freq2, Pwhite(440, 444, inf)
	);
).play;
)


*/
